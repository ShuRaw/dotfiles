vim.g.python3_host_prog = "~/dotfiles/.env/bin/python3"
vim.g.vimwiki_list = {{path = "~/dotfiles/wiki/notes/", syntax = "markdown", ext = ".md"}}

local set = vim.opt

set.number = true
set.relativenumber = true
set.colorcolumn = {"81", "121"}
set.textwidth = 0
set.wrap = false
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
set.cmdheight = 2
set.updatetime = 300
set.shortmess = set.shortmess + "c"
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smartindent = true                      -- make indenting smarter again
set.smarttab = true
set.conceallevel = 0                        -- so that `` is visible in markdown files
set.fileencoding = "utf-8"                  -- the encoding written to a file
set.hlsearch = true                         -- highlight all matches on previous search pattern
set.ignorecase = true                       -- ignore case in search patterns
set.smartcase = true                        -- smart case
set.pumheight = 10                          -- pop up menu height
set.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
set.swapfile = false                        -- creates a swapfile
set.timeoutlen = 500                       -- time to wait for a mapped sequence to complete (in milliseconds)
set.undodir = '.vim/undotree'                         -- enable persistent undo
set.undofile = true                         -- enable persistent undo
set.updatetime = 300                        -- faster completion (4000ms default)
set.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.cursorline = true                       -- highlight the current line
set.numberwidth = 4                         -- set number column width to 2 {default 4}
set.scrolloff = 8                           -- is one of my fav
set.sidescrolloff = 8
set.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
