return {
  "ibhagwan/fzf-lua",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  config = function()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").setup({
      "telescope",
      actions = {
        files = {
          ["ctrl-f"] = actions.file_sel_to_qf,
        },
      },
    })
  end
}
