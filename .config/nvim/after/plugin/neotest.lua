require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-elixir"),
    require 'neotest-jest' --{
    --   jestCommand = "docker-compose exec store-bridge yarn jest test --",
    --   jestConfigFile = "/app/jest.config.js",
    --   cwd = function()
    --     local cwd = require('neotest-jest.util').find_package_json_ancestor(vim.fn.expand('%:p:h'))
    --     print('------ cwd:', cwd)
    --     return cwd
    --   end,
    -- }
  },
})
