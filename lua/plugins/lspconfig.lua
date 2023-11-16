local nvim_lsp = require "lspconfig"
local root_pattern = require("lspconfig.util").root_pattern

-- add capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lsp_flags = {
  debounce_text_changes = 150,
}

-- Enable language servers with common settings
local servers = {
  "bashls",
  "dockerls",
  "jsonls",
  "cssls",
}

nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  flags = lsp_flags,
}
nvim_lsp.eslint.setup {
  root_dir = root_pattern(".eslintrc.js", ".eslintrc.json"),
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    flags = lsp_flags,
  }
end

nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
      },
    },
  },
}
