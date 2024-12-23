-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- keymap.del("n", "<Leader>/")
-- keymap.del("n", "<C-z>")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- INC RENAME
keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- New tab
-- keymap.set("n", "te", ":tabedit")
-- keymap.set("n", "<Tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<S-Tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sj", "<C-w>j")

-- Resize splits with Alt + hjkl keys using Control + w
keymap.set("n", "<S-Up>", "<C-w>+", { noremap = true, silent = true }) -- Resize up
keymap.set("n", "<S-Down>", "<C-w>-", { noremap = true, silent = true }) -- Resize down
keymap.set("n", "<S-Left>", "<C-w><", { noremap = true, silent = true }) -- Resize left
keymap.set("n", "<S-Right>", "<C-w>>", { noremap = true, silent = true }) -- Resize right

keymap.set("n", "<C-u>", ":u<Return>", { noremap = true, silent = true })
keymap.set("n", "<C-q>", ":bdelete<Return>", { remap = true, silent = true })
keymap.set("n", "<leader>aa", "<cmd>%y+<CR>", { remap = true, silent = true }) -- Copy all
-- keymap.set("n", "<C-r>", ":u<Return>");

-- save files
keymap.set("n", "<C-s>", ":w<Return>")
keymap.set("n", "<C-z>", ":u<Return>")
--
keymap.set("n", "<leader>gn", function()
  -- require("telescope.builtin").lsp_document_symbols({ symbols = { "method", "function" } })
  -- require("telescope.builtin").lsp_document_symbols()
  require("fzf-lua").lsp_document_symbols()
end, opts)
--
-- -- Telescope configs
-- keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
keymap.set("n", "<leader>fw", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })
keymap.set("n", "<leader>fW", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
-- keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
-- keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
-- keymap.set(
--   "n",
--   "<Leader>fz",
--   "<cmd>Telescope current_buffer_fuzzy_find<CR>",
--   { desc = "telescope find in current buffer" }
-- )
-- keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
-- keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
-- keymap.set("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- keymap.set("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
-- keymap.set(
--   "n",
--   "<Leader>fa",
--   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
--   { desc = "telescope find all files" }
-- )

-- Testing some code actions.
-- keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })

-- Comments
-- keymap.set("n", "<Leader>/", "gcc", { desc = "Toggle Comment", remap = true })
-- keymap.set("v", "<Leader>/", "gc", { desc = "Toggle comment", remap = true })
