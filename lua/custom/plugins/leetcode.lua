return {
  -- 'kawre/leetcode.nvim',
  -- build = ':TSUpdate html',
  -- dependencies = {
  --   'nvim-telescope/telescope.nvim',
  --   'nvim-lua/plenary.nvim', -- required by telescope
  --   'MunifTanjim/nui.nvim',
  --
  --   -- optional
  --   'nvim-treesitter/nvim-treesitter',
  --   'rcarriga/nvim-notify',
  --   'nvim-tree/nvim-web-devicons',
  -- },
  -- opts = {
  --   -- configuration goes here
  -- },
  'ianding1/leetcode.vim',
  config = function()
    vim.cmd "let g:leetcode_browser='firefox'"
  end,
}
