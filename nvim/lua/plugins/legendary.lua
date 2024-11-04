return {
  'mrjones2014/legendary.nvim',
  dependencies = { 'kkharji/sqlite.lua', "stevearc/dressing.nvim" },
  cmd = { "Legendary" },
  lazy = false,
  priority = 10000,
  keys = { { '<A-z>', '<cmd>Legendary<CR>', desc = "Start Legendary" }, },
  config = function()
    require("legendary").setup({
      extensions = { lazy_nvim = true },
      keymaps = {
        {
          "<leader>fo",
          ":lua require('ufo').setup({})<CR>",
          mode = { 'n' },
          description = "Enable ufo folding plugin",
        },
        {
          "<C-s>",
          "<cmd>FzfLua lgrep_curbuf<CR>",
          mode = { 'n' },
          description = "FzfLua current buffer search/find",
        },
        {
          "<C-g>",
          "<cmd>FzfLua grep_project<CR>",
          mode = { 'n' },
          description = "FzfLua grep project",
        },
        {
          "<leader>jf",
          "<cmd>lua require('telescope').extensions.jumper.jump_to_file()<CR>",
          mode = { 'n' },
          description = "Jumper to file",
        },
        {
          "<leader>jd",
          "<cmd>lua require('telescope').extensions.jumper.jump_to_directory()<CR>",
          mode = { 'n' },
          description = "Jumper to directory",
        },
        {
          "<leader>jj",
          "<cmd>lua require('telescope').extensions.jumper.find_in_files()<CR>",
          mode = { 'n' },
          description = "Jumper find in files",
        },
        {
          "<A-q>",
          function()
            local windows = vim.fn.getwininfo()
            for _, win in pairs(windows) do
              if win["quickfix"] == 1 then
                vim.cmd.cclose()
                return
              end
            end
            vim.cmd.copen()
          end,
          mode = { 'n' },
          description = "Toggle better quickfix"
        },
        {
          "<leader>tq",
          "<cmd>Telescope frecency workspace=CWD<cr>",
          mode = { 'n' },
          description = "Telescope frecency file browser"
        },
        {
          "<leader>ut",
          "<cmd>lua require('undotree').toggle()<cr>",
          mode = { 'n', 'x', 'o' },
          description = "Undo tree toggle"
        },
        {
          "<A-s>",
          "<cmd>vs<CR>",
          mode = { "n" },
          description = "Vertical split"
        },
        {
          "<A-t>",
          "<cmd>Telescope<CR>",
          mode = { "n" },
          description = "Open Telescope"
        },
        {
          "<A-f>",
          "<cmd>FzfLua<CR>",
          mode = { "n" },
          description = "Open FzfLua"
        },
        {
          "<leader>tf",
          "<cmd>Telescope file_browser<CR>",
          mode = { "n" },
          description = "Telescope file browser"
        },
        {
          "<leader>of",
          "<cmd>Oil --float %:h<cr>",
          mode = { "n" },
          description = "Oil floating file explorer"
        },
        {
          "<leader>ra",
          "Vgg :SnipRun<CR>",
          description = "SnipRun: execute above current line (to top)"
        },
        {
          "<leader>rb",
          "VG :SnipRun<CR>",
          description = "SnipRun: execute below current line (to bottom)"
        },
        {
          "<leader>r",
          ":SnipRun<CR>",
          mode = "v",
          description = "SnipRun: execute visual selection"
        },
        {
          "<leader><leader>",
          ":lua require'telescope'.extensions.metals.commands()<cr>",
          description = "Metals menu"
        },
        {
          "<leader>tg",
          ":Telescope live_grep<cr>",
          description = "Telescope live grep"
        },
        {
          "<leader>tc",
          ":Telescope command_history<cr>",
          description = "Telescope command history"
        },
        {
          "<leader>th",
          ":Telescope oldfiles<cr>",
          description = "Telescope file history"
        },
        {
          "<leader>tf",
          ":Telescope find_files<cr>",
          description = "Telescope find files"
        },
        {
          "<leader>tr",
          ":Telescope reloader<cr>",
          description = "Telescope reloader"
        },
        {
          "<leader>tb",
          ":Telescope current_buffer_fuzzy_find<cr>",
          description = "Telescope buffer find"
        },
        {
          "<leader>tn",
          ":Telescope buffers<cr>",
          description = "Telescope buffers"
        },
        {
          "<leader>ts",
          ":Telescope lsp_document_symbols<cr>",
          description = "Telescope lsp document symbol"
        },
        {
          "<leader>ti",
          ":Telescope lsp_incoming_calls<cr>",
          description = "Telescope lsp incoming calls"
        },
        {
          "<leader>to",
          ":Telescope lsp_outgoing_calls<cr>",
          description = "Telescope lsp outgoing calls"
        },
        {
          "<leader>tp",
          ":Telescope projects<cr>",
          description =
          "Telescope choose project"
        },
        {
          "<leader>tv",
          ":Telescope commands<cr>",
          description = "Telescope vim commands"
        },
        {
          "<leader>td",
          ":Telescope diagnostics<cr>",
          description = "Telescope diagnostics"
        },
        {
          "<leader>tD",
          ":lua vim.diagnostic.open_float()<CR>",
          description = "Show vim floating diagnostics",
        },
        {
          "<leader>tm",
          ":Telescope lsp_implementations<cr>",
          description = "Telescope implementations"
        },
        {
          "<leader>cd",
          function()
            vim.cmd.call("fzf#run({'source': 'fd -t d -H . ~', 'sink': 'Oil'})")
          end,
          description = "Fzf cd to directory",
        },
        { "<leader>ff", ":FzfLua files<cr>",                      description = "Fzf files" },
        { "<leader>fm", ":FzfLua marks<cr>",                      description = "Fzf marks" },
        { "<leader>fr", ":FzfLua registers<cr>",                  description = "Fzf registers" },
        { "<leader>fb", ":FzfLua buffers<cr>",                    description = "Fzf buffer" },
        { "<leader>fg", ":FzfLua live_grep<cr>",                  description = "Fzf live grep" },
        { "<leader>fh", ":FzfLua oldfiles<cr>",                   description = "Fzf file history" },
        { "<C-f>",      ":FzfLua oldfiles<cr>",                   description = "Fzf file history" },
        { "<leader>fv", ":FzfLua commands<cr>",                   description = "Fzf commands" },
        { "<leader>fc", ":FzfLua colorscheme<cr>",                description = "fzf colorscheme" },
        { "dr",         ":lua  require('dap').repl.toggle()<cr>", description = "DAP repl" },
        { "dc",         ":lua  require('dap').continue()<cr>",    description = "DAP continue" },
        { "<leader>gf", ":Lspsaga finder<CR>",                    description = "Lspsaga finder" },
        { "<leader>lf", ":Lspsaga finder<CR>",                    description = "Lspsaga finder" },
        { "<leader>ca", ":Lspsaga code_action<CR>",               description = "Lspsaga code action" },
        {
          "<leader>p",
          ":lua require('actions-preview').code_actions()<CR>",
          description = "Preview code action",
        },
        {
          "<leader>rn",
          ":Lspsaga rename<CR>",
          description = "Lspsaga rename",
        },
        {
          "<leader>gd",
          ":Lspsaga peek_definition<CR>",
          description = "Lspsaga peek definition",
        },
        {
          "<leader>ld",
          ":Lspsaga peek_definition<CR>",
          description = "Lspsaga peek definition",
        },
        {
          "<leader>gD",
          "<cmd>Lspsaga goto_definition<CR>",
          description = "Lspsaga go to definition",
        },
        {
          "<leader>lD",
          "<cmd>Lspsaga goto_definition<CR>",
          description = "Lspsaga go to definition",
        },
        {
          "<leader>gt",
          ":Lspsaga peek_type_definition<CR>",
          description = "Lspsaga peek type definition",
        },
        {
          "<leader>gT",
          ":Lspsaga goto_type_definition<CR>",
          description =
          "Lspsaga go to type definition",
        },
        {
          "<leader>sc",
          "<cmd>Lspsaga show_cursor_diagnostics<CR>",
          description = "Lspsaga cursor diagnostic",
        },
        {
          "<leader>lc",
          "<cmd>Lspsaga show_cursor_diagnostics<CR>",
          description =
          "Lspsaga cursor diagnostic",
        },
        {
          "<leader>sl",
          "<cmd>Lspsaga show_line_diagnostics<CR>",
          description = "Lspsaga line diagnostic",
        },
        {
          "<leader>sb",
          "<cmd>Lspsaga show_buffer_diagnostics<CR>",
          description =
          "Lspsaga buffer diagnostic",
        },
        {
          "<leader>lb",
          "<cmd>Lspsaga show_buffer_diagnostics<CR>",
          description =
          "Lspsaga buffer diagnostic",
        },
        {
          "<leader>sw",
          "<cmd>Lspsaga show_workspace_diagnostics<CR>",
          description =
          "Lspsaga workspace diagnostic",
        },
        {
          "[e",
          "<cmd>Lspsaga diagnostic_jump_prev<CR>",
          description = "Lspsaga previous diagnostic",
        },
        {
          "[d",
          "<cmd>:lua vim.diagnostic.goto_prev()<CR>",
          description = "Vim previous diagnostic",
        },

        {
          "]e",
          "<cmd>Lspsaga diagnostic_jump_next<CR>",
          description = "Lspsaga next diagnostic",
        },
        {
          "]d",
          "<cmd>:lua vim.diagnostic.goto_next()<CR>",
          description = "Vim next diagnostic",
        },

        {
          "<A-o>",
          "<cmd>Lspsaga outline<CR>",
          description = "Lspsaga project outline",
        },
        -- { "K", "<cmd>Lspsaga hover_doc<CR>", description = "Lspsaga hover doc" },
        {
          "?",
          "<cmd>Lspsaga hover_doc<CR>",
          description = "Lspsaga hover doc",
        },
        {
          "<leader>ci",
          "<cmd>Lspsaga incoming_calls<CR>",
          description = "Lspsaga incoming calls",
        },
        {
          "<leader>li",
          "<cmd>Lspsaga incoming_calls<CR>",
          description = "Lspsaga incoming calls",
        },
        {
          "<leader>lo",
          "<cmd>Lspsaga outgoing_calls<CR>",
          description = "Lspsaga outgoing calls",
        },
        {
          "<A-e>",
          "<cmd>Lspsaga term_toggle<CR>",
          description = "Lspsaga toggle terminal",
        },
        {
          "gr",
          function()
            vim.lsp.buf.references()
          end,
          description = "Metals go to reference"
        },
        {
          "<leader>gi",
          function()
            require("telescope.builtin").lsp_implementations()
          end,
          description = "Metals go to implementation"
        },
        {
          "K",
          function()
            require('lsp_signature').toggle_float_win()
          end,
          description = "Toggle function signature"
        },
        {
          "H",
          ":lua vim.lsp.buf.hover()<CR>",
          description = "Metals hover"
        },
        {
          "<leader>cl",
          function() vim.lsp.codelens.run() end,
          description =
          "Code lense (aka Super method)"
        },
        {
          "<A-k>",
          function() vim.lsp.buf.signature_help() end,
          description =
          "Metals function signature"
        },
        { "zO", ':lua require("ufo").openAllFolds()<CR>',                description = "Open all folds" },
        { "zC", ':lua require("ufo").closeAllFolds()<CR>',               description = "Close all folds" },
        { 'zh', ':lua require("ufo").peekFoldedLinesUnderCursor()<CR>',  description = "Folded lines under cursor" },
        { 'zg', ':lua require("ufo.action").goNextClosedFold()<CR>',     description = "Go to next closed fold" },
        { 'zp', ':lua require("ufo.action").goPreviousClosedFold()<CR>', description = "Go to previous closed fold" },
        {
          "<leader>F",
          ":lua vim.lsp.buf.format()<CR>",
          description =
          "LSP format buffer"
        },
      },
    })
  end,
}
