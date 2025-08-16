return {
  'stevearc/overseer.nvim',
  config = function()
    local overseer = require 'overseer'
    overseer.setup {
      templates = { 'builtin' },
    }
    overseer.register_template {
      {
        name = 'make executable',
        builder = function()
          local file = vim.fn.expand '%:p'
          return {
            cmd = { 'make' },
            args = { file },
          }
        end,
        condition = {
          dir = '/home/luigi_tho/school/eecs370/',
        },
      },
    }
  end,
}
