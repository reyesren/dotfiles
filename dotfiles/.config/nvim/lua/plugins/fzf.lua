return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        actions = {
          files = {
            ["default"] = require("fzf-lua.actions").file_edit,
            ["ctrl-s"]  = require("fzf-lua.actions").file_split,
            ["ctrl-v"]  = require("fzf-lua.actions").file_vsplit,
            ["ctrl-t"]  = require("fzf-lua.actions").file_tabedit,
          },
        },
        files = {
          fd_opts = [[--type f --hidden -I --exclude .git --exclude node_modules --exclude dist --exclude .venv --exclude data --exclude ".[^acegz]*" .]],
        },
        winopts = {
          preview = {
            layout = "horizontal",
            vertical = "down:40%",
            winopts = { -- builtin previewer window options
              number = true,
              relativenumber = false,
              cursorline = true,
              cursorlineopt = "both",
              cursorcolumn = false,
              signcolumn = "no",
              list = false,
              foldenable = false,
              foldmethod = "manual",
              scrolloff = 0,
              winblend = 0,
            },
          },
        },
        grep = {
          rg_opts = table.concat({
            "--column",
            "--line-number",
            "--no-heading",
            "--color=always",
            "--smart-case",
            "--max-columns=512",
            "--hidden",
            "--no-ignore",
            -- Exclusion Folders (Same as your FD config)
            "--glob=!**/.git/*",
            "--glob=!node_modules/*",
            "--glob=!dist/*",
            "--glob=!.venv/*",
            "--glob=!data/*",
            -- The Logic: Exclude everything starting with a dot UNLESS it's e, g, or s
            -- We use the regex exclusion flag instead of multiple globs for reliability
            "--iglob=!.[^acegz]*",
          }, " "),
          rg_glob = true,
          -- first returned string is the new search query
          -- second returned string are (optional) additional rg flags
          -- @return string, string?
          rg_glob_fn = function(query, opts)
            local regex, flags = query:match("^(.-)%s%-%-(.*)$")
            -- If no separator is detected will return the original query
            return (regex or query), flags
          end,
        },
      })

      -- Keymaps
      local fzf = require("fzf-lua")

      -- Override LazyVim Telescope mappings
      vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files (fzf)" })
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep (fzf)" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers (fzf)" })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help (fzf)" })
    end,
  },
}
