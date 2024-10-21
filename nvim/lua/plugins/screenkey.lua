return {
  "NStefan002/screenkey.nvim",
  -- event = "VeryLazy",
  lazy = false,
  version = "*",   -- or branch = "dev", to use the latest commit
  config = function()
    require("screenkey").setup({
      win_opts = {
        row = vim.o.lines - vim.o.cmdheight - 1,
        -- col = vim.o.columns - 1,
        col = vim.o.columns,
        relative = "editor",
        anchor = "SE",
        width = 33,
        height = 3,
        border = "single",
        title = " ⌨ screenkey ",
        title_pos = "left",
        style = "minimal",
        focusable = false,
        noautocmd = true,
      },
    }
    )
  end
}
