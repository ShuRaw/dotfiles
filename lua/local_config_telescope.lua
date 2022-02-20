local telescope = require("telescope")
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

telescope.setup {
  defaults = {}
}

local custom_mappings = {}
custom_mappings.cur_buff = function()
  local opts = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top"
    }
  }
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

return custom_mappings
