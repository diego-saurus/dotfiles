local M = {}

function M.fix_all_tailwind_suggestion()
  local bufnr = vim.api.nvim_get_current_buf()
  local edits = {}

  for _, diagnostic in ipairs(vim.diagnostic.get(bufnr)) do
    local lsp = diagnostic.user_data and diagnostic.user_data.lsp

    if lsp and lsp.code == "suggestCanonicalClasses" then
      table.insert(edits, {
        range = lsp.range,
        newText = lsp.suggestions[1],
      })
    end
  end

  local client = vim.lsp.get_clients({
    bufnr = bufnr,
    name = "tailwindcss",
  })[1]

  vim.lsp.util.apply_text_edits(edits, bufnr, client and client.offset_encoding or "utf-16")
end

return M
