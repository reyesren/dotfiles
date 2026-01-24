return {
  -- 1. Add the Sonokai plugin
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional: Configure the variant before loading
      -- Variants: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
      vim.g.sonokai_style = "default"
      vim.g.sonokai_better_performance = 1
    end,
  },

  -- 2. Configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
