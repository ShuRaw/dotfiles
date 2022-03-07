local ok, plug = pcall(require, "onedark")
local opts = {}

opts.style = "darker" -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
opts.toggle_style_key = "<space>tt" -- Default keybinding to toggle
opts.toggle_style_list = {"dark", "darker", "cool", "deep", "warm", "warmer", "light"} -- List of styles to toggle between
opts.code_style = {
  comments = "italic"
}
opts.diagnostics = {
  darker = true, -- darker colors for diagnostic
  undercurl = true, -- use undercurl instead of underline for diagnostics
  background = true -- use background color for virtual text
}

if ok then
  plug.setup(opts)
  plug.load()
end
