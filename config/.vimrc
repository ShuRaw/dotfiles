call plug#begin('~/.vim/plugged')

" Code Completion
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --ts-completer' }
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

" Navigation
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle', 'for': 'nerdtree' }

" For Better View
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'

" For Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

" For file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For motion
Plug 'easymotion/vim-easymotion'

" For code completion
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'

" For surround support
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" For copy-paste ease
Plug 'christoomey/vim-system-copy'

" For better star search
Plug 'nelstrom/vim-visual-star-search'

" For Tmux compatibility
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Running Tests
Plug 'janko-m/vim-test'

" Themes
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'

" This is for table mode
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Experimental
Plug 'puremourning/vimspector'
Plug 'heavenshell/vim-pydocstring'
Plug 'tmhedberg/SimpylFold'
Plug 'metakirby5/codi.vim'
Plug 'stsewd/fzf-checkout.vim'

call plug#end()

source ~/dotfiles/vim/theme.vim
source ~/dotfiles/vim/leader.vim
source ~/dotfiles/vim/common.vim
source ~/dotfiles/vim/macros.vim

" Plugin based file
source ~/dotfiles/vim/plug_nerdtree.vim
source ~/dotfiles/vim/plug_ycm.vim
source ~/dotfiles/vim/plug_vimspector.vim
source ~/dotfiles/vim/plug_ctrlp.vim
source ~/dotfiles/vim/plug_airline.vim
source ~/dotfiles/vim/plug_emmet.vim
source ~/dotfiles/vim/plug_ultisnips.vim
source ~/dotfiles/vim/plug_ale.vim
source ~/dotfiles/vim/plug_indent_guide.vim
source ~/dotfiles/vim/plug_vim_test.vim
source ~/dotfiles/vim/plug_autopair.vim
source ~/dotfiles/vim/plug_experimental.vim
