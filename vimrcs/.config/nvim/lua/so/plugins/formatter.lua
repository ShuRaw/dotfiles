-- Function to handle prettierd config for various filetype
local g = require("so.globals")

-- Formatter self setup options
local opts = {}
opts.filetype = {
  typescriptreact = {
    function()
      return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  },
  scss = {
    function()
      return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  },
  typescript = {
    function()
      return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  },
  json = {
    function()
      return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  },
  javascript = {
    function()
      return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  },
  html = {
    function()
      return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
  },
  lua = {
    function()
      return {
        exe = "luafmt",
        args = {"--indent-count", 2, "--stdin"},
        stdin = true
      }
    end
  },
  python = {
    function()
      return {
        exe = "black",
        args = {"-"},
        stdin = true
      }
    end
  }
}

-- Setting for format on save
-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.rs,*.lua,*.py,*.ts,*.tsx,*.json,*.scss FormatWrite
-- augroup END
-- ]],
--   true
-- )

return opts
