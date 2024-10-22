return {
  -- { "danth/pathfinder.vim",    lazy = false },
  { "nvim-lua/plenary.nvim",   event = "VeryLazy" },
  { "mfussenegger/nvim-dap",   event = "VeryLazy" },
  { "tpope/vim-unimpaired",    event = "VeryLazy" },
  { "tpope/vim-markdown",      event = "VeryLazy" },
  { "mattn/calendar-vim",      event = "VeryLazy" },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  -- { "cometsong/CommentFrame.vim",  event = "VeryLazy" },
  {
    "vimwiki/vimwiki",
    branch = "dev",
    init = function()
      vim.g.vimwiki_list = {
        {
          template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
          syntax = "default",
          ext = ".md",
          path = "~/Documents/vimwiki",
          diary_rel_path = 'diary'
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
  },
}