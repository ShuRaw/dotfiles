lua require('local_config_lsp')

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gw :lua vim.lsp.buf.document_symbol()<CR>
nnoremap gW :lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <c-d> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>af :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
