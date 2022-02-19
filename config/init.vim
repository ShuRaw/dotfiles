call plug#begin()

" Handle git operations
Plug 'tpope/vim-fugitive'

" Handle search
Plug 'nelstrom/vim-visual-star-search'

" Handle status line
Plug 'vim-airline/vim-airline'

" Handle themes and visuals
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'

" Handle navigation
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Handle notes and markdown
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" Handle telescope plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Handle telescope extensions
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Handle treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'p00f/nvim-ts-rainbow'

" Handle LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'

" Handle Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'mattn/emmet-vim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'

" Handle formatting
Plug 'mhartington/formatter.nvim'

call plug#end()

source ~/dotfiles/nvim/defaults.vim
source ~/dotfiles/nvim/airline.vim
source ~/dotfiles/nvim/indent_guides.vim
source ~/dotfiles/nvim/vim_wiki.vim
source ~/dotfiles/nvim/vim_telescope.vim
source ~/dotfiles/nvim/vim_treesitter.vim
source ~/dotfiles/nvim/vim_lsp.vim
source ~/dotfiles/nvim/vim_cmp.vim
source ~/dotfiles/nvim/vim_formatter.vim
