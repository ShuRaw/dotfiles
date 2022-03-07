local lsp_installer = require("nvim-lsp-installer")
local g = require("so.globals")

local servers = {"gopls", "pyright", "cssls", "cssmodules_ls", "tsserver", "sumneko_lua", "html"}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

g.nmap("<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
g.nmap("<space>dj", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
g.nmap("<space>dk", "<cmd>lua vim.diagnostic.goto_next()<CR>")
g.nmap("<space>dl", "<cmd>Telescope diagnostics<CR>")
g.nmap("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  g.nbmap(bufnr, "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  g.nbmap(bufnr, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  g.nbmap(bufnr, "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  g.nbmap(bufnr, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  g.nbmap(bufnr, "<space>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  g.nbmap(bufnr, "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  g.nbmap(bufnr, "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  g.nbmap(bufnr, "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  g.nbmap(bufnr, "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  g.nbmap(bufnr, "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  g.nbmap(bufnr, "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  g.nbmap(bufnr, "<space>a", "<cmd>Telescope lsp_code_actions<CR>")
  g.nbmap(bufnr, "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  g.nbmap(bufnr, "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
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
