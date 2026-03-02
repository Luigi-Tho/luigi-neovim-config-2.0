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
    'igorlfs/nvim-dap-view',
    ---@module 'dap-view'
    ---@type dapview.Config
    config = function()
      require('dap-view').setup {
        auto_toggle = true,
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
  config = function()
    require('cmp').setup {
      enabled = function()
        return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' or require('cmp_dap').is_dap_buffer()
      end,
    }
    require('cmp').setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
      sources = {
        { name = 'dap' },
      },
    })
    require('mason-nvim-dap').setup {
      ensure_installed = { 'codelldb', 'delve', 'node-debug2-adapter' },
    }
    require('dap-vscode-js').setup {
      adapters = { 'pwa-node', 'codelldb' },
    }
    local dap = require 'dap'
    dap.adapters.codelldb = {
      type = 'executable',
      command = 'codelldb', -- or if not in $PATH: "/absolute/path/to/codelldb"

      -- On windows you may have to uncomment this:
      -- detached = false,
    }
    for _, language in ipairs { 'typescript', 'javascript' } do
      require('dap').configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Debug Jest Tests',
          -- trace = true, -- include debugger info
          runtimeExecutable = 'node',
          runtimeArgs = {
            './node_modules/jest/bin/jest.js',
            '--runInBand',
          },
        },
      }
    end
  end,
}
