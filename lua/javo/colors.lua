-- require("nightfox").setup({
--     options = {
--         styles = {               -- Style to be applied to different syntax groups
--           comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
--           conditionals = "NONE",
--           constants = "NONE",
--           functions = "NONE",
--           keywords = "NONE",
--           numbers = "NONE",
--           operators = "NONE",
--           strings = "NONE",
--           types = "NONE",
--           variables = "NONE",
--         }
--     }
-- })

require("catppuccin").setup({
    flavour = "macchiato"
})

vim.cmd.colorscheme("catppuccin")
