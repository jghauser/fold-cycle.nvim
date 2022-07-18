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
      local folded_current = fn.foldclosed(current_line)
      local prev_line = current_line - 1
      local folded_prev = fn.foldclosed(prev_line)
      if folded_current ~= (-1 or current_line) then
        prev_line = folded_current - 1
        folded_prev = fn.foldclosed(prev_line)
        if folded_prev == -1 then
          cmd('normal! ' .. folded_current .. 'G')
          cmd('normal! g' .. movement)
        else
          cmd('normal! ' .. folded_current .. 'G')
          cmd('normal! ' .. folded_prev .. 'G')
        end
      else
        if folded_prev == -1 then
          cmd('normal! g' .. movement)
        else
          cmd('normal! ' .. folded_prev .. 'G')
        end
      end
    else
      cmd('normal! g' .. movement)
    end
  else
    cmd('normal! ' .. movement)
  end
end

return M
