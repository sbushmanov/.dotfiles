return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    lazy = true,
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- event = { "CursorMoved", "BufNewFile" },
    -- cmd = { "LspInfo", "LspInstall", "InsertEnter" },
    dependencies = {
      "williamboman/mason.nvim"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "rust_analyzer", "bashls", "jsonls", "pyright", "ruff" }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "CursorMoved", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "InsertEnter" },
    dependencies = {
      'nvimdev/lspsaga.nvim',
    },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
    end
  },
}
