-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "rxyhn",
    transparency = false,
    hl_override = { Comment = { italic = true }, ["@comment"] = { italic = true } },
  },
  ui = {
    statusline = {
      theme = "vscode_colored",
    },
    cmp = {
      style = "flat_light",
    },
    telescope = {
      style = "borderless",
    },
    tabufline = {},
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "               ▒▒▒▒▒▒▒▒▒▒▒▓▓██▓▓▒▒▒▒▒▒▒▒▓           ",
      "            ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▒▒▒▒▒▒▒▒▒▒▒▒        ",
      "          ▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒     ",
      "          ▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▓██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ",
      "          ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓  ",
      "          ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓█▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ",
      "           ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒ ",
      "             ▓▒▒▒▒▓▓▓▒▒▒▒▒▒▒▒           ▒▒▒▒▒▒▒▒▒▒▒▒",
      "               █████▓▒▒▒▒▒▒▒▒            ▓▒▒▒▒▒▒▒▒▒▒",
      "   ▒▓█      ████████▒▒▒▒▒▒▒▒▒             ▒▒▒▒▒▒▒▒▒▒",
      " ▒▒▓█      ███████▓▒▒▒▒▒▒▒▒▒▒             ▒▒▒▒▒▒▒▒▒▒",
      " ▒▓██     ██████▓▓▒▒▒▒▒▒▒▒░░▒▒▒           ▒▒▒▒▒▒▒▒▒▒",
      "▒▒▓██    ██████▓▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒",
      "▒▒▓██    ██████▒▒▒▒▒▒▒▒▒▒▒▒░░            ▒▒▒▒▒▒▒▒▒▒▒",
      "▒▒▓▓██ ██████▓▒▒▒▒▒▒▒▒▒░░░░░░          ▒▒▒▒▒▒▒▒▒▒▒▒▓",
      "▒▒▒▒▓▓█████▓▓▒▒▒▒▒▒▒▒▒▒░░░░░       ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ",
      "▓▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ",
      " ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   ",
      "  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     ",
      "    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒       ",
      "       ▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          ",
      "           ▒▒▒▒▒▒▒ ▒▒▒▒▒                            ",
      "           ▒▒▒▒▒▒▒ ▒▒▒▒▒▒                           ",
      "                                                    ",
      "                  Powered By Diegosaurus           ",
      "                                                    ",
      "                                                    ",
    },
    buttons = {
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles cwd_only=true" },
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
        content = "fit",
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },
}

return M
