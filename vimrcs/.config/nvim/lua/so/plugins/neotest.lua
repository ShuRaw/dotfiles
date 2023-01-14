local opts = {}

opts.adapters = {
  require("neotest-python"),
  require("neotest-plenary"),
  require("neotest-go"),
  require("neotest-jest")
}

return opts
