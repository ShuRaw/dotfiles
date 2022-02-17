local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_install = 'maintained',
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'