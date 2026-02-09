return {
  {
    "gbprod/cutlass.nvim",
    opts = {
      cut_key = "<Del>",
      override_del = false,
    },

    config = function(_, opts)
      require("cutlass").setup(opts)

      -- Force <Del> to be the CUT operator (like `d`)
      vim.keymap.set({ "n", "x" }, "<Del>", "d", { noremap = true, silent = true, desc = "Cut (operator)" })

      -- Keep double-press as cut line
      vim.keymap.set("n", "<Del><Del>", "dd", { noremap = true, silent = true, desc = "Cut line" })
    end,
  },
}
