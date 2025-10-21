return {
  'https://codeberg.org/esensar/nvim-dev-container',
  config = function()
    require('devcontainer').setup {
      autocommands = {
        init = true,
        clean = true,
        update = true,
      },
    }
  end,
}
