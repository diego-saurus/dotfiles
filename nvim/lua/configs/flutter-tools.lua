local ft = require "flutter-tools"

local map = vim.keymap.set

map("n", "<leader>fl", ":Telescope flutter commands <cr>", {})

ft.setup {
  ui = {
    border = "rounded",
  },
  decorations = {
    statusline = {
      app_version = true, -- Show the app version from pubspec.yaml
      device = true, -- Show the currently targeted device/emulator
      project_config = true, -- Show the current project configuration (if using setup_project)
    },
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabnew",
  },
  widget_guides = {
    enabled = true,
  },
  dev_tools = {
    autostart = false,
  },
  closing_tags = {
    enabled = true,
    highlight = "Visual", -- Use a prominent highlight to make them clear
    prefix = ">",
    priority = 10,
  },
  -- Debugger Integration (Full nvim-dap integration)
  -- debugger = {
  --   enabled = true,
  --   -- Set to true: this allows debugging views (hovers, variables) to show detailed
  --   -- toString() output, which is slightly heavier but much more useful. Your CPU can handle it.
  --   evaluate_to_string_in_debug_views = true,
  --   exception_breakpoints = {}, -- Default: stop on all exceptions
  -- },
}
