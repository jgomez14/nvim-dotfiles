## Defining keymaps

For defining keymaps, you can use the function `set_keymaps` of the `config.shared` module like this:

```lua
local shared = require("config.shared")

local keymaps = {
  {
    mode = "<mode where it applies>",
    keystroke = "<keys>",
    executes = "<map>",
    description = "<keymap description>"
  }
}

shared.set_keymaps(keymaps)
```
