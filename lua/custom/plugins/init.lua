-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- [[Custom Keymaps]]
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
  vim.keymap.set('n', '<leader>sm', '<CMD>Telescope make<CR>', { desc = '[S]earch [M]akefile Targets' }),
  -- todo comments
  vim.keymap.set('n', ']t', function()
    require('todo-comments').jump_next()
  end, { desc = 'Next todo comment' }),

  vim.keymap.set('n', '[t', function()
    require('todo-comments').jump_prev()
  end, { desc = 'Previous todo comment' }),

  vim.keymap.set('n', '<leader>so', '<CMD>ObsidianOpen<CR>', { desc = '[S]earch [O]bsidian Vault' }),

  vim.keymap.set('n', '<leader>tt', '<CMD>Twilight<CR>', { desc = '[t][t]wilight' }),
}
