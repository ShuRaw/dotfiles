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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
return opts
