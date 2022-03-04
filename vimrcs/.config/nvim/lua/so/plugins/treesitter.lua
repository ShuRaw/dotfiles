local opts = {}
opts.ensure_install = "maintained"
opts.hightlight = { enabled = true }
opts.indent = { enabled = true }

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
return opts
