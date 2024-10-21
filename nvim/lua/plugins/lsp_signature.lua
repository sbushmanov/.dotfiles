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
      hint_prefix = {
        above = "↙ ",
        current = "← ",
        below = "↖ "
      },
      debug = false,
      log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
      bind = true,
      hint_enable = true,
      doc_lines = 10,
      floating_window = true,
    }
  end,
}
