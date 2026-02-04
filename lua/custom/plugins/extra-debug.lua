return {
  {
    'microsoft/vscode-js-debug',
    opt = true,
    run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
  },
  {
    'mxsdev/nvim-dap-vscode-js',
    dependencies = { 'mfussenegger/nvim-dap' },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test',
          },
        },
      }
    end,
  },
  {
    'David-Kunz/jester',
    config = function()
      require('dap-vscode-js').setup {
        debugger_path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug',
        adapters = { 'pwa-node' },
      }
      require('jester').setup {
        dap = {
          type = 'pwa-node',
          console = 'integratedTerminal',
        },
      }
      require('dap').adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '3000',
        executable = {
          command = 'node',
          args = { vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '3000' },
        },
      }
    end,
  },
}
