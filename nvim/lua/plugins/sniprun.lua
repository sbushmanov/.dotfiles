return {
  {
    "michaelb/sniprun",
    branch = "master",
    event = "VeryLazy",
    build = "sh install.sh 1",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
    config = function()
      require("sniprun").setup({
        display = { "NvimNotify" },
        display_options = {
          notification_timeout = 2
        }
      })
    end,
  },
}
