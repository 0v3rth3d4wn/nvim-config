return {
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = false,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    word_diff = false,
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = 'x' },
      -- topdelete = { text = '‾' },
      -- changedelete = { text = '~' },
    },
    on_attach = function()
      local gitsigns = require('gitsigns')

      vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview the hunk inline.' })
      vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview the hunk in a floating window.' })
      vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk at the current line' })
      vim.keymap.set('n', '<leader>gbl', gitsigns.blame_line, { desc = 'Blame current line' })
      vim.keymap.set('n', '<leader>gbf', gitsigns.blame, { desc = 'Blame current file' })
    end
  },
}
