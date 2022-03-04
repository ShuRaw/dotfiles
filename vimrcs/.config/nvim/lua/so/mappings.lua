local g = require('so.globals')

-- For Typos
g.imap('ZZ', '<Esc>')

-- Easy command mode
g.mmap({'n', 'v'}, ':', ';', true)
g.mmap({'n', 'v'}, ';', ':', true)

-- Easy navigation with tmux
g.nmap('<C-J>', '<C-W><C-J>', true)
g.nmap('<C-K>', '<C-W><C-K>', true)
g.nmap('<C-L>', '<C-W><C-L>', true)
g.nmap('<C-H>', '<C-W><C-H>', true)

-- Easy splits
g.nmap('<space>sv', '<cmd>vsp<CR>', true)
g.nmap('<space>sh', '<cmd>sp<CR>', true)

-- Easy window resize + disable arrow keys
g.nmap('<left>', '<c-w><', true)
g.nmap('<right>', '<c-w>>', true)
g.nmap('<up>', '<c-w>+', true)
g.nmap('<down>', '<c-w>-', true)

-- Easy closing all files
g.nmap('<space>o', '<cmd>only<CR>', true)
