require("lualine").setup {
    options = {
        theme = "catppuccin-macchiato",
        component_separators = "",
        section_separators = {
            left = "",
            right = ""
        },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                icon = "",
                separator = {
                    right = ""
                },
                right_padding = 2
            }
        },
        lualine_b = {
            {
                "branch",
                icon = "󰊢"
            },
            "diff"
        },
        lualine_c = {
            "diagnostics",
            "filename"
        },
        lualine_x = {},
        lualine_y = {
            {
                'filetype',
                separator = {
                    right = "█",
                    left = "█"
                }
            }
        },
        lualine_z = {
            {
                'location',
                left_padding = 2
            },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}
