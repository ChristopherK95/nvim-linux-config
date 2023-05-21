local lsp = require "lsp-zero"

lsp.preset "recommended"

lsp.ensure_installed {
  "tsserver",
  "eslint",
  "lua_ls",
  "rust_analyzer",
}

local cmp = require "cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings {
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm { select = true },
  ["<C-Space>"] = cmp.mapping.complete(),
}

lsp.setup_nvim_cmp {
  mapping = cmp_mappings,
}

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "gi", function()
    vim.lsp.buf.implementation()
  end, opts)
  vim.keymap.set("n", "gr", function()
    vim.cmd [[ Telescope lsp_references ]]
  end, opts)
  --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>k", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "d]", function()
    vim.diagnostic.goto_prev()
  end, opts)
end)

lsp.setup()

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = "single",
  },
}

local null_ls = require "null-ls"
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup {
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)

    local format_cmd = function(input)
      vim.lsp.buf.format {
        id = client.id,
        timeout_ms = 5000,
        async = input.bang,
      }
    end

    local bufcmd = vim.api.nvim_buf_create_user_command
    bufcmd(bufnr, "NullFormat", format_cmd, {
      bang = true,
      range = true,
      desc = "Format using null-ls",
    })
  end,
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
  },
}

local navic = require "nvim-navic"
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

require("lspconfig").clangd.setup {
  on_attach = on_attach,
}
