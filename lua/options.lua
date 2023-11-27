vim.o.cmdheight = 0
vim.o.pumheight = 20
vim.o.pumwidth = 10
vim.o.scrolloff = 15
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
--vim.o.smarttab           = true
vim.o.smartindent = true
vim.o.expandtab = true -- Convert tabs to spaces.
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.wo.cursorline = true
vim.opt.updatetime = 50
vim.diagnostic.config {
  update_in_insert = true,
}

vim.cmd "set title"

vim.cmd ":set guicursor=n-v-c-i:block"

vim.g.indent_blankline_filetype_exclude = "dashboard"

vim.cmd "command! W w"
vim.cmd "command! Q q"
vim.cmd "command! Qa qa"

vim.cmd "setlocal autoindent"
