return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "sainnhe/sonokai",
    init = function()
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_transparent_background = 1
    end,
  },
  { "Mofiqul/vscode.nvim", opts = { transparent = true } },
  {
    "Mofiqul/dracula.nvim",
    opts = {
      transparent_bg = true,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "osaka",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  { "rose-pine/neovim" },
  { "scottmckendry/cyberdream.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {
    transparent_background = true,
  } },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
