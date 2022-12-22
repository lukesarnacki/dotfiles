require("luke")
print("hello")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
