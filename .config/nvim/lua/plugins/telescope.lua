return {
  "nvim-telescope/telescope.nvim",
  opts = { pickers = { Notifications = { layout_strategy = "vertical" } } },
  keys = {
    { "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "Buffers list" },
    {
      "<leader>nn",
      function()
        require("telescope").load_extension('noice').noice({ layout_strategy = "vertical" })
      end,
    },
  },
}
