-- General options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.expandtab = true

-- External plugins
vim.pack.add({
  -- Vague theme
  { src = "https://github.com/vague-theme/vague.nvim" },

  -- LSP configurations
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- Telescope
  { src = "https://github.com/nvim-lua/plenary.nvim" }, -- Telescope dependency
  { src = "https://github.com/nvim-telescope/telescope.nvim" }
})

-- Theme
vim.cmd.colorscheme("vague")

-- LSP
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        -- Allows lua_ls to recognize vim module
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  }
})

vim.lsp.enable({
  "lua_ls",
  "rust_analyzer"
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
    end
  end,
})

-- Autocompletion
vim.opt.autocomplete = true

vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
vim.opt.pumheight = 5

vim.opt.complete = {
  "o",
  ".",
  "w",
  "b",
  "u",
  "t",
}

vim.opt.completeopt = {
  "menuone",
  -- Very important
  "noselect",
  "popup"
}

vim.keymap.set("i", "<Tab>", function ()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

vim.keymap.set("i", "<S-Tab>", function ()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

vim.keymap.set("i", "<Enter>", function ()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<Enter>"
end, { expr = true })

-- Filetypes
vim.filetype.add({
  extension = {
    tf = "terraform"
  }
})
