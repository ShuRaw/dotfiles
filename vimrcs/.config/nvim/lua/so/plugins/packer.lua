local g = require("so.globals")
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.utils").float{border="rounded"}
    end
  }
}
