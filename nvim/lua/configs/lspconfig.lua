require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- "html",
  "cssls",
  "tailwindcss",
  -- "intelephense",
  "oxlint",

  -- "angularls",
  -- "rust_analyzer",
  -- "biome",
  "ts_ls",
  "vue_ls",
  "jsonls",
  "eslint",
  "astro",
  -- "dartls",
}

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
        configNamespace = "typescript",
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

vim.lsp.config("tailwindcss", {
  settings = {
    tailwindCSS = {
      classFunctions = { "clsx", "cn", "cva", "tv" },
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
