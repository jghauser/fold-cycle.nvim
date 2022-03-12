# fold-cycle.nvim

This neovim plugin allows you to cycle folds open or closed.

If you find any problems or have suggestions for improvements, do open an issue! :)

This plugin is inspired by and borrows (heavily!) from [vim-fold-cycle](https://github.com/arecarn/vim-fold-cycle).


## Installation

With packer:

```lua
use {
  'jghauser/fold-cycle.nvim',
  config = function()
    require('fold-cycle').setup()
  end
}
```

## Functionality

The following functions expose the functionality of the plugin:

- `require('fold-cycle').open()`: Open the next level of (nested) folds
- `require('fold-cycle').close()`: Close the next level of (nested) folds
- `require('fold-cycle').open_all()`: Open a fold and all its nested folds
- `require('fold-cycle').close_all()`: Close a fold and all its nested folds
- `require('fold-cycle').toggle_all()`: Toggle a fold and its nested folds closed/open

See the next section for how to create keymaps for these functions.

## Configuration

The setup function allows adjusting various settings. By default it sets the following:

```lua
require('fold-cycle').setup({
  open_if_max_closed = true,    -- closing a fully closed fold will open it
  close_if_max_opened = true,   -- opening a fully open fold will close it
  softwrap_movement_fix = true  -- makes movements j/k become gj/gk when softwrap is enabled and then
                                -- fixes this annoying bug that is relevant for the plugin: 
                                -- https://github.com/neovim/neovim/issues/15490
})
```

The plugin doesn't set any keymaps by default. I use the following:

```lua
vim.nvim_set_keymap('n', '<tab>', [[<cmd>lua require('fold-cycle').open()<cr>]], {noremap = true, silent = true})
vim.nvim_set_keymap('n', '<s-tab>', [[<cmd>lua require('fold-cycle').close()<cr>]], {noremap = true, silent = true})
vim.nvim_set_keymap('n', 'zC', [[<cmd>lua require('fold-cycle').close_all()<cr>]], {noremap = false, silent = true})
```
