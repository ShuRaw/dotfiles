local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local status_ok_lsp, lspconfig = pcall(require, "lspconfig")
if not status_ok_lsp then
  return
end

local g = require("so.globals")

local servers = {
  "gopls",
  "pyright",
  "cssls",
  "cssmodules_ls",
  "tsserver",
  "sumneko_lua",
  "html",
  "angularls",
}

lsp_installer.setup(
  {
    ensure_installed = servers,
    automatic_installation = true -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  }
)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  g.nbmap(bufnr, "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
  local settings = {}
  if (server == "sumneko_lua") then
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim", "use"}
        }
      }
    }
  elseif (server == "cssls") then
    settings = {
      css = {
        lint = {
          unknownAtRules = "ignore"
        }
      },
      scss = {
        lint = {
          unknownAtRules = "ignore"
        }
      }
    }
  end

  -- It's important to have the object as this cause otherwise it doesn't map
  lspconfig[server].setup {
    on_attach = on_attach,
    settings = settings,
    capabilities = capabilities
  }
end

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
