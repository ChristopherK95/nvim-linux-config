require("nvim-treesitter.configs").setup {
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    filetypes = { "html", "jsx", "tsx", "typescriptreact" },
  },
}
