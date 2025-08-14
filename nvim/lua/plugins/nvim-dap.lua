return {
	"mfussenegger/nvim-dap",
	ft = { "python", "go", "lua", "bash", "json", "yaml", "rust", "awk", "scala" }, -- Fixed "scala" typo
	config = function()
		local dap = require("dap")
		local metals = require("metals")

		-- Terminal split settings
		-- dap.defaults.fallback.terminal_win_cmd = "vsplit new"

		-- Scala configurations via Metals
		metals.setup_dap()
		dap.configurations.scala = {
			{
				type = "scala",
				request = "launch",
				name = "RunOrDebug",
				metals = {
					runType = "runOrTestFile",
				},
			},
			{
				type = "scala",
				request = "launch",
				name = "TestTarget",
				metals = {
					runType = "testTarget",
				},
			},
		}

		-- Debugger UI setup
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition" })
		vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped" })

		-- REPL integration
		-- dap.listeners.after.event_initialized["open_repl"] = function()
		-- 	dap.repl.open({}, "vsplit new")
		-- end

		-- Run code
		local function run_scala()
			local config = dap.configurations.scala[1] -- First config is RunOrDebug
			if config then
				dap.run(config)
				dap.repl.open({}, "vsplit new")
			else
				vim.notify("No Scala debug configuration found", vim.log.levels.ERROR)
			end
		end

		-- Debug code
		local function debug_scala()
			local config = dap.configurations.scala[1] -- First config is RunOrDebug
			if config then
				dap.run(config)
				require("dap-view").open()
			else
				vim.notify("No Scala debug configuration found", vim.log.levels.ERROR)
			end
		end

		-- Key mappings
		vim.keymap.set("n", "<F1>", run_scala, { desc = "Run Scala application" })
		vim.keymap.set("n", "<F2>", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F3>", debug_scala, { desc = "Start Scala debug session" })
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
