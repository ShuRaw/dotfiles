local g = require("so.globals")

-- For Typos
g.imap("ZZ", "<Esc>", true)

-- Easy command mode
g.mmap({"n", "v"}, ":", ";")
g.mmap({"n", "v"}, ";", ":")

-- Easy navigation with tmux
g.nmap("<C-J>", "<C-W><C-J>")
g.nmap("<C-K>", "<C-W><C-K>")
g.nmap("<C-L>", "<C-W><C-L>")
g.nmap("<C-H>", "<C-W><C-H>")

-- Easy window resize + disable arrow keys
g.nmap("<left>", "<c-w><")
g.nmap("<right>", "<c-w>>")
g.nmap("<up>", "<c-w>+")
g.nmap("<down>", "<c-w>-")

g.vmap(">", ">gv")
g.vmap("<", "<gv")

local wk_ok, wk = pcall(require, "which-key")

if wk_ok then
  local space_opts = {}
  local direct_opts = {}
  local curr_buffer_opts = '{ sorting_strategy = "ascending", layout_config = { prompt_position = "top" } }'
  space_opts.s = {
    name = "Split",
    v = {"<cmd>vsp<CR>", "Split vertically"},
    h = {"<cmd>sp<CR>", "Split horizontally"}
  }
  space_opts.b = {
    name = "Buffer",
    n = {"<cmd>bnext<CR>", "Next buffer"},
    p = {"<cmd>bprevious<CR>", "Prev buffer"},
    l = {"<cmd>Telescope buffers<CR>", "List buffer"},
    s = {
      string.format('<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(%s)<CR>', curr_buffer_opts),
      "Buffer search"
    }
  }
  space_opts.f = {
    name = "Files",
    g = {"<cmd>Telescope git_files<CR>", "Git files"},
    r = {"<cmd>Telescope live_grep<CR>", "Live grep"},
    s = {":Telescope grep_string search=", "Search"},
    f = {"<cmd>Telescope find_files<CR>", "Files"},
    c = {"<cmd>Telescope git_commits<CR>", "Commit search"},
    x = {"<cmd>Format<CR>", "Format file"},
    e = {"<cmd>NvimTreeToggle<CR>", "File explorer"},
    z = {"<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>", "Update Snippets"}
  }
  space_opts.l = {
    name = "Lsp",
    s = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help"},
    t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type def"},
    r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
    a = {"<cmd>CodeActionMenu<CR>", "Code actions"}
  }
  space_opts.w = {
    name = "Workspace",
    a = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add"},
    r = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove"},
    l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List"}
  }
  space_opts.d = {
    name = "Diagnostic",
    e = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Show errors"},
    k = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev error"},
    j = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "Next error"},
    l = {"<cmd>Telescope diagnostics<CR>", "Telescope errors"},
    q = {"<cmd>lua vim.diagnostic.setloclist()<CR>", "Loclist errors"}
  }
  space_opts.r = {
    name = "RestNvim",
    r = {"<cmd>lua require('rest-nvim').run()<CR>", "Execute"},
    f = {"<cmd>lua require('rest-nvim').run()<CR>", "Preview"},
    l = {"<cmd>lua require('rest-nvim').run()<CR>", "Last"}
  }
  space_opts.p = {
    name = "Packer",
    s = {"<cmd>PackerSync<CR>", "Sync"}
  }
  direct_opts.g = {
    name = "Goto",
    D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declarations"},
    d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definitions"},
    i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation"},
    r = {"<cmd>lua vim.lsp.buf.references()<CR>", "Goto references"}
  }

  wk.register(space_opts, {prefix = "<space>"})
  wk.register(direct_opts)
else
  g.nmap("<space>o", "<cmd>only<CR>")
  g.nmap("<space>sv", "<cmd>vsp<CR>")
  g.nmap("<space>sh", "<cmd>sp<CR>")
  g.nmap("<space>bh", "<cmd>bnext<CR>")
  g.nmap("<space>bl", "<cmd>bprevious<CR>")
end
