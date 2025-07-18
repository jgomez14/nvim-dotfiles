local treesitter = require("nvim-treesitter")

local languages = {
  "gitcommit",
  "gitignore",
  "lua",
  "markdown",
  "markdown_inline",
  "terraform"
}

treesitter.install(languages)

-- Enable features on filetypes
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = languages,
    callback = function()
      vim.treesitter.start()
    end,
  }
)
