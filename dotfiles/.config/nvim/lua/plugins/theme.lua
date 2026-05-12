-- return {
--   {
--     "bluz71/vim-moonfly-colors",
--     name = "moonfly",
--     priority = 1000,
--     config = function()
--       vim.g.moonflyItalics = true
--       vim.g.moonflyCursorColor = true
--       vim.g.moonflyNormalFloat = true
--
--       vim.g.moonflyTransparent = true
--
--       vim.cmd.colorscheme("moonfly")
--     end,
--   },
-- }

return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      options = {
        transparent = true,
      },
    })

    vim.cmd("colorscheme github_dark_default")
  end,
}
