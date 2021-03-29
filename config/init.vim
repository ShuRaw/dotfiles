call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

Plug 'ryanoasis/vim-devicons'
Plug 'nelstrom/vim-visual-star-search'

Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

source ~/dotfiles/nvim/defaults.vim
source ~/dotfiles/nvim/coc.vim
source ~/dotfiles/nvim/airline.vim
source ~/dotfiles/nvim/indent_guides.vim
source ~/dotfiles/nvim/vim_wiki.vim
