return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
  config = function()
    require('telescope').setup {
      pickers = {
        grep_string = {
          theme = "ivy",
        },
        find_files = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy"
        }
      },
      extensions = {
        fzf = {}
      }
    }
    require('telescope').load_extension('fzf')

    vim.keymap.set("n", "<space>ff", require("telescope.builtin").find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set("n", "<space>fw", require("telescope.builtin").live_grep, { desc = '[W]ord' })
    -- vim.keymap.set("n", "<space>fw", function()
    --   require("telescope.builtin").live_grep {
    --     -- cwd = vim.fn.:
    --   }
    -- end)
    vim.keymap.set("n", "<space>fs", require("telescope.builtin").grep_string, { desc = '[S]election' })
    vim.keymap.set("n", "<space>fc", function()
      require("telescope.builtin").find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
    vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = '[H]elp' })
    vim.keymap.set("n", "<space>fk", require("telescope.builtin").keymaps, { desc = '[K]eymaps' })
  end
}
