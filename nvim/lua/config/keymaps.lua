local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- ═══════════════════════════════════════════════════════════════════════════════
-- CORE EDITING
-- ═══════════════════════════════════════════════════════════════════════════════

-- Better save/quit
keymap("n", "<A-w>", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<A-d>", "<cmd>q<CR>", { desc = "Close buffer" })

-- Better escape from terminal
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- FILE OPERATIONS
-- ═══════════════════════════════════════════════════════════════════════════════

-- File explorer
keymap("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- LSP OPERATIONS
-- ═══════════════════════════════════════════════════════════════════════════════

-- Diagnostics
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostics" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- Code actions and formatting
keymap("n", "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format File" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- TEXT MANIPULATION
-- ═══════════════════════════════════════════════════════════════════════════════

-- Easy align
keymap("v", "<leader>ea", ":EasyAlign<CR>", default_opts)

-- ═══════════════════════════════════════════════════════════════════════════════
-- SESSION MANAGEMENT
-- ═══════════════════════════════════════════════════════════════════════════════

keymap("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Load Session" })

keymap("n", "<leader>qS", function()
	require("persistence").select()
end, { desc = "Select Session" })

keymap("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Load Last Session" })

keymap("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "Stop Session Saving" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- WINDOW MANAGEMENT
-- ═══════════════════════════════════════════════════════════════════════════════

keymap("n", "<A-s>", "<cmd>vs<CR>", { desc = "Vertical Split" })

-- Toggle quickfix
keymap("n", "<A-q>", function()
	local windows = vim.fn.getwininfo()
	for _, win in pairs(windows) do
		if win["quickfix"] == 1 then
			vim.cmd.cclose()
			return
		end
	end
	vim.cmd.copen()
end, { desc = "Toggle Quickfix" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- FOLDING
-- ═══════════════════════════════════════════════════════════════════════════════

keymap("n", "zR", ":set foldlevel=99<CR>", { desc = "Open All Folds" })
keymap("n", "zM", ":set foldlevel=0<CR>", { desc = "Close All Folds" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- DEBUGGING (F-keys for DAP)
-- ═══════════════════════════════════════════════════════════════════════════════

keymap("n", "<F2>", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

keymap("n", "<F4>", ":DapViewToggle<CR>", { desc = "DAP View Toggle" })
keymap("n", "<F5>", ":DapTerminate<CR>", { desc = "DAP Terminate" })

-- Step operations
keymap("n", "<F6>", function()
	require("dap").step_over()
end, { desc = "Step Over" })

keymap("n", "<F7>", function()
	require("dap").step_out()
end, { desc = "Step Out" })

keymap("n", "<F8>", function()
	require("dap").step_back()
end, { desc = "Step Back" })

keymap("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Step Into" })

keymap("n", "<F12>", function()
	require("dap").restart()
end, { desc = "DAP Restart" })
