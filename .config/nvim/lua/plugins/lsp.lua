return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "intelephense" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        intelephense = {
          stubs = {
            "Core",
            "wordpress",
          },
          environment = {
            includePaths = "/home/luke/projects/woocommerce-stickermule/vendor/php-stubs",
          },
          files = {
            maxSize = 5000000,
          },
        },
        tsserver = {
          init_options = {
            hostInfo = "neovim",
            preferences = { importModuleSpecifierPreference = "relative" },
            tsserver = { trace = "messages" },
          },
        },
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "relative",
              },
              trace = {
                server = "messages",
              },
            },
          },
          init_options = {
            hostInfo = "neovim",
          },
        },
      },
      diagnostics = {
        virtual_text = false,
        virtual_improved = {
          current_line = "only",
        },
        update_in_insert = true,
        underline = false,
        severity_sort = true,
        float = {
          border = "single",
          source = "always",
          header = "",
          prefix = "- ",
        },

        -- underline = true,
        -- update_in_insert = false,
        -- virtual_text = {
        --   spacing = 4,
        --   source = "if_many",
        --   prefix = "●",
        --   -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        --   -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        --   -- prefix = "icons",
        -- },
        -- severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("lazyvim.config").icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = require("lazyvim.config").icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = require("lazyvim.config").icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = require("lazyvim.config").icons.diagnostics.Info,
          },
        },
      },
    },
  },
  {
    "luozhiya/lsp-virtual-improved.nvim",
    event = { "LspAttach" },
    config = function()
      require("lsp-virtual-improved").setup()
    end,
  },
}
