local cmp = require("cmp")

cmp.setup(
  {
    view = {
      entries = "custom" -- can be "custom", "wildmenu" or "native"
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