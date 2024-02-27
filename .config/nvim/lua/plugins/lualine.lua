return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          path = 1, -- 1 for relative path, 0 for just the filename
        },
      },
      lualine_z = {},
    },
  },
}
