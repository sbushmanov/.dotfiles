local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("v", "<leader>ea", ":EasyAlign<CR>", default_opts)
keymap("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- Map <leader>fp to open projects
vim.keymap.set("n", "<leader>fp", ":ProjectFzf<CR>", { noremap = true, silent = true })

-- Escape terminal
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { silent = true })

-- Save an close on simple and intuitive  Alt-keybindings
vim.keymap.set("n", "<A-w>", "<cmd>w<Cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-d>", "<cmd>q<Cr>", { noremap = true, silent = true })

-- Snacks dashboard
-- vim.keymap.set("n", "<leader>sd", ":lua Snacks.dashboard()<CR>", { noremap = true, silent = true })

-- Find file ffff
vim.keymap.set("n", "<A-f>", ":lua require('fff').find_files()<CR>", { noremap = true, silent = true })
