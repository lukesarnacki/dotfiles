return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },
  opts = { pickers = { Notifications = { layout_strategy = "vertical" } } },
  config = function()
    require("telescope").load_extension("live_grep_args")
  end,
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", "dist", "build" },
  },
  keys = {
    { "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "Buffers list" },
    { "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live grep" },
    {
      "<leader>nn",
      function()
        require("telescope").load_extension("noice").noice({ layout_strategy = "vertical" })
      end,
    },
  },
}
