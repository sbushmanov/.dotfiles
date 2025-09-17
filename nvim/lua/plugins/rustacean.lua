return {
	"mrcjkb/rustaceanvim",
	version = "^6", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			server = {
				default_settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
						checkOnSave = true,
					},
				},
			},
		}
	end,
}
