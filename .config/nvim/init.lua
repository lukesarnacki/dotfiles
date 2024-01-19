local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  'ellisonleao/gruvbox.nvim',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'nvim-treesitter/playground',
  'mbbill/undotree',
  { 'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb'
  },
  'airblade/vim-gitgutter',
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- shows status of nvim-lsp progress
      { 'j-hui/fidget.nvim' },

      -- shows icons for cmp
      { 'onsails/lspkind.nvim' },

      -- somehow python format doesn't work without it
      { 'jose-elias-alvarez/null-ls.nvim' }
    }
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },

  'preservim/nerdtree',

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest"
    }
  },

  {
    'simrat39/symbols-outline.nvim',
    config = function() require("symbols-outline").setup() end
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    'https://codeberg.org/esensar/nvim-dev-container',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },

  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

  { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },

  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },

  'jparise/vim-graphql',

  'RRethy/vim-illuminate',

  'github/copilot.vim',

  {
    'vim-test/vim-test',
    -- For using vimux strategy
    dependencies = { 'preservim/vimux' }
  },

    'puremourning/vimspector'
  })

require("config")

