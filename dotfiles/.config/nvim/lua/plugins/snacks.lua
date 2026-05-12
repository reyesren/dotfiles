return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          -- Putting it here specifically for the explorer source
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
