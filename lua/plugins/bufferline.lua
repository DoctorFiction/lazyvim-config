return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      max_name_length = math.huge,
      max_prefix_length = math.huge,
      truncate_names = false,
      always_show_bufferline = true,
    },
  },
}
