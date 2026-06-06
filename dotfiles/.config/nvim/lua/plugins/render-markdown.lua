return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      preset = "lazy",
    },
    keys = {
      {
        "<leader>fm",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Markdown Render",
        ft = "markdown",
      },
    },
  },
}
