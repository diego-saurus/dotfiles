require("copilot").setup {
  suggestion = {
    enabled = true, -- Enable inline suggestions
    auto_trigger = true, -- Automatically show suggestions as you type
    keymap = {
      accept = "<C-j>", -- Accept suggestion
      next = "<C-;>", -- Go to next suggestion
      prev = "<C-l>", -- Go to previous suggestion
    },
  },
  -- copilot_model = "claude-opus-4.5",
  panel = {
    enabled = true, -- Enable the Copilot suggestion panel
    auto_refresh = true, -- Auto-refresh panel suggestions
  },
  filetypes = {
    -- Enable Copilot for specific filetypes
    javascript = true,
    typescript = true,
    javascriptreact = true,
    typescriptreact = true,
    vue = true,
    html = true,
    css = true,
    scss = true,
    less = true,
    json = true,
    dart = true, -- Flutter
    markdown = true,
    lua = true,
    -- Disable for certain filetypes if necessary
    -- ["*"] = false, -- Disallow in commit messages
  },
}
