-- -- bootstrap lazy.nvim, LazyVim and your plugins
-- if vim.g.vscode then
--   vim.opt.number = true -- Enable line numbers in VSCode Neovim
--   vim.opt.relativenumber = true -- Disable relative numbers for simplicity
--   vim.opt.cursorline = true -- Highlight the current line
--   vim.opt.wrap = true
-- else
require("config.lazy")
-- end
--
if vim.g.vscode then
  vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>", { noremap = true, silent = true })
  -- Map <leader>e to open the file explorer in VSCode
  vim.api.nvim_set_keymap(
    "n",
    "<leader>e",
    ':call VSCodeNotify("workbench.view.explorer")<CR>',
    { noremap = true, silent = true }
  )

  vim.api.nvim_set_keymap("n", "<leader>r", ":source $MYVIMRC<CR>", { noremap = true, silent = true })
end
