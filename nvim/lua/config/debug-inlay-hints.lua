-- Debug helper for inlay hints
-- Run with :lua require("config.debug-inlay-hints").debug_inlay_hints()

local M = {}

function M.debug_inlay_hints()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })

  print("=== Inlay Hints Debug Info ===")
  print("Buffer:", buf)
  print("File type:", vim.bo[buf].filetype)
  print("LSP clients attached:", #clients)

  if #clients == 0 then
    print("❌ No LSP clients attached to current buffer")
    return
  end

  for i, client in ipairs(clients) do
    print(string.format("\n--- Client %d: %s ---", i, client.name))
    print("Server capabilities:")

    -- Check if client supports inlay hints
    local supports_inlay_hints = false
    if vim.fn.has("nvim-0.11") == 1 then
      supports_inlay_hints = client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, buf)
    else
      supports_inlay_hints = client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, { bufnr = buf })
    end

    if supports_inlay_hints then
      print("✅ Supports inlay hints")
    else
      print("❌ Does not support inlay hints")
    end

    -- Check client settings for inlay hints
    if client.config and client.config.settings then
      print("Settings configured:", vim.inspect(client.config.settings))
    end
  end

  -- Check if inlay hints are enabled for this buffer
  local inlay_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
  print("\n--- Inlay Hints Status ---")
  print("Enabled for current buffer:", inlay_enabled and "✅ Yes" or "❌ No")

  -- Try to enable inlay hints if they're not enabled
  if not inlay_enabled then
    print("\nTrying to enable inlay hints...")
    local success, err = pcall(vim.lsp.inlay_hint.enable, true, { bufnr = buf })
    if success then
      print("✅ Successfully enabled inlay hints")
    else
      print("❌ Failed to enable inlay hints:", err)
    end
  end

  -- Show available keymaps for inlay hints
  print("\n--- Available Keymaps ---")
  local keymaps = vim.api.nvim_buf_get_keymap(buf, 'n')
  for _, map in ipairs(keymaps) do
    if map.desc and (string.match(map.desc:lower(), "inlay") or string.match(map.desc:lower(), "hint")) then
      print(string.format("%s -> %s", map.lhs, map.desc))
    end
  end

  print("\n--- Manual Commands ---")
  print("Toggle inlay hints: :lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())")
  print("Check status: :lua print('Inlay hints enabled:', vim.lsp.inlay_hint.is_enabled())")
  print("Debug again: :lua require('config.debug-inlay-hints').debug_inlay_hints()")
end

function M.force_enable_inlay_hints()
  local buf = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(true, { bufnr = buf })
  print("Force enabled inlay hints for buffer", buf)
end

function M.toggle_inlay_hints()
  local buf = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
  print("Inlay hints", enabled and "disabled" or "enabled", "for buffer", buf)
end

return M
