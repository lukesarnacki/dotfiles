return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "max397574/better-escape.nvim" -- faster jj / kshadowk

  -- color themes
  use "ellisonleao/gruvbox.nvim"
  use "EdenEast/nightfox.nvim"
  use "sainnhe/sonokai"
  use "sainnhe/gruvbox-material"
  use "overcache/NeoSolarized"
  use "folke/tokyonight.nvim"
  use 'navarasu/onedark.nvim'

  -- highlight selected range
  use 'winston0410/cmd-parser.nvim' -- required for this to work
  use 'winston0410/range-highlight.nvim'

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
 })

    use {
      "windwp/nvim-autopairs", -- Autocomplete (), {}, []
      config = function() require("nvim-autopairs").setup {} end
  }

  -- LSP / DAP
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use {'theHamsta/nvim-dap-virtual-text'}
  use 'suketa/nvim-dap-ruby'
  use 'tpope/vim-bundler'
  use { 'Pocco81/dap-buddy.nvim' }
  use 'williamboman/mason-lspconfig.nvim' -- manage LSP binaries
  use 'williamboman/mason.nvim' -- Manage LSPs and DAPs
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim' -- shows icons in cmp
  use 'j-hui/fidget.nvim' -- show status of nvim-lsp progress

  use 'lewis6991/impatient.nvim' -- Makes neovim faster
  use 'tpope/vim-surround'
  use 'RRethy/vim-illuminate' -- Highlight other uses of word under cursor
  use "lukas-reineke/indent-blankline.nvim" -- ident lines
  use 'numToStr/Comment.nvim' -- Enable comments
  use 'folke/trouble.nvim' -- Summarizes issues
  -- Telescope
  use 'nvim-lua/plenary.nvim' -- Collection of Lua functions (also needed for telescope)
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Make telescope faster
  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
  use 'nvim-lua/popup.nvim' -- Poup for telescope
  use 'BurntSushi/ripgrep' -- Telescope grep
  use 'sharkdp/fd' -- Finder

  use 'm-demare/hlargs.nvim' -- Highlight argument definitions and usages


  use 'mortepau/codicons.nvim' -- fonts for dap-ui

  -- Rust
  use 'simrat39/rust-tools.nvim' -- rust-analyzer hints and more!
  use 'saecki/crates.nvim' -- Help managing crates dependencies

  use 'simrat39/symbols-outline.nvim' -- symbols view

  -- nvim tree
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
}

  use 'christoomey/vim-tmux-navigator'

  use 'nvim-pack/nvim-spectre'

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec"
    }
  }

  -- Show possible key combinations 
  -- TODO: finish config
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
 
end)


-- to look into:
-- https://github.com/mrjones2014/legendary.nvim
-- https://github.com/anuvyklack/hydra.nvim
-- https://github.com/petertriho/nvim-scrollbar
--
