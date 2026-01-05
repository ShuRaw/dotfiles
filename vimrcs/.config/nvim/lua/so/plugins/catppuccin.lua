local opts = {}
opts.integrations = {
  telescope = {
    enabled = true,
  },
  cmp = true,
  dap = true,
  dap_ui = true,
  gitsigns = true,
  nvimtree = true,
  treesitter = true,
  notify = false,
  markdown = true,
  indent_blankline = {
    enabled = true,
    scope_color = "lavender",
    colored_indent_levels = false,
  },
}
opts.transparent_background = true
opts.show_end_of_buffer = true

return opts
