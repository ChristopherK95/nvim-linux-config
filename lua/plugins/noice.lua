-- local Popup = require "nui.popup"
-- Popup {
--   position = "40%",
-- }
require("noice").setup {
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    format = {
      cmdline = { pattern = "^:", icon = ">_", lang = "vim" },
    },
  },
  messages = {
    enabled = true,
    view = "notify",
    view_history = "messages",
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
    backend = "cmp", -- backend to use to show regular cmdline completions
    ---@type NoicePopupmenuItemKind|false
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
    kind_icons = {}, -- set to `false` to disable icons
  },
  lsp = {
    progress = {
      enabled = false,
    },
    hover = { enabled = true },
    documentation = {
      view = "hover",
      opts = {
        border = { style = "single" },
        relative = "cursor",
        position = { row = 2 },
      },
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = false,
  },
}

vim.keymap.set({ "n", "i" }, "<S-Down>", function()
  require("noice.lsp").scroll(4)
end)
vim.keymap.set({ "n", "i" }, "<S-Up>", function()
  require("noice.lsp").scroll(-4)
end)
