return {
  'stevearc/oil.nvim',
  -- cmd = { "Oil" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      delete_to_trash = true,
      keymaps = {
        ["<leader>ff"] = {
          function()
            require("telescope.builtin").find_files({
              cwd = require("oil").get_current_dir()
            })
          end,
          mode = "n",
          nowait = true,
          desc = "Find files in the current directory"
        },
        ["<C-s>"] = "<cmd>vs<CR>"
      }
    })
  end,
}
