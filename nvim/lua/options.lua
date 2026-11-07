require "nvchad.options"

local o = vim.opt
o.cursorlineopt = "both" -- to enable cursorline!

o.relativenumber = true
o.exrc = true
-- vim.o.secure = true

o.hidden = true

-- Folding using lsp
o.foldenable = false
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
o.foldcolumn = "0"
o.foldlevel = 99
o.foldlevelstart = 1
o.foldnestmax = 4

-- Limit to 16 recent files and 16 marks
o.shada = "'16,<16,s10,h"
