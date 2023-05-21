vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-f>", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<M-Right>", "<C-w>>", { silent = true})
vim.api.nvim_set_keymap("i", "<M-Right>", "<C-w>>", { silent = true})
vim.api.nvim_set_keymap("n", "<M-Left>", "<C-w><", { silent = true})
vim.api.nvim_set_keymap("i", "<M-Left>", "<C-w><", { silent = true})
vim.api.nvim_set_keymap("n", "<C-p>", ":FZF<cr>", { silent = true})

vim.api.nvim_set_keymap("n", "<C-right>", "<C-w><right>", { silent = true})
vim.api.nvim_set_keymap("n", "<C-left>", "<C-w><left>", { silent = true})
vim.api.nvim_set_keymap("n", "<C-up>", "<C-w><up>", { silent = true})
vim.api.nvim_set_keymap("n", "<C-down>", "<C-w><down>", { silent = true})

vim.api.nvim_set_keymap("i", "<C-j>", "<cmd>Copilot suggestion accept<cr>", { silent = true})
vim.api.nvim_set_keymap("i", "<C-]>", "<cmd>Copilot suggestion next<cr>", { silent = true})
vim.api.nvim_set_keymap("i", "<C-[>", "<cmd>Copilot suggestion prev<cr>", { silent = true})


