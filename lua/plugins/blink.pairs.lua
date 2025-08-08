return {
  "saghen/blink.pairs",
  -- version = "*",

  -- dependencies = "saghen/blink.download",
  build = "cargo build --release",

  --- @module "blink.pairs"
  --- @type blink.pairs.Config
  opts = {
    mappings = {
      enabled = true,
      cmdline = true,
      disabled_filetypes = {},
      pairs = {},
    },
    highlights = {
      enabled = true,
      cmdline = true,
      groups = {},
      unmatched_group = "BlinkPairsUnmatched",
      matchparen = {
        enabled = true,
        cmdline = false,
        group = "BlinkPairsMatchParen",
      },
    },
    debug = false
  }
}
