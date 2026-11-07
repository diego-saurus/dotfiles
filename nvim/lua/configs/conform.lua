local js_formatter = { "oxfmt" }

local options = {
  formatters = {
    dart_format = {
      command = "dart",
      args = { "format", "$FILENAME" },
    },
  },

  formatters_by_ft = {
    lua = { "stylua" },
    dart = { "dart_format" },
    astro = js_formatter,
    json = js_formatter,
    javascript = js_formatter,
    typescript = js_formatter,
    typescriptreact = js_formatter,
    javascriptreact = js_formatter,
    scss = js_formatter,
    css = js_formatter,
    html = js_formatter,
    vue = js_formatter,
    yaml = js_formatter,
  },
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

return options
