-- defaults
require("corn").setup {
  -- enable plugin auto commands
  auto_cmds = true,

  -- highlights to use for each diagnostic severity level
  highlights = {
    error = "DiagnosticFloatingError",
    warn = "DiagnosticFloatingWarn",
    info = "DiagnosticFloatingInfo",
    hint = "DiagnosticFloatingHint",
  },

  -- icons to use for each diagnostic severity level
  icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
}
