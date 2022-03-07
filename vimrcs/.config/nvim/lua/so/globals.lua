local map = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap
local options = {noremap = true, silent = true}
local debug = false

local nmap = function(trigger, operation, no_options)
  if no_options then
    map("n", trigger, operation, {})
  else
    map("n", trigger, operation, options)
  end
end

local nbmap = function(bufnr, trigger, operation, no_options)
  if no_options then
    bmap(bufnr, "n", trigger, operation, {})
  else
    bmap(bufnr, "n", trigger, operation, options)
  end
end

local imap = function(trigger, operation, no_options)
  if no_options then
    map("i", trigger, operation, {})
  else
    map("i", trigger, operation, options)
  end
end

local vmap = function(trigger, operation, no_options)
  if no_options then
    map("v", trigger, operation, {})
  else
    map("v", trigger, operation, options)
  end
end

local mmap = function(modes, trigger, operation, no_options)
  for _, mode in ipairs(modes) do
    if no_options then
      map(mode, trigger, operation, {})
    else
      map(mode, trigger, operation, options)
    end
  end
end

local pbug = function(str)
  if (debug) then
    print(str)
  end
end

local ptab = function(str)
  print(vim.inspect(str))
end

local mcon = function(plug, hasFullConfig, pre, post)
  local lplug = plug

  if (pre) then
    lplug = pre .. lplug
  end

  if (post) then
    lplug = lplug .. post
  end

  if not hasFullConfig then
    local plug_ok, rplug = pcall(require, lplug)
    local splug_ok, splug = pcall(require, "so.plugins." .. plug)
    pbug("Configuring " .. lplug)

    if not plug_ok then
      pbug("Failed to require " .. plug)
      return
    end

    if not splug_ok then
      pbug("Loading basic setup for " .. plug)
      rplug.setup({})
    else
      pbug("Loading custom setup for " .. plug)
      rplug.setup(splug)
    end
  else
    pbug("Off-loaded " .. plug)
    require("so.plugins." .. plug)
  end
end

local globals = {}
globals.map = map
globals.nmap = nmap
globals.nbmap = nbmap
globals.imap = imap
globals.vmap = vmap
globals.mmap = mmap
globals.pbug = pbug
globals.ptab = ptab
globals.mcon = mcon
return globals
