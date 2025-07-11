return {
  -- 'vim-pandoc/vim-pandoc',
  -- 'vim-pandoc/vim-pandoc-syntax',
  'aspeddro/pandoc.nvim',
  config = function()
    require('pandoc').setup()
  end,
}
