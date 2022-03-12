--
-- FOLD CYCLE | UTILS
--

local fn = vim.fn
local cmd = vim.cmd

local M = {}

-- fix for movement over folds when softwrapped
M.softwrap_movement_fix = function(movement)
  if vim.opt.wrap:get() then
    if movement == 'k' then
      local current_line = fn.line('.')
      local prev_line = current_line - 1
      local folded = fn.foldclosed(prev_line)
      if folded == -1 then
        cmd('normal! g' .. movement)
      else
        cmd('normal! ' .. folded .. 'G')
      end
    else
      cmd('normal! g' .. movement)
    end
  else
    cmd('normal! ' .. movement)
  end
end

return M
