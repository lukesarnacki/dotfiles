vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.colorcolumn = '80'

-- use space as a the leader key
vim.g.mapleader = ' '

require("gruvbox").setup({
  contrast = "hard",
})

-- require('onedark').setup {
--     style = 'warmer'
-- }
-- require('onedark').load()

vim.cmd([[
  set background=dark
  colorscheme gruvbox
]])

vim.cmd([[
	set tabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent

  set t_Co=256

  set spelllang=en_us
]])

local opt = vim.opt

opt.visualbell = true
opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column
opt.numberwidth = 4 -- gutter width
opt.cursorline = true -- display cursor line
opt.cursorlineopt = 'number'
opt.autoread = true
opt.history = 1000

vim.cmd([[
set noswapfile
set nobackup
set nowb
]])


-- persistent undo
vim.cmd([[
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
]])

opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable

opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = true -- bool: Highlight search matches

opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- vertical and horizontal spits
vim.cmd([[
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
]])

-- Functional wrapper for mapping custom keybindings
-- mode (as in Vim modes like Normal/Insert mode)
-- lhs (the custom keybinds you need)
-- rhs (the commands or existing keybinds to customise)
-- opts (additional options like <silent>/<noremap>, see :h map-arguments for more info on it)
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quit buffer
map("n", "qq", ":q<cr>")
map("n", "qa", ":qa<cr>")


-- Better escape
require("better_escape").setup {
    mapping = { "jk", "kj" }, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
}


require'range-highlight'.setup{}

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- map("n", "<leader>fm", ":Telescope media_files<cr>")
--
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b',  builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fl', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})

vim.keymap.set('n', '<leader>fc',  builtin.commands, {})
vim.keymap.set('n', '<leader>fch', builtin.command_history, {})
vim.keymap.set('n', '<leader>fsh', builtin.search_history, {})
vim.keymap.set('n', '<leader>fmp', builtin.man_pages, {})
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, {})

-- Clear last search highlighting
vim.keymap.set('n', '<leader><Space>', ':noh<cr>')

-- Save
vim.cmd([[
noremap  <silent> <C-S> :w<CR>
vnoremap <silent> <C-S> <C-C>:w<CR>
inoremap <silent> <C-S> <Esc>:w<CR>
]])

-- Trouble
map("n", "<leader>e", ":TroubleToggle<cr>")

-- Nvim Tree
map("n", "<leader>nt", ":NvimTreeToggle<CR>")

-- LSP Navigation
-- Code Actions
map('n', "ca", ":lua vim.lsp.buf.code_action()<CR>")
vim.cmd([[
"nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gc        <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gn        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> ff        <cmd>lua vim.lsp.buf.format()<CR>
]])

vim.cmd([[
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
]])

-- Ruby lsp
--require'lspconfig'.solargraph.setup{}
--require'lspconfig'.sorbet.setup{}
--require'lspconfig'.typeprof.setup{}

-- LSP Diagnostics Options Setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end
sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
        border = 'single',
        source = 'always',
        header = '',
        prefix = '- ',
    },
})
-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.o.updatetime = 350
opt.signcolumn = 'yes'
vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Symbols Outline (new tagbar)
require("symbols-outline").setup {
    show_guides = false,
    position = 'left',
    width = 35,
    wrap = false,
    keymaps = { fold = "h", unfold = "l", fold_all = "zM", unfold_all = "zR" },
    symbols = {
        File = { icon = "", hl = "TSURI" },
        Module = { icon = "全", hl = "TSNamespace" },
        Namespace = { icon = "凜", hl = "TSNamespace" },
        Package = { icon = "", hl = "TSNamespace" },
        Class = { icon = "", hl = "TSType" },
        Method = { icon = "", hl = "TSMethod" },
        Property = { icon = "", hl = "TSMethod" },
        Field = { icon = "", hl = "TSField" },
        Constructor = { icon = "", hl = "TSConstructor" },
        Enum = { icon = "", hl = "TSType" },
        Interface = { icon = "ﰮ", hl = "TSType" },
        Function = { icon = "", hl = "TSFunction" },
        Variable = { icon = "", hl = "TSConstant" },
        Constant = { icon = "", hl = "TSConstant" },
        String = { icon = "", hl = "TSString" },
        Number = { icon = "#", hl = "TSNumber" },
        Boolean = { icon = "⊨", hl = "TSBoolean" },
        Array = { icon = "", hl = "TSConstant" },
        Object = { icon = "", hl = "TSType" },
        Key = { icon = "🔐", hl = "TSType" },
        Null = { icon = "ﳠ", hl = "TSType" },
        EnumMember = { icon = "", hl = "TSField" },
        Struct = { icon = "", hl = "TSType" },
        Event = { icon = "🗲", hl = "TSType" },
        Operator = { icon = "+", hl = "TSOperator" },
        TypeParameter = { icon = "", hl = "TSParameter" }
    },
}

