local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
local cmp_ok, cmp = pcall(require, "cmp")

if autopairs_ok then
  local Rule = require("nvim-autopairs.rule")
  local ts_conds = require("nvim-autopairs.ts-conds")
  if cmp_ok then
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))
  end
  autopairs.setup(
    {
      disable_filetype = {"TelescopePrompt"},
      check_ts = true,
      enable_check_bracket_line = false,
      ts_config = {
        lua = {"string"},
        javascript = {"template_string"},
        java = false
      }
    }
  )

  autopairs.add_rules(
    {
      Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({"string", "comment"})),
      Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({"function"}))
    }
  )
end
