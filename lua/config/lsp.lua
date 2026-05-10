local lsp_servers = {
  "lua-ls",
  "rust-analyzer",
  "tflint"
}

vim.lsp.enable(lsp_servers)

vim.diagnostic.config({
  virtual_lines = {
    current_line = true
  }
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--
--     if client == nil then
--       return
--     end
--
--     if client:supports_method("textDocument/completion") then
--       vim.lsp.completion.enable(
--         true,
--         client.id,
--         ev.buf,
--         {
--           autotrigger = true
--         }
--       )
--     end
--   end
-- })
