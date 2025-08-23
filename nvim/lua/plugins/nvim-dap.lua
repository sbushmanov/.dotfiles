return {
	"mfussenegger/nvim-dap",
	ft = { "python", "go", "lua", "bash", "json", "yaml", "rust", "awk"}, -- Fixed "scala" typo
	config = function()
		local dap = require("dap")

		-- Terminal split settings
		-- dap.defaults.fallback.terminal_win_cmd = "vsplit new"


		-- Debugger UI setup
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition" })
		vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped" })



		-- Key mappings
		vim.keymap.set("n", "<F2>", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
		vim.keymap.set("n", "<F6>", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Step out" })
		vim.keymap.set("n", "<F8>", dap.step_back, { desc = "Step back" })
		vim.keymap.set("n", "<F12>", dap.restart, { desc = "Restart debug session" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Set conditional breakpoint" })
	end,
}
