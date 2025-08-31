# fold-cycle.nvim

This neovim plugin allows you to cycle folds open or closed.

[![asciicast](https://asciinema.org/a/476184.svg)](https://asciinema.org/a/476184)

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
})
```

The plugin doesn't set any keymaps by default. I use the following:

```lua
vim.keymap.set('n', '<tab>',
  function() return require('fold-cycle').open() end,
  {silent = true, desc = 'Fold-cycle: open folds'})
vim.keymap.set('n', '<s-tab>',
  function() return require('fold-cycle').close() end,
  {silent = true, desc = 'Fold-cycle: close folds'})
vim.keymap.set('n', 'zC',
  function() return require('fold-cycle').close_all() end,
  {remap = true, silent = true, desc = 'Fold-cycle: close all folds'})
```
