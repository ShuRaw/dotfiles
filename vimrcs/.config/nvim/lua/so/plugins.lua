local execute = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd
local g = require("so.globals")

execute("packadd packer.nvim")
autocmd(
  "BufWritePost",
  {
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile"
  }
)

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"
    -- Very useful vim plugins
    use "nelstrom/vim-visual-star-search"
    -- Git and repeat stuff
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    -- Tmux plugins
    use "christoomey/vim-tmux-navigator"
    -- Notes amd markdown
    use "vimwiki/vimwiki"
    use "mattn/calendar-vim"

    -- Sablize UI
    use {"karb94/neoscroll.nvim", config = g.mcon("neoscroll")}
    use {"luukvbaal/stabilize.nvim", config = g.mcon("stabilize")}

    -- Telescope
    use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/plenary.nvim"}}, config = g.mcon("telescope")}
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make", config = g.mcon("telescope.fzf", true)}

    -- Tree
    use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons"}, config = g.mcon("nvim-tree")}

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = {"p00f/nvim-ts-rainbow"},
      config = g.mcon("treesitter", false, "nvim-", ".configs")
    }

    -- LSP related setup
    use {"williamboman/nvim-lsp-installer", requires = {"neovim/nvim-lspconfig"}, config = g.mcon("lsp", true)}

    -- Completion related setup
    use {"hrsh7th/nvim-cmp", requires = {"onsails/lspkind-nvim"}, config = g.mcon("cmp", true)}
    use {"windwp/nvim-autopairs", config = g.mcon("autopairs", true)}
    use {"L3MON4D3/LuaSnip", config = g.mcon("luasnip", true)}
    use "mattn/emmet-vim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"

    -- Formatting related setup
    use {"mhartington/formatter.nvim", config = g.mcon("formatter")}

    -- Comment related setup
    use {
      "numToStr/Comment.nvim",
      requires = {"JoosepAlviste/nvim-ts-context-commentstring"},
      config = g.mcon("Comment")
    }

    -- Status line related setup
    use {"nvim-lualine/lualine.nvim", cofig = g.mcon("lualine")}
    use {"kdheepak/tabline.nvim", config = g.mcon("tabline")}

    -- Indent visualizer
    use {"lukas-reineke/indent-blankline.nvim", config = g.mcon("indent_blankline")}

    -- Theme
    use {"navarasu/onedark.nvim", config = g.mcon("onedark", true)}
  end
)
