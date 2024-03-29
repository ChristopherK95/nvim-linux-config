local telescope = require "telescope"
local actions = require "telescope.actions"
-- telescope.load_extension "file_browser"
telescope.setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-d>"] = "delete_buffer",
        ["<PageDown>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.preview_scrolling_up,
      },
    },
    prompt_prefix = "   ",
    selection_caret = "> ",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    path_display = { "truncate" },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      theme = "dropdown",
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      layout_config = {
        width = 0.8,
        height = 0.8,
      },
      layout_strategy = "vertical",
    },
    lsp_references = {
      theme = "dropdown",
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      layout_config = {
        width = 0.8,
        height = 0.8,
      },
      layout_strategy = "vertical",
      fname_width = 150,
    },
  },
  extensions = {},
}
