return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    word_diff = true,
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = 'x' },
      -- topdelete = { text = '‾' },
      -- changedelete = { text = '~' },
    },
  },
}
