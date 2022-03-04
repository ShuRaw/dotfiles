local opts = {}

opts.style = 'darker' -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
opts.toggle_style_key = '<leader>ts' -- Default keybinding to toggle
opts.toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'} -- List of styles to toggle between
    opts.code_style = {
        comments = 'italic'
    }
opts.diagnostics = {
darker = true, -- darker colors for diagnostic
undercurl = true,   -- use undercurl instead of underline for diagnostics
background = true,    -- use background color for virtual text
}

return opts