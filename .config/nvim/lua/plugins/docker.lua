return {
  {
    "crnvl96/lazydocker.nvim",
    keys = {
      {
        "<leader>k",
        "<cmd>LazyDocker<CR>",
        desc = "Toggle LazyDocker",
        noremap = true,
        silent = true,
      },
    },
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
