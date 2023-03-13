require "aerial"
local non_language_ft = { "fugitive", "startify" }

local navic = require("nvim-navic").get_location()

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
  },
  winbar = {
    lualine_a = {
      {
        "filename",
        path = 1,
        symbols = { modified = "~" },
        color = { fg = "#749CEA", bg = "transparent" },
      },
    },
    lualine_b = {
      {
        "aerial",
        sep = " > ",
        color = { fg = "#749CEA", bg = "transparent" },
      },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      "diff",
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info" },
      },
      {
        function()
          local msg = "No LSP"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()

          if next(clients) == nil then
            return msg
          end

          -- Check for utility buffers
          for ft in non_language_ft do
            if ft:match(buf_ft) then
              return ""
            end
          end

          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              -- return 'LSP:'..client.name  -- Return LSP name
              return "" -- Only display if no LSP is found
            end
          end

          return msg
        end,
        color = { fg = "#ffffff", gui = "bold" },
        separator = "",
      },
    },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = {
      {
        function()
          return ""
        end,
      },
      { "location" },
    },
  },
}
