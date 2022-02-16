lua require('local_config_telescope')
nnoremap <space>f :lua require('telescope.builtin').git_files({})<CR>
nnoremap <space>fg :lua require('telescope.builtin').live_grep({})<CR>
nnoremap <space>ff :lua require('telescope.builtin').find_files({})<CR>
nnoremap <space>fd :Telescope file_browser<CR>
nnoremap <space>fv :lua require('local_config_telescope').cur_buff()<CR>
nnoremap <space>fb :lua require('telescope.builtin').buffers({})<CR>
nnoremap <space>fc :lua require('telescope.builtin').git_commits({})<CR>
