return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  keys = {
    {
      "<leader>rs",
      function() require("rip-substitute").sub() end,
      mode = { "n", "x" },
      desc = " rip substitute",
    },
  },
  config = function()
    require("rip-substitute").setup({
      popupWin = { position = "top" }
    })
  end
}
