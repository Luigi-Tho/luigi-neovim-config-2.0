return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   'BufReadPre /Users/luigi_tho/Documents/School Vault Synced',
  --   'BufNewFile /Users/luigi_tho/Documents/School Vault Synced/*.md',
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'personal',
          path = "/Users/luigi_tho/Library/Mobile Documents/iCloud~md~obsidian/Documents/Raena's Vault",
        },
        {
          name = 'school',
          path = '/Users/luigi_tho/Documents/School Vault Synced',
        },
      },
      ui = { enable = false },
    }
  end,
}
