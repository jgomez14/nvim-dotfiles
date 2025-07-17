local pickers = require("telescope.builtin")

local keymaps = {
  {
    mode = "n",
    keystroke = "<Leader>pf",
    executes = pickers.find_files,
    description = "[p]royect [f]iles"
  }
}

local function set_keymaps(keymaps_list)
  for _, keymap in ipairs(keymaps_list) do
    vim.keymap.set(
      keymap["mode"],
      keymap["keystroke"],
      keymap["executes"],
      {
        desc = keymap["description"]
      }
    )
  end
end

set_keymaps(keymaps)
