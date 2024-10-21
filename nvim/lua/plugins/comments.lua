return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      pre_hook = function()
        return
            require("ts_context_commentstring.internal").calculate_commentstring()
      end
    })
  end,
}
