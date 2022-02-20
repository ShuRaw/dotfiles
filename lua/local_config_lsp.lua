local lsp_installer = require("nvim-lsp-installer")

local servers = {"gopls", "pyright", "cssls", "cssmodules_ls", "tsserver", "sumneko_lua", "html"}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

local k_opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", k_opts)
vim.api.nvim_set_keymap("n", "<space>dj", "<cmd>lua vim.diagnostic.goto_prev()<CR>", k_opts)
vim.api.nvim_set_keymap("n", "<space>dk", "<cmd>lua vim.diagnostic.goto_next()<CR>", k_opts)
vim.api.nvim_set_keymap("n", "<space>dl", "<cmd>Telescope diagnostics<CR>", k_opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", k_opts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<space>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    k_opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>a", "<cmd>Telescope lsp_code_actions<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", k_opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", k_opts)
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
