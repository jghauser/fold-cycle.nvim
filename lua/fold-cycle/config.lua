--
-- FOLD CYCLE | CONFIG
--

-- default configulation values
local default_config = {
  open_if_max_closed = true,
  close_if_max_opened = true,
}

local M = vim.deepcopy(default_config)

-- configuration update function
M.update = function(opts)
  local newconf = vim.tbl_deep_extend("force", default_config, opts or {})
  for k, v in pairs(newconf) do
    M[k] = v
  end
end

return M
