vim.opt.completeopt = {"menu", "menuone", "noselect"}
local autocmd = vim.cmd
local cmp_ok, cmp = pcall(require, "cmp")
local lspkind_ok, lspkind = pcall(require, "lspkind")

autocmd(
  [[
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]]
)

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

if cmp_ok then
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
          {name = "nvim_lsp", max_item_count = 5},
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
      },
      documentation = {}
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
end
