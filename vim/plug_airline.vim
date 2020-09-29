scriptencoding=utf-8
" This file contians all the settings relative to airline
" Airline is a plugin that will show a better UI interface for the status line

" This show airline in normal vim window
set laststatus=2

" This enables the list of buffers
let g:airline#extensions#tabline#enabled = 1

" This shows just the file names
let g:airline#extension#tabline#fnamemod = ':t'

" Show buffer number over the name
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Show tabnumber in tabline
let g:airline#extensions#tabline#show_tab_nr = 1

" This enables powerline fonts for airline
let g:airline_powerline_fonts = 1

" This is to enable the fugitive on the status line
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" This is for ale setting
let g:airline#extensions#ale#enabled = 1

" Theme for airline
let g:airline_theme='onedark'
