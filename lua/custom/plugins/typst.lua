---@module 'lazy'
---@type LazySpec
return {
  {
    'arne314/typstar',
    dependencies = {
      'L3MON4D3/LuaSnip',
    },
    ft = { 'typst' },
    keys = {
      {
        '<M-t>',
        '<Cmd>TypstarToggleSnippets<CR>',
        mode = { 'n', 'i' },
      },
      {
        '<M-j>',
        '<Cmd>TypstarSmartJump<CR>',
        mode = { 's', 'i' },
      },
      {
        '<M-k>',
        '<Cmd>TypstarSmartJumpBack<CR>',
        mode = { 's', 'i' },
      },
      { '<leader>cn', '<Cmd>TypstarOpenRnote<CR>', ft = 'typst', desc = '[C]ode [N]ote open' },
      { '<leader>cN', '<Cmd>TypstarInsertRnote<CR>', ft = 'typst', desc = '[C]ode [N]ote insert' },
    },
    config = function()
      require('typstar').setup {
        add_undo_breakpoints = true,
        rnote = {
          uriOpenCommand = 'flatpak run com.github.flxzt.rnote',
        },
      }
    end,
  },
  {
    'chomosuke/typst-preview.nvim',
    ft = { 'typst' },
    build = function() require('typst-preview').update() end,
    keys = {
      { '<leader>cp', '<Cmd>TypstPreview<CR>', ft = 'typst', desc = '[C]ode [P]review' },
      { '<leader>cs', '<Cmd>TypstPreviewStop<CR>', ft = 'typst', desc = '[C]ode Preview [S]top' },
    },
    opts = {},
  },
  {
    'HakonHarnes/img-clip.nvim',
    ft = { 'typst', 'markdown' },
    keys = {
      { '<leader>ci', '<Cmd>PasteImage<CR>', desc = '[C]ode [I]mage paste' },
    },
    opts = {
      default = {
        dir_path = 'Zothers/Images',
        prompt_for_file_name = false,
        use_cursor_in_template = false,
      },
      filetypes = {
        typst = {
          template = '#figure(image("$FILE_PATH"))',
        },
      },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip').config.setup {
        enable_autosnippets = true,
        store_selection_keys = '<Tab>',
      }
    end,
  },
}
