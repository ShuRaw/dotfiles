-- local action_state = require('telescope.actions.state')
require('telescope').setup {
  defaults = {
    -- prompt_prefix = "$ ",
    -- mappings = {
    --   i = {
    --     ["<c-g>"] = function()
    --       print(vim.inspect(action_state.get_selected_entry()))
    --     end
    --   }
    -- }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
require('telescope').load_extension('file_browser')

local custom_mappings = { }
custom_mappings.cur_buff = function()
  local opts = {
    sorting_strategy="ascending",
    layout_config={
      prompt_position="top"
    }
  }

  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

return custom_mappings
