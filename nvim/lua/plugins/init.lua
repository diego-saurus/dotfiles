return {
  -- {
  --   "mfussenegger/nvim-dap",
  -- },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    opts = require "configs.lspconfig",
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",
        "printf",
        "markdown",

        -- web dev
        "css",
        "javascript",
        "typescript",
        "tsx",

        -- mobile dev
        "dart",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      package_manager = "pnpm",
      ensure_installed = {
        "lua-language-server",
        "prettier",
        "stylua",
        "css-lsp",
        "eslint-lsp",
        "typescript-language-server",
      },
    },
  },
  -- {
  --   "github/copilot.vim",
  --   event = "BufEnter",
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "InsertEnter",
  --   config = function()
  --     require "configs.copilot"
  --   end,
  -- },
  -- {
  --   "Exafunction/windsurf.vim",
  --   event = "BufEnter",
  -- },
  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    ft = "dart",
    config = function()
      require "configs.flutter-tools"
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<C-j>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-k>",
        },
      }
    end,
  },
  {
    "famiu/bufdelete.nvim",
    lazy = false,
  },
}
