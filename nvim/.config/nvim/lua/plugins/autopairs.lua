return {
  "windwp/nvim-autopairs",
  dependencies = { "nvim-treesitter" },
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup()
  end,
}
