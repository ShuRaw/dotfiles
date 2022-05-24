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

local status_tele_builtin, telescope = pcall(require, "telescope.builtin")
if not status_tele_builtin then
  return
end

local current_buffer_fuzzy_find_wrapper = function()
  local curr_buffer_opts = {sorting_strategy = "ascending", layout_config = {prompt_position = "top"}}
  if status_tele_builtin then
    telescope.current_buffer_fuzzy_find(curr_buffer_opts)
  end
end

local git_files_wrapper = function()
  if status_tele_builtin then
    telescope.git_files({})
  end
end

local find_files_wrapper = function()
  if status_tele_builtin then
    telescope.find_files({search_dirs = {"./vimrcs/.config", "./"}})
  end
end

local live_grep_wrapper = function()
  if status_tele_builtin then
    telescope.live_grep()
  end
end

local grep_string_wrapper = function()
  if status_tele_builtin then
    local search_string = ""
    vim.ui.input(
      {prompt = "Search: "},
      function(input)
        search_string = input
      end
    )
    telescope.grep_string({search = search_string, search_dirs = {"./vimrcs/.config", "./"}})
  end
end

local opts = vim.opt

local toggle_cursor_line = function ()
  opts.cursorline = not opts.cursorline:get()
end

local toggle_crosshair = function ()
  opts.cursorline = not opts.cursorline:get()
  opts.cursorcolumn = not opts.cursorcolumn:get()
end

local toggle_numbers = function ()
  opts.number = not opts.number:get()
  opts.relativenumber = not opts.relativenumber:get()
end

local toggle_command = function ()
  opts.showcmd = not opts.showcmd:get()
end

local wk_ok, wk = pcall(require, "which-key")

if wk_ok then
  local space_opts = {}
  local direct_opts = {}
  local v_space_opts = {}
  space_opts.s = {
    name = "Split",
    v = {"<cmd>vsp<CR>", "Split vertically"},
    h = {"<cmd>sp<CR>", "Split horizontally"}
  }
  space_opts.n = {
    name = "Navigation",
    c = {toggle_cursor_line, "Toggle cursor line"},
    C = {toggle_crosshair, "Toggle crosshair"},
    n = {toggle_numbers, "Toggle numbers"},
    x = {toggle_command, "Toggle command"}
  }
  space_opts.b = {
    name = "Buffer",
    s = {
      current_buffer_fuzzy_find_wrapper,
      "Buffer search"
    },
    p = {"<cmd>BufferPrevious<CR>", "Next buffer"},
    n = {"<cmd>BufferNext<CR>", "Previous buffer"},
    j = {"<cmd>BufferMovePrevious<CR>", "Move left"},
    k = {"<cmd>BufferMoveNext<CR>", "Move right"},
    x = {"<cmd>BufferClose<CR>", "Close buffer"},
    X = {"<cmd>BufferCloseAllButCurrent<CR>", "Close Other buffers"},
    m = {"<cmd>BufferPick<CR>", "Pick mode"},
    M = {"<cmd>BufferPin<CR>", "Pin mode"},
    b = {"<cmd>BufferOrderByBufferNumber<CR>", "Orderby number"},
    d = {"<cmd>BufferOrderByDirectory<CR>", "Orderby directory"},
    l = {"<cmd>BufferOrderByLanguage<CR>", "Orderby language"}
  }
  space_opts.f = {
    name = "Files",
    g = {git_files_wrapper, "Git files"},
    r = {live_grep_wrapper, "Live grep"},
    s = {grep_string_wrapper, "Search"},
    f = {find_files_wrapper, "Files"},
    c = {"<cmd>Telescope git_commits<CR>", "Commit search"},
    x = {"<cmd>Format<CR>", "Format file"},
    e = {"<cmd>NvimTreeToggle<CR>", "File explorer"}
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
  space_opts.h = {
    name = "GitSigns",
    n = {"<cmd>Gitsigns next_hunk<CR>", "Next hunk"},
    p = {"<cmd>Gitsigns prev_hunk<CR>", "Prev hunk"},
    P = {"<cmd>Gitsigns preview_hunk<CR>", "Preview hunk"},
    s = {"<cmd>Gitsigns stage_hunk<CR>", "Stage hunk"},
    S = {"<cmd>Gitsigns stage_buffer<CR>", "Stage buffer"},
    r = {"<cmd>Gitsigns reset_hunk<CR>", "Reset hunk"},
    R = {"<cmd>Gitsigns reset_buffer<CR>", "Reset buffer"},
    u = {"<cmd>Gitsigns undo_stage_hunk<CR>", "Undo hunk"},
    b = {"<cmd>Gitsigns blame_line full=true<CR>", "Blame"},
    B = {"<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle blame"},
    d = {"<cmd>Gitsigns diffthis<CR>", "Diff"},
    D = {"<cmd>Gitsigns toggle_deleted<CR>", "Show deleted"}
  }
  space_opts.v = {
    name = "Vsnips",
    o = {"<cmd>VsnipOpen<CR>", "Open Snippets"},
    e = {"<cmd>VsnipOpenEdit<CR>", "Edit Snippets"},
    s = {"<Plug>(vsnip-select-text)", "Select"},
    c = {"<Plug>(vsnip-cut-text)", "Cut"}
  }
  v_space_opts.v = {
    name = "Vsnips",
    s = {"<Plug>(vsnip-select-text)", "Select"},
    c = {"<Plug>(vsnip-cut-text)", "Cut"}
  }
  direct_opts.g = {
    name = "Goto",
    D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declarations"},
    d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definitions"},
    i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation"},
    r = {"<cmd>lua vim.lsp.buf.references()<CR>", "Goto references"}
  }

  wk.register(space_opts, {prefix = "<space>"})
  wk.register(v_space_opts, {prefix = "<space>", mode = "v"})
  wk.register(direct_opts)
else
  g.nmap("<space>o", "<cmd>only<CR>")
  g.nmap("<space>sv", "<cmd>vsp<CR>")
  g.nmap("<space>sh", "<cmd>sp<CR>")
  g.nmap("<space>bh", "<cmd>bnext<CR>")
  g.nmap("<space>bl", "<cmd>bprevious<CR>")
end
