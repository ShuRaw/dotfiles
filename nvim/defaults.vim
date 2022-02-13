if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

scriptencoding=utf-8
set number
set relativenumber
set colorcolumn=81,121
set textwidth=0
set wrap linebreak
set showcmd
set list
set listchars=tab:▸\ ,trail:-
set hidden
set splitbelow
set splitright
set diffopt+=vertical
set mouse=a
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

imap ZZ <Esc>
nnoremap : ;
vnoremap : ;
nnoremap ; :
vnoremap ; :
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>v :vs<CR>
nnoremap <leader>s :sp<CR>
nnoremap <c-t> <c-w>T
nnoremap <left> <c-w><
nnoremap <right> <c-w>>
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <leader>o :only<CR>

set termguicolors
set background=dark
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
colorscheme onedark

autocmd FileType scss setl iskeyword+=@-@
let g:python3_host_prog="~/dotfiles/.env/bin/python3"
