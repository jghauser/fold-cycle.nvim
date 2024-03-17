--
-- FOLD CYCLE | INIT
--

local config = require("fold-cycle.config")
local fold_cycle = require("fold-cycle.fold-cycle")
local utils = require("fold-cycle.utils")
local keymap = vim.keymap

local M = {}

-- set config
M.setup = function(opts)
  config.update(opts)

  -- add fix for softwrap movement over folds
  if config["softwrap_movement_fix"] == true then
    M["softwrap_movement_fix"] = utils.softwrap_movement_fix

    keymap.set({ "n", "v" }, "j", function()
      return vim.v.count == 0 and [[<cmd>lua require('fold-cycle').softwrap_movement_fix('j')<cr>]] or "j"
    end, { silent = true, noremap = true, expr = true })
    keymap.set({ "n", "v" }, "k", function()
      return vim.v.count == 0 and [[<cmd>lua require('fold-cycle').softwrap_movement_fix('k')<cr>]] or "k"
    end, { silent = true, noremap = true, expr = true })
  end
end

-- get all functions that we need to run the various commands
for name, command in pairs(fold_cycle) do
  M[name] = command
end

return M
