local autopairs = require('nvim-autopairs')
local autotag = require('nvim-ts-autotag')

autopairs.setup({
    check_ts = true
})

autotag.setup()
