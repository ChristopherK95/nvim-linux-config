local nvim_lsp = require "lspconfig"
local utils = require "lsp.utils"
local root_pattern = require("lspconfig.util").root_pattern
local common_on_attach = utils.common_on_attach

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
  "tsserver",
  "cssls",
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
  }
  nvim_lsp.eslint.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
    root_dir = root_pattern(".eslintrc.js", ".eslintrc.json"),
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

-- local M = {}
--
-- function M.setup()
--   local ts_config = require('typescript')
--   ts_config.setup({
--     server = {
--       init_options = {
--         plugins = {
--           {
--             name = '@styled/typescript-styled-plugin',
--             location = '/home/chrkar/.config/yarn/global/node_modules/@styled/typescript-styled-plugin'
--           },
--         },
--       }
--     }
--   })
-- end
--
-- return M

-- require('lsp.sumneko')

-- signature help hover
--require "lsp_signature".setup({ })
