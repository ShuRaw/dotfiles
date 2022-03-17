local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local g = require("so.globals")

local servers = {"gopls", "pyright", "cssls", "cssmodules_ls", "tsserver", "sumneko_lua", "html"}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  g.nbmap(bufnr, "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

lsp_installer.on_server_ready(
  function(server)
    local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach
    }

    if (server.name == "sumneko_lua") then
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = {"vim", "use"}
          }
        }
      }
    end
    server:setup(opts)
  end
)

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "rounded"
  }
)
