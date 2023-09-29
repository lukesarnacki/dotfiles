-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({ 'ellisonleao/gruvbox.nvim' })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  use('mbbill/undotree')

  use { 'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb'
  }

  use('airblade/vim-gitgutter')

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
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
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  use 'preservim/nerdtree'

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest"
    }
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = function() require("symbols-outline").setup() end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'https://codeberg.org/esensar/nvim-dev-container',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }

  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }

  use 'jparise/vim-graphql'

  use 'RRethy/vim-illuminate'

  use 'github/copilot.vim'

  use { 'vim-test/vim-test',
    -- For using vimux strategy
    requires = { 'preservim/vimux' }
  }

  use 'puremourning/vimspector'
end)
