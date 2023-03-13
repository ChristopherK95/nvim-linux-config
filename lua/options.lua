vim.o.pumheight = 10
vim.o.scrolloff = 15
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
--vim.o.smarttab           = true
vim.o.smartindent        = true
vim.o.expandtab          = true                         -- Convert tabs to spaces.
vim.o.tabstop            = 2
vim.o.softtabstop        = 2
vim.o.shiftwidth         = 2
vim.wo.cursorline = true
vim.opt.updatetime = 50
vim.diagnostic.config({
  update_in_insert = true,
})

vim.cmd ":set guicursor=n-v-c-i:block"

vim.api.nvim_create_autocmd("BufWritePre", { callback = function() vim.cmd("Prettier") vim.cmd(":w") end })

vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-j>", "copilot#Accept('<CR>')", { silent = true, expr = true })
--function map(mode, lhs, rhs, opts)
--    local options = { noremap = true }
--    if opts then
--        options = vim.tbl_extend("force", options, opts)
--    end
--    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
--end
--
--map("v", "<Space>y", "\"+y")
