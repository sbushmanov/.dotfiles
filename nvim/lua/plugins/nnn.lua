return {
  'luukvbaal/nnn.nvim',
  keys = {"<leader>n", "<leader>e"},
  config = function()
    require("nnn").setup({
      vim.keymap.set("n", "<leader>n", "<cmd>NnnPicker<Cr>"),
      quitcd = "cd",
    })
  end
}
