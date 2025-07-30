local filetypes_blacklist = { "oil" }

vim.api.nvim_create_autocmd('InsertCharPre', {
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
      return
    end

    local key = vim.keycode("<C-x><C-o>")

    if vim.list_contains(filetypes_blacklist, vim.bo.filetype) then
      key = vim.keycode("<C-x><C-n>")
    end

    if vim.bo.omnifunc == "" then
      key = vim.keycode("<C-x><C-n>")
    end

    local char = vim.v.char

    if (char >= "a" and char <= "z") or (char >= "A" and char <= "Z") then
      vim.api.nvim_feedkeys(key, 'm', false)
    end
  end
})
