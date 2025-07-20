local shared = require("config.shared")

local keymaps = {
  {
    mode = "n",
    keystroke = "<Leader>-",
    executes = "<CMD>Oil<CR>",
    description = "[p]royect [f]iles"
  }
}

shared.set_keymaps(keymaps)
