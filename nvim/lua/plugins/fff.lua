return {
    "dmtrKovalenko/fff.nvim",
    build = "set HTTP_TIMEOUT 300; set RUSTUP_TOOLCHAIN nightly; cargo build --release",
    timeout = 300,
    keys = {
        {
            "F", -- try it if you didn't it is a banger keybinding for a picker
            function()
                require("fff").find_files()
            end,
            desc = "FFFind FFFiles",
        },
    },
    config = function()
        require("fff").setup({
            -- UI dimensions and appearance
            width = 0.9, -- Window width as fraction of screen
            height = 0.8, -- Window height as fraction of screen
            prompt = "🪿 ", -- Input prompt symbol
            preview = {
                enabled = true,
                width = 0.5,
                max_lines = 100,
                max_size = 1024 * 1024, -- 1MB
            },
            title = "FFF Files", -- Window title
            max_results = 60, -- Maximum search results to display
            max_threads = 10, -- Maximum threads for fuzzy search

            keymaps = {
                close = "<Esc>",
                select = "<CR>",
                select_split = "<C-s>",
                select_vsplit = "<C-v>",
                select_tab = "<C-t>",
                -- Multiple bindings supported
                move_up = { "<Up>", "<C-p>" },
                move_down = { "<Down>", "<C-n>" },
                preview_scroll_up = "<C-u>",
                preview_scroll_down = "<C-d>",
            },
        })
    end,
}
