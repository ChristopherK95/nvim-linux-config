vim.g.mapleader = " "
vim.g.maplocalleader = " "
local wk = require "which-key"

wk.setup {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
}

wk.register({
  space = {},
  q = { ":q<cr>", "close window" },
  f = {
    name = "Find",
    f = { ":FzfLua files<cr>", "find file" },
    b = { ":Telescope buffers<cr>", "buffers" },
    g = { ":FzfLua live_grep_native<cr>", "live grep" },
    r = { ":FzfLua lsp_references<cr>", "references" },
    h = { ":Telescope help_tags<cr>", "help" },
    -- e = { ":Telescope file_browser path=%:p:h select_buffer=true<cr>", "file browser" },
    e = { ":Oil --float<cr>", "mini files" },
    d = { ":Telescope diagnostics<cr>", "diagnostics" },
  },
  w = {
    name = "Window",
    v = { ":vsplit<cr><C-w><right>", "horizontal split" },
    h = { ":split<cr><C-w><down>", "vertical split" },
    ["<left>"] = { "<C-w><left>", "left window" },
    ["<right>"] = { "<C-w><right>", "right window" },
    ["<up>"] = { "<C-w><up>", "upper window" },
    ["<down>"] = { "<C-w><down>", "bottom window" },
  },
  g = {
    name = "Git",
    b = { ":Telescope git_branches<cr>", "branches" },
    s = { ":Telescope git_status<cr>", "status" },
    f = { ":Telescope git_bcommits<cr>", "file commits" },
    p = { ":Gitsigns preview_hunk_inline<cr>", "Show changes" },
    g = { ":Gitsigns blame_line<cr>", "Show git blame" },
  },
  c = {
    name = "Code",
    a = { ":CodeActionMenu<cr>", "code actions" },
    r = { ":lua vim.lsp.buf.rename()<cr>", "rename" },
  },
  t = { ":Detour <cr>", "modal" },
  d = {
    name = "Diagnostic",
    d = { ":TroubleToggle<cr>", "toggle" },
    c = { ":CornToggle<cr>", "toggle corn" },
    [","] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "prev",
    },
    ["."] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "next",
    },
  },
  e = {
    ":vsplit<cr>:e ~/buffer<cr>",
    "open scratchpad",
  },
  p = {
    name = "Folder search",
    p = { "<cmd>call fzf#run(fzf#wrap({'source': 'find * -type d'}))<cr>", "current" },
    o = { "<cmd>call fzf#run(fzf#wrap({'source': 'find * -type d', 'dir': '~'}))<cr>", "global" },
  },
}, { prefix = "<leader>" })
