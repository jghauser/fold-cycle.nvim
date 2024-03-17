vim.o.termguicolors = true
vim.o.swapfile = false
vim.cmd.colorscheme("industry")

-- folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- install required plugins
vim.opt.runtimepath:prepend(vim.fn.getcwd())

-- remap leader
vim.g.mapleader = " "

-- set up fold-cycle
require('fold-cycle').setup()
vim.keymap.set('n', '<tab>',
  function() return require('fold-cycle').open() end,
  { silent = true, desc = 'Fold-cycle: open folds' })
vim.keymap.set('n', '<s-tab>',
  function() return require('fold-cycle').close() end,
  { silent = true, desc = 'Fold-cycle: close folds' })
vim.keymap.set('n', 'zC',
  function() return require('fold-cycle').close_all() end,
  { remap = true, silent = true, desc = 'Fold-cycle: close all folds' })
