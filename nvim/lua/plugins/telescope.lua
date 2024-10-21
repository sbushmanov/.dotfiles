return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-project.nvim",
    "cljoly/telescope-repo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "jvgrootveld/telescope-zoxide",
  },
  config = function()
    local actions = require("telescope.actions")
    local z_utils = require("telescope._extensions.zoxide.utils")
    require("telescope").setup({
      defaults = {
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
      zoxide = {
        prompt_title = "[ Walking on the shoulders of TJ ]",
        mappings = {
          default = {
            after_action = function(selection)
              print("Update to (" .. selection.z_score .. ") " .. selection.path)
            end
          },
          ["<C-s>"] = {
            before_action = function(selection) print("before C-s") end,
            action = function(selection)
              vim.cmd.edit(selection.path)
            end
          },
          -- Opens the selected entry in a new split
          ["<C-q>"] = { action = z_utils.create_basic_command("split") },
        },
      }
    })
  end,
}
