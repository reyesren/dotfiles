local M

-- Call this in the keymap that opens lazygit
function M.set_tracked_window()
  local winid = vim.api.nvim_get_current_win()
  local file = io.open("/tmp/nvim_tracked_window", "w")
  if file then
    file:write(tostring(winid))
    file:close()
  end
end

-- This is what lazygit sends to nvim in its edit command
-- with this, the file is opened in the same window lazygit was opened from
function M.open_in_tracked_window(filename)
  local file = io.open("/tmp/nvim_tracked_window", "r")
  if not file then
    vim.cmd("edit " .. vim.fn.fnameescape(filename))
    return
  end

  local winid = tonumber(file:read("*l"))
  file:close()

  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_set_current_win(winid)
  end
  vim.cmd("edit " .. vim.fn.fnameescape(filename))
end

return M
