return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "SmiteshP/nvim-navic"
  },
  event = "VeryLazy",
  config = function()
    -- local navic = require("nvim-navic")
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          { "filename", path = 1 },
        },
        lualine_x = { "g:metals_status", "encoding", "filesize", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
      winbar = {
        -- lualine_c = {
        --   { "filename" },
        --   {
        --     function()
        --       return navic.get_location()
        --     end,
        --     cond = function()
        --       return navic.is_available()
        --     end
        --   } },
      },
      extensions = {},
    })
  end,
}
