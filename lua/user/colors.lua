-- Create a local variable for manage onedark plugin
local onedarkTheme = require('onedark')

-- Configure the desired color scheme
onedarkTheme.setup {
	style = 'warm'
}

-- Enable colors
onedarkTheme.load()
