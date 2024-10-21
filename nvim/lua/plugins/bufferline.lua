return {
  "akinsho/nvim-bufferline.lua",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
      numbers = "buffer_id",
      diagnostics = "nvim_lsp",
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
    })
  end,
  enabled = true
}
