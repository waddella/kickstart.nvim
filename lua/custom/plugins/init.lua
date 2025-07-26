-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require('iron.core')
      local view = require('iron.view')
      local common = require('iron.fts.common')
      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = { command = { 'zsh' } },
            python = {
              command = { 'ipython' },
              format = common.bracketed_paste_python,
              block_dividers = { '# %%', '#%%' },
            },
            r = {
              command = { 'R' },
            }
          },
          repl_open_cmd = view.bottom(40),
        },
        keymaps = {
          toggle_repl = '<space>ir',
          restart_repl = '<space>iR',
          send_motion = '<space>ic',
          visual_send = '<space>ic',
          send_file = '<space>if',
          send_line = '<space>il',
          send_paragraph = '<space>ip',
          send_until_cursor = '<space>iu',
          send_mark = '<space>im',
          send_code_block = '<space>ib',
          send_code_block_and_move = '<space>in',
          mark_motion = '<space>iM',
          mark_visual = '<space>iM',
          remove_mark = '<space>id',
          cr = '<space>i<cr>',
          interrupt = '<space>i<space>',
          exit = '<space>iq',
          clear = '<space>iC',
        },
        highlight = { italic = true },
        ignore_blank_lines = true,
      }
      vim.keymap.set('n', '<space>iF', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<space>ih', '<cmd>IronHide<cr>')
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)
      
      -- Keybindings for CopilotChat
      -- vim.keymap.set('n', '<leader>cc', ':CopilotChat<CR>', { desc = 'Open Copilot Chat' })
      -- vim.keymap.set('v', '<leader>cc', ':CopilotChatExplain<CR>', { desc = 'Explain selected code' })
      -- vim.keymap.set('n', '<leader>cf', ':CopilotChatFix<CR>', { desc = 'Fix code issues' })
      -- vim.keymap.set('n', '<leader>ct', ':CopilotChatTests<CR>', { desc = 'Generate tests' })
      -- vim.keymap.set('n', '<leader>cr', ':CopilotChatReview<CR>', { desc = 'Review code' })
      -- vim.keymap.set('n', '<leader>cx', ':CopilotChatReset<CR>', { desc = 'Reset Chat' })
      -- vim.keymap.set('v', '<leader>cp', ':CopilotChatPrompts<CR>', { desc = 'Open Propmts' })
      -- vim.keymap.set('n', '<leader>cd', ':CopilotChatDocs<CR>', { desc = 'Generate docs' })
    end,
  },
}
