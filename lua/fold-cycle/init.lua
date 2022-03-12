--
-- FOLD CYCLE | INIT
--

local config = require("fold-cycle.config")
local fold_cycle = require("fold-cycle.fold-cycle")
local utils = require("fold-cycle.utils")
local nvim_set_keymap = vim.api.nvim_set_keymap

local M = {}

-- set config
M.setup = function(opts)
  config.update(opts)

  -- add fix for softwrap movement over folds
  if config['softwrap_movement_fix'] == true then
    M['softwrap_movement_fix'] = utils.softwrap_movement_fix

    nvim_set_keymap('', 'j',
      "<Cmd>lua require('fold-cycle').softwrap_movement_fix('j')<cr>",
      {silent = true, noremap = true})
    nvim_set_keymap('', 'k',
      "<Cmd>lua require('fold-cycle').softwrap_movement_fix('k')<cr>",
      {silent = true, noremap = true})
  end
end

-- get all functions that we need to run the various commands
for name, command in pairs(fold_cycle) do
  M[name] = command
end

return M
