vim.g.vimwiki_list = {{path = "~/dotfiles/wiki/notes/", syntax = "markdown", ext = ".md"}}
vim.g.bufferline = {icon_pinned = "車"}

local set = vim.opt

set.number = false
set.relativenumber = false
set.colorcolumn = {"81", "121"}
set.textwidth = 0
set.wrap = false
set.linebreak = true
set.showcmd = false
set.list = true
set.listchars = {tab = "▸ ", trail = "·"}
set.hidden = true
set.splitbelow = true
set.splitright = true
set.mouse = "a"
set.backup = false
set.cmdheight = 2
set.updatetime = 300
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smartindent = true -- make indenting smarter again
set.smarttab = true
set.conceallevel = 0 -- so that `` is visible in markdown files
set.fileencoding = "utf-8" -- the encoding written to a file
set.hlsearch = true -- highlight all matches on previous search pattern
set.ignorecase = true -- ignore case in search patterns
set.smartcase = true -- smart case
set.pumheight = 10 -- pop up menu height
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
set.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
set.swapfile = false -- creates a swapfile
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.undofile = true
set.undodir = ".vim/undotree" -- enable persistent undo
set.cursorline = false -- highlight the current line
set.numberwidth = 2 -- set number column width to 2 {default 4}
set.scrolloff = 8 -- is one of my fav
set.sidescrolloff = 8
set.diffopt:append "vertical"
set.diffopt:append "iwhite"
set.shortmess:append "c"
set.whichwrap:append "<,>,[,],h,l"
-- set.iskeyword:append "-"
set.laststatus = 3
set.lazyredraw = true

-- Fixed for fold update when opening files from telescope
local group = vim.api.nvim_create_augroup("Handle Folds", {clear = true})
vim.api.nvim_create_autocmd(
  "BufEnter",
  {command = "normal zx", group = group, pattern = {"*.js", "*.ts", "*.py", "*.jsx", "*.tsx", "*.lua"}}
)

-- Fixed for handling File Tree offset area
local status_nvt, nvt = pcall(require, "nvim-tree.events")
if not status_nvt then
  return
end
local status_bufl, bufl = pcall(require, "bufferline.state")
if not status_bufl then
  return
end

nvt.on_tree_open(
  function()
    bufl.set_offset(31, "EXPLORER")
  end
)

nvt.on_tree_close(
  function()
    bufl.set_offset(0)
  end
)