-- Fidget - show status of LSP progress
require "fidget".setup {
    window = {
        relative = "editor",
        blend = 10,
    },
}

-- Trouble Setup
require('trouble').setup {
    position = "right",
    width = 75,
    padding = true,
    auto_preview = false,
}
-- Nvim Tree Setup
require('nvim-tree').setup {
    sort_by = "case_sensitive",
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            git_placement = "after",
            glyphs = {
                git = {
                    unstaged = "-",
                    staged = "s",
                    untracked = "u",
                    renamed = "r",
                    deleted = "d",
                    ignored = "i",
                },
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
}

-- Telescope Setup
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "^./.git/",
            "^./target/",
            "LICENSE*",
            "node_modules",
            "tags"
        },
        layout_strategy = 'vertical',
        layout_config = { height = 0.95, width = 0.95 },
    },
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg", "ppm", "pdf" },
            find_cmd = "rg", -- find command (defaults to `fd`)
        },
    },
}
-- load extension to support preview of media files
-- require('telescope').load_extension('media_files');
-- Get fzf loaded and working with extension
require('telescope').load_extension('fzf')

-- Autopairs Setup
require 'nvim-autopairs'.setup {}

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

-- Comment Setup
require('Comment').setup({
    mappings = {
        basic = false,
        extra = false,
        extended = false,
    },
})

-- LSP Config
local nvim_lsp = require 'lspconfig'
nvim_lsp.pyright.setup{}
--nvim_lsp.ruby_ls.setup{}
nvim_lsp.solargraph.setup{}

-- Completion

require('lspkind').init({
    -- mode = 'symbol_text'
})


-- treesitter

require('nvim-treesitter.configs').setup {
    ensure_installed = { "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "gowork", "hcl", "help", "html",
        "http", "javascript", "json", "make", "markdown", "python", "regex", "ruby", "rust", "toml", "vim", "yaml",
        "zig" },
    auto_install = true,
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<S-Tab>", -- normal mode
            node_incremental = "<Tab>", -- visual mode
            node_decremental = "<S-Tab", -- visual mode
        },
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
    }
}

-- dap

local dap = require('dap')
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

-- RUST
-- -------------------------------------
local rt = require("rust-tools")

local extension_path = vim.env.HOME
    .. "/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path,
      liblldb_path
    ),
  },
})

dap.adapters.ruby = {
  type = 'server',
  host = '127.0.0.1',
  port = 38697,
}
dap.configurations.ruby = {
  {
      type = 'ruby';
      request = 'launch';
      command = "bundle exec ruby";
      script = "${file}";
  }
}


require("dapui").setup()

require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dd', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)


require('spectre').setup()

vim.cmd([[
nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
]])


require("neotest").setup({
  adapters = {
    require("neotest-python"),
    require("neotest-rspec")
  }
})

-- For GBrowse in fugitive to work 
vim.api.nvim_command(
  "command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)"
)

-- Colored indents from indent-blankline
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#541216 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#6a4d15 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- 
-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- 
-- require("indent_blankline").setup {
--     space_char_blankline = " ",
--     char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--         "IndentBlanklineIndent3",
--         "IndentBlanklineIndent4",
--         "IndentBlanklineIndent5",
--         "IndentBlanklineIndent6",
--     },
-- }

