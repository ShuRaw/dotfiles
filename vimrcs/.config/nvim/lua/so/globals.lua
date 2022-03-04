local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
local debug = true

local nmap = function(trigger, operation, has_options)
  if has_options then
    map('n', trigger, operation, options)
  else
    map('n', trigger, operation, {})
  end
end

local imap = function(trigger, operation, has_options)
  if has_options then
    map('i', trigger, operation, options)
  else
    map('i', trigger, operation, {})
  end
end

local vmap = function(trigger, operation, has_options)
  if has_options then
    map('v', trigger, operation, options)
  else
    map('v', trigger, operation, {})
  end
end

local mmap = function(modes, trigger, operation, has_options)
  for _, mode in ipairs(modes) do
   if has_options then
     map(mode, trigger, operation, options)
   else
     map(mode, trigger, operation, {})
   end
  end
end

local pbug = function(str)
  if(debug) then
    print(str)
  end
end

local ptab = function(str)
  print(vim.inspect(str))
end

local mcon = function (plug, isLodable, pre, post)
  local lplug = plug
  if(pre) then
    lplug = pre .. lplug
  end
  if(post) then
    lplug = lplug .. post
  end
  local plug_ok, rplug = pcall(require, lplug)
  local splug = require('so.plugins.' .. plug)
  if not plug_ok then
    pbug('Failed to require ' .. plug)
    return
  end
  rplug.setup(splug)
  if isLodable then
    pbug('Loading ' .. plug)
    rplug.load()
  end
end

globals = {}
globals.map= map
globals.nmap= nmap
globals.imap= imap
globals.vmap= vmap
globals.mmap= mmap
globals.pbug= pbug
globals.ptab= ptab
globals.mcon= mcon
return globals
