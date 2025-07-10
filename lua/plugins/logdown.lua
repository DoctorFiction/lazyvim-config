-- lua/plugins/logdown.lua

return {
  "DoctorFiction/logdown.nvim",
  config = function()
    require("logdown").setup()
  end,
}
