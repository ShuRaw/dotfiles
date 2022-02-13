call plug#begin()

" Code compeltion and language server + snippets + file explorer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Handle git operations
Plug 'tpope/vim-fugitive'

" Handle search
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'

" Handle status line
Plug 'vim-airline/vim-airline'

" Handle themes and visuals
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'

" Handle navigation
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Handle notes and markdown
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

source ~/dotfiles/nvim/defaults.vim
source ~/dotfiles/nvim/coc.vim
source ~/dotfiles/nvim/airline.vim
source ~/dotfiles/nvim/indent_guides.vim
source ~/dotfiles/nvim/vim_wiki.vim
