vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Plugins
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { "williamboman/mason.nvim" }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update { with_sync = true }
      ts_update()
    end,
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  }
  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {
        direction = "float",
      }
    end,
  }
  use "nvim-tree/nvim-web-devicons"
  use {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "plugins.dashboard"
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
  }
  use {
    "lewis6991/gitsigns.nvim",
  }
  use {
    "norcalli/nvim-colorizer.lua",
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
  }
  use "MunifTanjim/prettier.nvim"
  use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }
  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  }
  use {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.autopairs"
    end,
  }
  use "MunifTanjim/nui.nvim"
  use "folke/noice.nvim"
  use "sainnhe/gruvbox-material"
  use "folke/tokyonight.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "windwp/nvim-ts-autotag"

  --
  -- Load plugins
  --
  local Popup = require "nui.popup"
  Popup {
    position = "40%",
  }
  require("noice").setup {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
      },
      -- height = 1,
      -- width = 80,
      -- position = 'bottom',
    },
    popupmenu = {
      enabled = true, -- enables the Noice popupmenu UI
      ---@type 'nui'|'cmp'
      backend = "nui", -- backend to use to show regular cmdline completions
      ---@type NoicePopupmenuItemKind|false
      -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
      kind_icons = {}, -- set to `false` to disable icons
    },
    lsp = {
      signature = { enabled = true },
      hover = { enabled = true },
      documentation = {
        opts = {
          border = { style = "single" },
          relative = "cursor",
          position = { row = 2 },
        },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
    },
  }

  require "plugins.catppuccin"
  require "plugins.comment"
  require "plugins.lsp"
  require "plugins.lspconfig"
  require "plugins.treesitter"
  require "plugins.lualine"
  require "plugins.telescope"
  require("telescope").load_extension "file_browser"
  require "plugins.which-key"
  require "plugins.gitsigns"
  require("colorizer").setup()
  require "plugins.null-ls"
  require "plugins.prettier"
  require("diffview").setup {}
  require "plugins.cmp"
  vim.cmd "highlight! WhichKeyFloat guibg=none"
  vim.cmd "highlight! WhichKeyBorder guibg=none"

  local builtin = require "telescope.builtin"
end)
