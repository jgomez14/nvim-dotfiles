local shared = require("config.shared")

local keymaps = {
  {
    mode = "n",
    keystroke = "<Leader>-",
    executes = "<CMD>Oil<CR>",
    description = "Open oil"
  }
}

shared.set_keymaps(keymaps)
