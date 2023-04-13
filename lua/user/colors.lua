-- local function set_colorscheme(colorscheme)
-- 	vim.cmd('colorscheme ' .. colorscheme)
-- end
--
-- local colorscheme = 'onedark'
--
-- set_colorscheme(colorscheme)

require('onedark').setup {
    code_style = {
        comments = 'none'
    }
}

require('onedark').load()
