vim.keymap.set("x", "<Space>p", '"_dP')

vim.keymap.set("n", "<Space>y", '"+y')
vim.keymap.set("v", "<Space>y", '"+y')
vim.keymap.set("n", "<Space>Y", '"+Y')

vim.keymap.set("n", "<C-f>", function()
  vim.cmd "GuardFmt"
end)

vim.api.nvim_set_keymap("n", "<M-Right>", "<C-w>>", { silent = true })
vim.api.nvim_set_keymap("i", "<M-Right>", "<C-w>>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-Left>", "<C-w><", { silent = true })
vim.api.nvim_set_keymap("i", "<M-Left>", "<C-w><", { silent = true })
-- vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>call fzf#run(fzf#wrap({'source': 'find * -type d'}))<cr>", { silent = true })

vim.api.nvim_set_keymap("n", "<C-right>", "<C-w><right>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-left>", "<C-w><left>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-up>", "<C-w><up>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-down>", "<C-w><down>", { silent = true })

-- vim.api.nvim_set_keymap("i", "<C-j>", "<cmd>Copilot suggestion accept<cr>", { silent = true })
-- vim.api.nvim_set_keymap("i", "<C-]>", "<cmd>Copilot suggestion next<cr>", { silent = true })
-- vim.api.nvim_set_keymap("i", "<C-[>", "<cmd>Copilot suggestion prev<cr>", { silent = true })

vim.api.nvim_set_keymap("n", "<C-l>", "", { silent = true })
vim.keymap.set("n", "<C-p>", function()
  vim.cmd "FZF"
end)

vim.keymap.set("n", "<C-S-Up>", ":m -2<cr>")
vim.keymap.set("n", "<C-S-Down>", ":m +1<cr>")
vim.keymap.set("n", "<Space>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<Space>x", "<cmd>!chmod +x %<CR>", { silent = true })
