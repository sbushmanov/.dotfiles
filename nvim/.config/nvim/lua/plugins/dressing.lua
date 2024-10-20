return {
      "stevearc/dressing.nvim",
      lazy = true,
      config = function()
        require("dressing").setup {
          select = {
            backend = { "telescope", "fzf", "builtin" },
          },
        }
      end,
}
