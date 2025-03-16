return {
  "linrongbin16/fzfx.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", 'junegunn/fzf' },
  config = function()
    require("fzfx").setup()
  end,
}
