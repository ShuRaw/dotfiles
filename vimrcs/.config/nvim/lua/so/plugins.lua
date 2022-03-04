local execute = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd
local g = require('so.globals')

execute('packadd packer.nvim')
autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Very useful vim plugins
  use 'nelstrom/vim-visual-star-search'
  -- Git and repeat stuff
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  -- Tmux plugins
  use 'christoomey/vim-tmux-navigator'
  -- Notes amd markdown
  use 'vimwiki/vimwiki'
  use 'mattn/calendar-vim'

  -- Sablize UI
  use {'karb94/neoscroll.nvim', config=g.mcon('neoscroll') }
  use {'luukvbaal/stabilize.nvim', config=g.mcon('stabilize') }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }, config = g.mcon('telescope') }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, config = g.mcon('nvim-tree') }

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run= ':TSUpdate', config = g.mcon('treesitter', false, 'nvim-', '.configs')}
  use 'windwp/nvim-autopairs'
  use 'p00f/nvim-ts-rainbow'

  -- Theme
  use { 'navarasu/onedark.nvim', config = g.mcon('onedark', true) }
end)
