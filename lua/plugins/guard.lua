local ft = require "guard.filetype"

ft("typescript,javascript,typescriptreact"):fmt "prettier"
ft("rust"):fmt "rustfmt"
ft("lua"):fmt "stylua"
ft("cpp"):fmt "clang-format"

require("guard").setup {
  fmt_on_save = false,
}
