local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local function border(hl_name)
  return {
    { "┌", hl_name },
    { "─", hl_name },
    { "┐", hl_name },
    { "│", hl_name },
    { "┘", hl_name },
    { "─", hl_name },
    { "└", hl_name },
    { "│", hl_name },
  }
end

-- local Utils = require('utils')
require("lsp-zero.cmp").extend()
local cmp = require "cmp"
-- local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup {
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  window = {
    completion = {
      border = border "",
      winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = border "",
      winhighlight = "Normal:Normal",
    },
  },
  -- Don't preselect an option
  preselect = cmp.PreselectMode.None,
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_, vim_item)
      vim_item.abbr = vim_item.abbr
      vim_item.kind = (kind_icons[vim_item.kind] or "Foo") .. " |"
      vim_item.menu = (vim_item.menu or "") .. " "
      return vim_item
    end,
  },
  -- Mappings
  mapping = cmp.mapping.preset.insert {
    -- open/close autocomplete
    ["<C-Space>"] = function(_)
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end,
    ["<C-c>"] = cmp.mapping.close(),
    -- select completion
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Down>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<Up>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<S-Down>"] = cmp.mapping.scroll_docs(4),
    ["<S-Up>"] = cmp.mapping.scroll_docs(-4),
  },
  -- Complete options from the LSP servers and the snippet engine
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
}

-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     {
--       name = "cmdline",
--     },
--   }),
-- })

-- cmp.event:on("menu_opened", cmp.select_next_item(cmp_select_opts, 1))
