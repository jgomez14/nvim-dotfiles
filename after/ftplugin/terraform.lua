vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function ()
    vim.cmd("!terraform fmt -recursive")
  end,
})
