---@module 'lazy'
---@type LazySpec
return {
  {
    'R-nvim/R.nvim',
    ft = { 'r', 'rmd', 'quarto' },
    config = function()
      require('r').setup {
        user_maps_only = true,
        hook = {
          on_filetype = function()
            local opts = function(desc)
              return { buffer = true, desc = desc }
            end

            -- Start / Close
            vim.keymap.set('n', '<leader>cr', '<Cmd>lua require("r.run").start_R("R")<CR>', opts '[C]ode [R] start console')
            vim.keymap.set('n', '<leader>cR', '<Cmd>lua require("r.run").quit_R("nosave")<CR>', opts '[C]ode [R] close console')

            -- Send
            vim.keymap.set('n', '<leader>cl', '<Cmd>lua require("r.send").line("stay")<CR>', opts '[C]ode send [L]ine')
            vim.keymap.set('v', '<leader>cs', '<Cmd>lua require("r.send").selection(false)<CR>', opts '[C]ode [S]end selection')
            vim.keymap.set('n', '<leader>ca', '<Cmd>lua require("r.send").source_file()<CR>', opts '[C]ode send [A]ll')

            -- Object Browser / Help
            vim.keymap.set('n', '<leader>co', '<Cmd>lua require("r.browser").start()<CR>', opts '[C]ode [O]bject browser')
            vim.keymap.set('n', '<leader>ch', '<Cmd>lua require("r.run").action("help")<CR>', opts '[C]ode [H]elp')
          end,
        },
      }

      -- Set up R language server (not managed by Mason)
      vim.lsp.config('r_language_server', {
        cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
        filetypes = { 'r', 'rmd' },
        root_markers = { '.Rproj', 'DESCRIPTION', '.git' },
      })
      vim.lsp.enable('r_language_server')
    end,
  },
}
