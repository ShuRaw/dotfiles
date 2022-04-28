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
      luasnip = "[snip]",
      gh_issues = "[issues]",
      tn = "[TabNine]"
    }
  }
end

cmp.setup(
  {
    view = {
      entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
    formatting = {
      format = lspkind_config
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
    },
    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      ["<C-y>"] = cmp.config.disable,
      ["<C-e>"] = cmp.mapping(
        {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
        }
      ),
      ["<CR>"] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources(
      {
        {name = "nvim_lua"},
        {name = "nvim_lsp"},
        {name = "path", max_item_count = 3},
        {name = "luasnip", max_item_count = 3},
        {name = "buffer", keyword_length = 5, max_item_count = 3}
      },
      {
        {name = "treesitter"},
        {name = "tags"},
        {name = "rg"}
      }
    ),
    experimental = {
      ghost_text = true
    }
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
    sources = {
      {name = "buffer"}
    }
  }
)

cmp.setup.cmdline(
  ":",
  {
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
