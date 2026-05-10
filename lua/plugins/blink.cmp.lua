local is_enabled = false
local plugin = {
  "saghen/blink.cmp",

  dependencies = {
    "rafamadriz/friendly-snippets"
  },

  build = "cargo build --release",

  --- @module "blink.cmp"
  --- @type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },

    appearance = {
      nerd_font_variant = "mono"
    },

    completion = {
      documentation = { auto_show = true }
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  }
}

if is_enabled then
  return plugin
else
  return {}
end
