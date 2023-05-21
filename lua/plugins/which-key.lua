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
    f = { ":Telescope find_files<cr>", "find file" },
    b = { ":Telescope buffers<cr>", "buffers" },
    g = { ":Telescope live_grep<cr>", "live grep" },
    r = { ":Telescope lsp_references<cr>", "references" },
    h = { ":Telescope help_tags<cr>", "help" },
    e = { ":Telescope file_browser path=%:p:h select_buffer=true<cr>", "file browser" },
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
  },
  c = {
    name = "Code",
    a = { ":CodeActionMenu<cr>", "code actions" },
    r = { ":lua vim.lsp.buf.rename()<cr>", "rename" },
    p = { '<cmd>lua require("copilot.panel").open()<CR>', "toggle copilot panel"}
  },
  t = { ":ToggleTerm direction='float'<cr>", "terminal" },
  d = {
    name = "Diagnostic",
    d = { ":TroubleToggle<cr>", "toggle" },
  },
}, { prefix = "<leader>" })
