local g = require("so.globals")

-- For Typos
g.imap("ZZ", "<Esc>", true)

-- Easy command mode
g.mmap({"n", "v"}, ":", ";")
g.mmap({"n", "v"}, ";", ":")

-- Easy navigation with tmux
g.nmap("<C-J>", "<C-W><C-J>")
g.nmap("<C-K>", "<C-W><C-K>")
g.nmap("<C-L>", "<C-W><C-L>")
g.nmap("<C-H>", "<C-W><C-H>")

-- Easy splits
g.nmap("<space>sv", "<cmd>vsp<CR>")
g.nmap("<space>sh", "<cmd>sp<CR>")

-- Easy window resize + disable arrow keys
g.nmap("<left>", "<c-w><")
g.nmap("<right>", "<c-w>>")
g.nmap("<up>", "<c-w>+")
g.nmap("<down>", "<c-w>-")

-- Easy closing all files
g.nmap("<space>o", "<cmd>only<CR>")

g.nmap("<space>bh", "<cmd>bnext<CR>")
g.nmap("<space>bl", "<cmd>bprevious<CR>")

g.vmap(">", ">gv")
g.vmap("<", "<gv")
