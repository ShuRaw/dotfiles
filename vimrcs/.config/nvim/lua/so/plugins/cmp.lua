vim.opt.completeopt = {"menu", "menuone", "noselect"}
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")

local lspkind_config = {}

if lspkind_ok then
  lspkind_config =
    lspkind.cmp_format {
    with_text = true,
    menu = {
      buffer = "[buf]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[api]",
      path = "[path]",
      vsnip = "[snip]",
      gh_issues = "[issues]",
      tn = "[TabNine]"
    }
  }
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup(
  {
    view = {
      entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
    formatting = {
      format = lspkind_config
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = cmp.mapping.preset.insert(
      {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            if vim.fn["vsnip#available"](1) == 1 then
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
            else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
          end,
          {"i", "s"}
        ),
        ["<S-Tab>"] = cmp.mapping(
          function()
            if vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
          end,
          {"i", "s"}
        )
      }
    ),
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "vsnip"},
        {name = "path", max_item_count = 5},
        {name = "buffer", keyword_length = 5, max_item_count = 3}
      },
      {
        {name = "treesitter"},
        {name = "tags"},
        {name = "rg"}
      }
    )
  }
)

cmp.setup.filetype(
  "gitcommit",
  {
    sources = cmp.config.sources(
      {
        {name = "buffer"}
      }
    )
  }
)

cmp.setup.cmdline(
  "/",
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      {name = "buffer"}
    }
  }
)

cmp.setup.cmdline(
  ":",
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)
