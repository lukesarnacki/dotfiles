vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.cmd([[
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
]])

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
vim.keymap.set('n', '<C-p>', telescope.git_files, {})
vim.keymap.set('n', '<leader>b', telescope.buffers, {})
vim.keymap.set('n', '<leader>ps', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>pr', telescope.resume, {})

-- Trouble
vim.keymap.set("n", "<leader>e", vim.cmd.TroubleToggle)

-- Nvim Tree
vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle)

-- Clear last search highlighting
vim.keymap.set('n', '<Space>', ':noh<cr>')

-- Move selection up / down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor on the beginning of the line when using J
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle for C-d / C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search term stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- allows pasting over text without loosing original text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copies to system register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation
vim.keymap.set("n", "<C-S-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-S-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace yanked word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- neotest
-- in favor of vim-test until containers are supported
-- vim.keymap.set("n", "<leader>tr", '<Cmd>lua require("neotest").run.run()<CR>')
-- vim.keymap.set("n", "<leader>tf", '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
-- vim.keymap.set("n", "<leader>td", '<Cmd>lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})<CR>')
-- vim.keymap.set("n", "<leader>to", '<Cmd>lua require("neotest").output_panel.toggle()<CR>')
-- vim.keymap.set("n", "<leader>th", '<Cmd>lua require("neotest").output.open()<CR>')
-- vim.keymap.set("n", "<leader>ts", '<Cmd>lua require("neotest").summary.toggle()<CR>')


-- vim-test
vim.api.nvim_set_keymap('n', '<leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ta', ':TestSuite<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':TestVisit<CR>', { noremap = true, silent = true })

-- vim-test with debugger
vim.api.nvim_set_keymap('n', '<leader>tdn', ':lua run_test_and_continue_dap("TestNearest")<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tdf', ':lua run_test_and_continue_dap("TestFile")<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tda', ':lua run_test_and_continue_dap("TestSuite")<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tdl', ':lua run_test_and_continue_dap("TestLast")<CR>',
{ noremap = true, silent = true })


-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- NERDTree
vim.keymap.set("n", "<leader>n", vim.cmd.NERDTreeFocus)
vim.keymap.set("n", "<leader>nt", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<leader>nf", vim.cmd.NERDTreeFind)

-- Aerial
vim.keymap.set('n', '<leader>o', '<cmd>SymbolsOutline<CR>')

-- DAP, Debugger
vim.keymap.set("n", "<leader>db", "<Cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<Cmd>lua require('dap').continue()<CR>")
