local opts = {
  easing_function = "sine"
}
local status_ok, config = pcall(require, "neoscroll.config")
if not status_ok then
  return
end

local settings = {}

settings["<C-u>"] = {"scroll", {"-vim.wo.scroll", "true", "350", [['circular']]}}
settings["<C-d>"] = {"scroll", {"vim.wo.scroll", "true", "350", [['circular']]}}
settings["<C-b>"] = {"scroll", {"-vim.api.nvim_win_get_height(0)", "true", "500", [['circular']]}}
settings["<C-f>"] = {"scroll", {"vim.api.nvim_win_get_height(0)", "true", "500", [['circular']]}}
settings["<C-y>"] = {"scroll", {"-0.10", "false", "100", [['circular']]}}
settings["<C-e>"] = {"scroll", {"0.10", "false", "100", [['circular']]}}
settings["zt"] = {"zt", {"300"}}
settings["zz"] = {"zz", {"300"}}
settings["zb"] = {"zb", {"300"}}
config.set_mapping(settings)

return opts
