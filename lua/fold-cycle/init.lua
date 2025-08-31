--
-- FOLD CYCLE | INIT
--

local config = require("fold-cycle.config")
local fold_cycle = require("fold-cycle.fold-cycle")

local M = {}

-- set config
M.setup = function(opts)
  config.update(opts)
end

-- get all functions that we need to run the various commands
for name, command in pairs(fold_cycle) do
  M[name] = command
end

return M
