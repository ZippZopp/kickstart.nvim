---@module 'lazy'
---@type LazySpec
return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<leader>gg', '<Cmd>Neogit<CR>', desc = 'Neo[g]it' },
    },
    opts = {},
  },
}
