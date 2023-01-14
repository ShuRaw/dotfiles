local opts = {}

opts.ensure_installed = {"python", "lua", "javascript", "typescript", "tsx", "markdown", "http", "json", "scss", "html"}
opts.sync_install = false
opts.highlight = {
  enable = true,
  additional_vim_regex_highlighting = false
}
opts.indent = {enabled = true}
opts.context_commentstring = {
  enable = true,
  enable_autocmd = false
}
opts.rainbow = {
  enable = true,
  extended_mode = true,
  max_file_lines = nil
}
opts.autotag = {
  enable = true
}
opts.playground = {
  enable = true,
  disable = {},
  updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
  persist_queries = false, -- Whether the query persists across vim sessions
  keybindings = {
    toggle_query_editor = "o",
    toggle_hl_groups = "i",
    toggle_injected_languages = "t",
    toggle_anonymous_nodes = "a",
    toggle_language_display = "I",
    focus_language = "f",
    unfocus_language = "F",
    update = "R",
    goto_node = "<cr>",
    show_help = "?"
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
return opts
