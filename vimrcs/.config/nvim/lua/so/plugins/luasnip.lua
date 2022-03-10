local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    active = {
      virt_text = {
        {
          "<-",
          "Error"
        }
      }
    }
  }
}

vim.keymap.set(
  {"i", "s"},
  "<c-s>j",
  function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,
  {silent = true}
)

vim.keymap.set(
  {"i", "s"},
  "<c-s>k",
  function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,
  {silent = true}
)

vim.keymap.set(
  "i",
  "<c-s>s",
  function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end,
  {silent = true}
)

vim.keymap.set("n", "<space><space>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
