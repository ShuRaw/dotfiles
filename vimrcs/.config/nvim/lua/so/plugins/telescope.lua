local g = require('so.globals')
local opts = {}
local curr_buffer_opts = '{ sorting_strategy = "ascending", layout_config = { prompt_position = "top" } }'
g.nmap('<space>f', '<cmd>lua require("telescope.builtin").git_files({})<CR>', true)
g.nmap('<space>fg',  '<cmd>lua require("telescope.builtin").live_grep({})<CR>', true)
g.nmap('<space>ff',  '<cmd>lua require("telescope.builtin").find_files({})<CR>', true)
g.nmap('<space>fd',  '<cmd>Telescope file_browser hidden=true<CR>', true)
g.nmap('<space>fv', string.format('<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(%s)<CR>', curr_buffer_opts), true)
g.nmap('<space>fb',  '<cmd>lua require("telescope.builtin").buffers({})<CR>', true)
g.nmap('<space>fc',  '<cmd>lua require("telescope.builtin").git_commits({})<CR>', true)
g.nmap('<space>fc',  '<cmd>lua require("telescope.builtin").git_commits({})<CR>', true)

return opts