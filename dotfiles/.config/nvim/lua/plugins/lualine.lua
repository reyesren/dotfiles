return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      "searchcount",
      maxcount = 999999, -- Set a high limit
      timeout = 500,
    })
  end,
}
