return {
  "ray-x/lsp_signature.nvim",
  event = { "InsertEnter" },
  lazy = true,
  config = function()
    require("lsp_signature").on_attach {
      handler_opts = {
        border = "rounded",
      },
      extra_trigger_chars = {","},
      hint_inline = function() return false end,
      -- hint_prefix = {
      --   above = "↙ ",
      --   current = "← ",
      --   below = "↖ "
      -- },
      hint_prefix = "🐼 ",
      debug = false,
      log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
      bind = true,
      hint_enable = true,
      doc_lines = 3,
      floating_window = false,
      floating_window_above_cur_line = true,
      -- select_signature_key="M-k",
      -- zindex = 1002,
      -- fix_pos = false,
      -- floating_window_off_y = -7
    }
  end,
}
