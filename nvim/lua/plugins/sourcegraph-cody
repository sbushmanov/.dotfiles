return {
  "sourcegraph/sg.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "CursorMoved", "BufNewFile" },
  -- If you have a recent version of lazy.nvim, you don't need to add this!
  build = "nvim -l build/init.lua",
  config = function()
    require("sg").setup({})
  end
}
