-- Function to handle prettierd config for various filetype
local g = require("so.globals")
local util = require("formatter.util")

-- Formatter self setup options
local opts = {}
opts.filetype = {
  typescriptreact = {
    function()
      return {
        exe = "noglob prettierd",
        args = { vim.api.nvim_buf_get_name(0) },
        stdin = true,
      }
    end,
  },
  scss = {
    function()
      return {
        exe = "prettierd",
        args = { vim.api.nvim_buf_get_name(0) },
        stdin = true,
      }
    end,
  },
  typescript = {
    function()
      return {
        exe = "noglob prettierd",
        args = { vim.api.nvim_buf_get_name(0) },
        stdin = true,
      }
    end,
  },
  json = {
    function()
      return {
        exe = "prettierd",
        args = { vim.api.nvim_buf_get_name(0) },
        stdin = true,
      }
    end,
  },
  javascript = {
    function()
      return {
        exe = "prettierd",
        args = { vim.api.nvim_buf_get_name(0) },
        stdin = true,
      }
    end,
  },
  html = {
    function()
      return {
        exe = "prettierd",
        args = { vim.api.nvim_buf_get_name(0) },
        stdin = true,
      }
    end,
  },
  lua = {
    function()
      return {
        exe = "stylua",
        args = {
          "--indent-type Spaces",
          "--indent-width 2",
          "--search-parent-directories",
          "--stdin-filepath",
          util.escape_path(util.get_current_buffer_file_path()),
          "--",
          "-",
        },
        stdin = true,
      }
    end,
  },
  python = {
    function()
      return { exe = "black", args = { "-" }, stdin = true }
    end,
  },
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
