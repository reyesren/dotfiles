return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      -- Show hidden files
      hidden = true,
      file_ignore_patterns = {},
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true, -- include gitignored files
      },
      live_grep = {
        additional_args = function()
          return { "--hidden", "--no-ignore" } -- include hidden & ignored
        end,
      },
    },
  },
}
