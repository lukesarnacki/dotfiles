vim.opt.guicursor = ""

vim.opt.visualbell = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.numberwidth = 4 -- gutter width
vim.opt.cursorline = true -- display cursor line
vim.opt.cursorlineopt = 'number'
vim.opt.autoread = true
vim.opt.history = 1000

vim.opt.syntax = "ON" -- str:  Allow syntax highlighting
vim.opt.termguicolors = true -- bool: If term supports ui color then enable

vim.opt.ignorecase = true -- bool: Ignore case in search patterns
vim.opt.smartcase = true -- bool: Override ignorecase if search contains capitals
vim.opt.incsearch = true -- bool: Use incremental search
vim.opt.hlsearch = true -- bool: Highlight search matches

vim.opt.splitright = true -- bool: Place new window to right of current one
vim.opt.splitbelow = true -- bool: Place new window below the current one
