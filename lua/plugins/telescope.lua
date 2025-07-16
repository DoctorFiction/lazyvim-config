return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      hidden = true,
      path_display = { "smart" },
    })

    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--no-ignore" },
      },
    })

    return opts
  end,
}
