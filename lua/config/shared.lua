local M = {}

M.set_keymaps = function(keymaps_list)
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

return M
