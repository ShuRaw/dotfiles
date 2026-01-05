local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
  return
end

local status_ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lsp then
  return
end

local status_ok_lspcofig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspcofig then
  return
end

local g = require("so.globals")

mason.setup()

local servers = {
  "pyright",
  "cssls",
  "cssmodules_ls",
  "tsserver",
  "lua_ls",
  "html",
  "angularls",
  "graphql",
}

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  g.nbmap(bufnr, "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
  local settings = {}
  local filetypes = {}
  if server == "lua_ls" then
    settings = { Lua = { diagnostics = { globals = { "vim", "use" } } } }
  elseif server == "cssls" then
    settings = {
      css = { lint = { unknownAtRules = "ignore" } },
      scss = { lint = { unknownAtRules = "ignore" } },
    }
  elseif server == "graphql" then
    filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript" }
  end

  -- It's important to have the object as this cause otherwise it doesn't map
  if next(filetypes) == nil then
    lspconfig[server].setup({
      on_attach = on_attach,
      settings = settings,
      capabilities = capabilities,
    })
  else
    lspconfig[server].setup({
      on_attach = on_attach,
      settings = settings,
      capabilities = capabilities,
      filetypes = filetypes,
    })
  end
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
