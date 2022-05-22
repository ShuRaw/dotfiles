local opts = {
  plugins = {
    marks= true,
    registers=true,
    spelling = {
      enabled = true,
      suggestions = 20
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true
    }
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>"
  },
  window = {
    border = "single",
    position = "bottom",
    margin = {1, 0, 1, 0},
    padding = {2, 2, 2, 2},
    winblend = 5
  },
  layout = {
    height = {min = 4, max = 25},
    width = {min = 20, max = 50},
    spacing = 3,
    align = "left"
  },
  ignore_missing = false,
  hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
  show_help = true,
  triggers = "auto"
}
return opts
