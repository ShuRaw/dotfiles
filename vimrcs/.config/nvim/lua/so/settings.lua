vim.g.python3_host_prog = "~/dotfiles/.env/bin/python3"
vim.g.vimwiki_list = {{path = "~/dotfiles/wiki/notes/", syntax = "markdown", ext = ".md"}}

local set = vim.opt

set.number = true
set.relativenumber = true
set.colorcolumn = {"81", "121"}
set.textwidth = 0
set.wrap = true
set.linebreak = true
set.showcmd = true
set.list = true
set.listchars = {tab = "▸ ", trail = "·"}
set.hidden = true
set.splitbelow = true
set.splitright = true
set.diffopt = set.diffopt + "vertical"
set.mouse = "a"
set.backup = false
set.writebackup = false
set.cmdheight = 2
set.updatetime = 300
set.shortmess = set.shortmess + "c"
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true
