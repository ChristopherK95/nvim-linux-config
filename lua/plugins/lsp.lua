local lsp = require "lsp-zero"

lsp.preset "recommended"

lsp.ensure_installed {
  "tsserver",
  "eslint",
  "lua_ls",
  "rust_analyzer",
}

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  lsp.default_keymaps {
    buffer = bufnr,
  }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end)
  vim.keymap.set("n", "gi", function()
    vim.lsp.buf.implementation()
  end)
  vim.keymap.set("n", "gr", function()
    vim.cmd [[ Telescope lsp_references ]]
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<C-k>", function()
    vim.diagnostic.open_float()
  end, { buffer = true, remap = true })
end)

lsp.setup()

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = "single",
  },
}

local navic = require "nvim-navic"
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end
