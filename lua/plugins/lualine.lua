return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Find the section that shows filename and update it
    for _, section in pairs(opts.sections) do
      for i, component in ipairs(section) do
        if component == "filename" or (type(component) == "table" and component[1] == "filename") then
          section[i] = {
            "filename",
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path, 3 = filename + parent dir
            shorting_target = 100, -- don’t shorten paths
          }
        end
      end
    end
  end,
}
