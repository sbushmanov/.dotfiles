return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-project.nvim",
    -- "cljoly/telescope-repo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    -- "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope-frecency.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9 }
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-f>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close,
          },
        },
      },
      extensions = {
        frecency = {
          auto_validate = false,
          matcher = "fuzzy",
          path_display = { "shorten" }
        }
      },
    })
  end,
}
