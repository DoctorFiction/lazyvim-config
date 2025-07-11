return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local defaults = opts.defaults or {}
    defaults.path_display = { "absolute" }
    opts.defaults = defaults
    return opts
  end,
}
