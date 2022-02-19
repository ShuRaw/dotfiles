local autopairs = require('nvim-autopairs')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local ts_conds = require('nvim-autopairs.ts-conds')
local Rule = require('nvim-autopairs.rule')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex =''}}))

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  check_ts = true,
  enable_check_bracket_line = false,
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})

-- press % => %% only while inside a comment or string
autopairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
