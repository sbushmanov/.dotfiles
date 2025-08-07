return {
	"mfussenegger/nvim-dap",
	cmd = { "DapContinue", "DapToggleBreakpoint" },
	lazy = true,
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		},
		{
			"leoluz/nvim-dap-go",
			ft = { "go", "mod" },
		},
	},
	config = function()
		require("dap-go").setup({})
		require("dapui").setup({})
		local dap = require("dap")
		local dapui = require("dapui")

		-- dap.listeners.before.attach.dapui_config = function()
		--   dapui.open()
		-- end
		-- dap.listeners.before.launch.dapui_config = function()
		--   dapui.open()
		-- end
		-- dap.listeners.before.event_terminated.dapui_config = function()
		--   dapui.close()
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		--   dapui.close()
		-- end
	end,
}
