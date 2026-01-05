local execute = vim.api.nvim_command
local g = require("so.globals")

execute("packadd packer.nvim")
vim.cmd([[
  augroup packer_user_config
    autocmd!
    " autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")

    -- Very useful vim plugins
    use("nelstrom/vim-visual-star-search")

    -- Git and repeat stuff
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")

    -- Tmux plugins
    use("christoomey/vim-tmux-navigator")

    -- Notes amd markdown
    use("vimwiki/vimwiki")
    use("mattn/calendar-vim")

    -- DBUI
    use('tpope/vim-dadbod')
    use('tpope/vim-dadbod-ui')
    use('kristijanhusak/vim-dadbod-completion')

    -- Sablize UI
    use({ "karb94/neoscroll.nvim", config = g.mcon("neoscroll") })
    use({ "luukvbaal/stabilize.nvim", config = g.mcon("stabilize") })

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } }, config = g.mcon("telescope") })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", config = g.mcon("telescope.fzf", true) })

    -- Tree
    use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, config = g.mcon("nvim-tree") })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = { "p00f/nvim-ts-rainbow", "windwp/nvim-ts-autotag" },
      config = g.mcon("treesitter", false, "nvim-", ".configs"),
    })
    use({ "folke/twilight.nvim", config = g.mcon("twilight") })

    -- LSP related setup
    -- use {
    --   "williamboman/nvim-lsp-installer",
    --   {
    --     "neovim/nvim-lspconfig",
    --     config = g.mcon("lsp", true)
    --   }
    -- }

    -- Completion related setup
    use({ "hrsh7th/nvim-cmp", requires = { "onsails/lspkind-nvim" }, config = g.mcon("cmp", true) })
    use({ "windwp/nvim-autopairs", config = g.mcon("autopairs", true) })
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
    use("mattn/emmet-vim")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use { 'saadparwaiz1/cmp_luasnip' }

    -- Formatting related setup
    use({ "mhartington/formatter.nvim", config = g.mcon("formatter") })

    -- Comment related setup
    use({ "joosepalviste/nvim-ts-context-commentstring", config = g.mcon("ts_context_commentstring") })
    use({
      "numToStr/Comment.nvim",
      requires = { "joosepalviste/nvim-ts-context-commentstring" },
      config = g.mcon("Comment"),
    })

    -- Status line related setup
    use({ "nvim-lualine/lualine.nvim", cofig = g.mcon("lualine") })
    --[[ use({ "kdheepak/tabline.nvim", config = g.mcon("tabline") }) ]]
    use 'romgrk/barbar.nvim'

    -- Indent visualizer
    use({ "lukas-reineke/indent-blankline.nvim", config = g.mcon("ilb") })

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin", config = g.mcon('catppuccin') }
    --[[ use({ "navarasu/onedark.nvim", config = g.mcon("onedark", true) }) ]]
    use({ "norcalli/nvim-colorizer.lua", config = g.mcon("colorizer") })

    -- Experimental plugins
    use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
    use("lpinilla/vim-codepainter")
    use({ "folke/which-key.nvim", config = g.mcon("which", false, "", "-key") })
    --[[ use {"NTBBloodbath/rest.nvim", config = g.mcon("rest", false, "", "-nvim")} ]]
    use({ "lewis6991/gitsigns.nvim", config = g.mcon("gitsigns") })
    use({ "mfussenegger/nvim-dap", config = g.mcon("dap", true) })
    use({ "theHamsta/nvim-dap-virtual-text", config = g.mcon("virtual", false, "nvim-dap-", "-text") })
    use({ "rcarriga/nvim-dap-ui", config = g.mcon("dapui") })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    --New Mason
    use({
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      config = g.mcon("mason", true),
    })

    --New Snippets
    use({
      "chrisgrieser/nvim-scissors",
      config = function()
        require("scissors").setup({
          snippetDir = "~/dotfiles/snippets/",
        })
      end,
    })
    use({
      "L3MON4D3/LuaSnip",
      tag = "v2.2.0",
      run = "make install_jsregexp",
    })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
