return {
  "https://gitlab.com/itaranto/plantuml.nvim",
  version = "*",
  config = function()
    require("plantuml").setup({
      renderer = {
        type = "imv",
        options = {
          dark_mode = false,
          format = nil, -- Allowed values: nil, 'png', 'svg'.
        },
      },
      render_on_write = true,
    })
  end,
}
