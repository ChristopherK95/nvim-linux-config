local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect

      require("lsp-zero.settings").preset {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
      },
    },
    config = function()
      require "plugins.cmp"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      { "williamboman/mason.nvim" },
    },
    config = function()
      require "plugins.lspconfig"
      require "plugins.lsp"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("lazy").setup { { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } }
      local ts_update = require("nvim-treesitter.install").update { with_sync = true }
      ts_update()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    init = function()
      require "plugins.lualine"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      require "plugins.telescope"
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  "nvim-tree/nvim-web-devicons",
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "plugins.dashboard"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require "plugins.which-key"
    end,
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.gitsigns"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
  },
  "MunifTanjim/prettier.nvim",
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  "MunifTanjim/nui.nvim",
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- opts = {
    --   cmdline = {
    --     enabled = true,
    --     view = "cmdline",
    --     format = {
    --       cmdline = { pattern = "^:", icon = ":", lang = "vim" },
    --     },
    --   },
    -- },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    init = function()
      require "plugins.noice"
    end,
  },
  "sainnhe/gruvbox-material",
  "folke/tokyonight.nvim",
  {
    "rebelot/kanagawa.nvim",
    init = function()
      require "plugins.kanagawa"
    end,
  },
  { "catppuccin/nvim", name = "catppuccin" },
  "windwp/nvim-ts-autotag",
  { "kevinhwang91/nvim-bqf", ft = "qf" },
  { "junegunn/fzf", build = "./install --bin" },
  {
    "nvimdev/guard.nvim",
    config = function()
      require "plugins.guard"
    end,
  },
  {
    "b0o/incline.nvim",
    config = function()
      require "plugins.incline"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require "plugins.autotag"
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "RaafatTurki/corn.nvim",
    config = function()
      require "plugins.corn"
    end,
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
