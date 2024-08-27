return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "haydenmeade/neotest-jest",
        dir = "~/projects/neotest-jest/",
      },
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {},
      },
      quickfix = {
        open = function() end,
      },
    },
    -- opts = function(_, opts)
    --   table.insert(opts.quickfix, {
    --     open = function() end,
    --   })
    --   table.insert(
    --     opts.adapters,
    --     require("neotest-jest")({
    --       cwd = function()
    --         return vim.fn.getcwd()
    --       end,
    --     })
    --   )
    --   opts.log_level = vim.log.levels.DEBUG
    -- end,
  },
}
