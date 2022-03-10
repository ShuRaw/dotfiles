local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.snippets = {
  all = {
    -- Available in any filetype
    ls.parser.parse_snippet("expand", "-- this is what was expanded!")
  },
  lua = {
    ls.parser.parse_snippet("lf", "-- Defined in $TM_FILENAME\nlocal $1 = function($2)\n  $0\nend"),
    ls.parser.parse_snippet("mf", "local $1 = function($2)\n$0\nend"),
    s(
      "req",
      fmt(
        "local {} = require('{}')",
        {
          i(1, "function_name"),
          rep(1)
        }
      )
    ),
    s(
      "preq",
      fmt(
        [[
local status_ok, {} = pcall(require, "{}")
if not status_ok then
  return
end
{}
]],
        {
          i(1, "function_name"),
          rep(1),
          i(0)
        }
      )
    )
  }
}
