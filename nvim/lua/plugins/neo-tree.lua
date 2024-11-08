return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = { "<A-n>" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    lazy = true
  },
  config = function()
    vim.keymap.set("n", "<A-n>", "<cmd>Neotree toggle<Cr>")
  end
}
