local non_language_ft = { "fugitive", "startify" }

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_b = {
      {
        "branch",
        -- color = { bg = "#4B465B", fg = "#fc6086", gui = "bold" },
        icon = { "" },
      },
      {
        "diff",
        colored = true,
        diff_color = {
          added = "LuaLineDiffAdd",
          modified = "LuaLineDiffChange",
          removed = "LuaLineDiffDelete",
        },
        symbols = { added = " ", modified = " ", removed = " " },
        -- color = { bg = "#4B465B" },
      },
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info" },
        -- color = { bg = "#4B465B" },
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
        -- color = { fg = "#ffffff", bg = "#4B465B", gui = "bold" },
        separator = "",
      },
    },
    lualine_x = {
      {
        "filetype",
        icon = { "X", align = "right" },
        -- color = { fg = "#ffffff", bg = "none" },
      },
    },
    lualine_y = {
      {
        "progress",
        -- color = { bg = "none", fg = "#ffffff" },
      },
    },
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
