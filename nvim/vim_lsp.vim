lua require('local_config_lsp')

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gw :lua vim.lsp.buf.document_symbol()<CR>
nnoremap gW :lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <space>s :lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>a :Telescope lsp_code_actions<CR>
nnoremap <space>r :lua vim.lsp.buf.rename()<CR>
nnoremap <space>dj :lua vim.diagnostics.goto_next()<CR>
nnoremap <space>dk :lua vim.diagnostics.goto_prev()<CR>
nnoremap <space>dl :Telescope diagnostics<CR>
