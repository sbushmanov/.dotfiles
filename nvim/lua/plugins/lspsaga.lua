return {
  'nvimdev/lspsaga.nvim',
  lazy = "true",
  config = function()
    require('lspsaga').setup({})
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    "nvim-telescope/telescope.nvim",
    "neovim/nvim-lspconfig"
  },
  enabled = true
}
