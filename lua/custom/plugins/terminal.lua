---@module 'lazy'
---@type LazySpec
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { '<C-/>', '<Cmd>ToggleTerm<CR>', mode = { 'n', 't' }, desc = 'Toggle terminal' },
    },
    opts = {
      direction = 'horizontal',
      size = 15,
    },
  },
}
