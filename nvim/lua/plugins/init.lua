return {
    -- { "danth/pathfinder.vim",    lazy = false },

    { "nvim-lua/plenary.nvim",                       lazy = true }, -- defer loading plenary, load on demand

    { "mfussenegger/nvim-dap",                       lazy = true,                                                           cmd = { "DapContinue", "DapToggleBreakpoint" } },

    { "tpope/vim-unimpaired",                        lazy = true,                                                           event = "VeryLazy" },

    { "tpope/vim-markdown",                          ft = "markdown" },                                                  -- only load on markdown files

    { "mattn/calendar-vim",                          cmd = "Calendar" },                                                 -- load on calendar command

    { "junegunn/vim-easy-align",                     cmd = "EasyAlign" },                                                -- load only on command

    { "numToStr/Comment.nvim",                       keys = { "gcc", "gbc" },                                               event = "VeryLazy" }, -- load on commenting keys

    { "chrisgrieser/nvim-rip-substitute",            cmd = "RipSubstitute",                                                 keys = { "<leader>rs" } }, -- load on command or keys

    { "homerours/jumper.nvim",                       keys = { "<leader>jf", "<leader>jd", "<leader>jj" },                   event = "VeryLazy" }, -- lazy load jumper on keys

    { "nvim-telescope/telescope.nvim",               cmd = "Telescope",                                                     keys = { "<leader>f", "<leader>t", "<leader>g", "<leader>c" } }, -- load on common telescope commands and keys

    { "ibhagwan/fzf-lua",                            cmd = { "FzfLua" },                                                    keys = { "<leader>f", "<leader>t" },                          lazy = true }, -- lazy load fzf lua

    { "lewis6991/gitsigns.nvim",                     event = "BufReadPre",                                                  lazy = true }, -- load on reading buffer

    { "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim", cmd = "ToggleLspDiagnostics",                                          lazy = true },

    { "nvimtools/none-ls.nvim",                      lazy = true,                                                           event = "BufWritePre" }, -- load on file save write for lint/format

    { "numToStr/Comment.nvim",                       event = "VeryLazy" },

    { "sourcegraph/sg.nvim",                         event = "VeryLazy" },

    { "neovim/nvim-lspconfig",                       ft = { "python", "go", "lua", "bash", "json", "yaml", "rust", "awk" }, cmd = { "LspInfo", "LspInstall", "LspStart" } },

    { "scalameta/nvim-metals",                       ft = { "scala", "sbt", "java" } },

    -- add other plugins with appropriate lazy loading here
}
