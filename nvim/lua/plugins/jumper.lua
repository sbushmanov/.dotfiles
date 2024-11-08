return {
  "homerours/jumper.nvim",
  event = { "CursorMoved", "BufNewFile" },
  -- event="VeryLazy",
  config = function()
    local jumper = require('telescope').extensions.jumper
  end
}
