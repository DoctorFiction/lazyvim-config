return {
  "andrewferrier/debugprint.nvim",
  opts = {
    -- enable default keymaps like g?p
    create_keymaps = true,
  },
  config = function(_, opts)
    require("debugprint").setup(opts)
  end,
}
