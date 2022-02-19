local function prettierd(type)
  local args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))}

  if (type == "s") then
    table.insert(args, "--single-quote")
  else
    table.insert(args, "--double-quote")
  end

  local function format()
    return {
      exe = "prettierd",
      args = args,
      stdin = true
    }
  end

  return {format}
end

require("formatter").setup(
  {
    filetype = {
      javascript = prettierd("s"),
      typescriptreact = prettierd("s"),
      json = prettierd("d"),
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
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.py,*.ts,*.tsx FormatWrite
augroup END
]],
  true
)
