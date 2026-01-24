vim.diagnostic.config({
  virtual_text = true, -- still show inline messages
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    max_width = 80, -- wrap after 80 chars
    max_height = 20,
    focusable = false,
    source = "always",
    format = function(diagnostic)
      return string.gsub(diagnostic.message, "\n", " ") -- replace newlines with spaces
    end,
  },
})
