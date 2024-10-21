return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  config = function()
    -- vim.opt.list = true
    require("ibl").setup({
      indent = {
        char = "┊",
      },
      scope = {
        enabled = false
      },
      whitespace = {
        remove_blankline_trail = false
      },
    })
  end,
}
