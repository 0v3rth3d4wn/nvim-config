return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup {
        use_icons = true
      }
      require('mini.icons').setup()
      require('mini.trailspace').setup()
      require('mini.completion').setup {
        window = {
          info = {
            height = 50,
            width = 300,
            border = nil
          },
          signature = {
            height = 50,
            width = 300,
            border = nil
          }
        }
      }
      require('mini.snippets').setup()
      require('mini.keymap').setup()
      require('mini.move').setup()
      require('mini.pairs').setup()
      require('mini.splitjoin').setup()
      require('mini.surround').setup()
      require('mini.notify').setup()
      --require('mini.cursorword').setup()
      --require('mini.operators').setup()
    end
  }
}
