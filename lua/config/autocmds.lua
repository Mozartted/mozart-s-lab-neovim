-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Fixing conseallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- Custom setups
--
local api = vim.api
-- Function to check if the current buffer contains JSX
local function buffer_contains_jsx()
  for _, line in ipairs(api.nvim_buf_get_lines(0, 0, -1, false)) do
    -- Simple heuristic: Look for "<" followed by an uppercase letter, a common JSX pattern
    if line:match("<[%u]") then
      return true
    end
  end
  return false
end

-- Function to disable diagnostics (type checking) for .js files with JSX
local function disable_diagnostics_for_js_with_jsx()
  local clients = vim.lsp.get_active_clients()
  if buffer_contains_jsx() then
    for _, client in pairs(clients) do
      if client.name == "tsserver" and vim.bo.filetype == "javascript" then
        -- Disable diagnostics (type checking) but keep autocompletion and other features
        client.handlers["textDocument/publishDiagnostics"] = function() end
      end
    end
  end
end
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.js", -- Matches JavaScript files
  callback = function()
    disable_diagnostics_for_js_with_jsx()
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})
