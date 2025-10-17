return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' }
  },
  config = function()
    require('telescope').setup {
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden', -- include hidden files
          '--glob', '!.git/*' -- but ignore .git folder
        },
      },
      pickers = {
        grep_string = {
          theme = "ivy",
        },
        find_files = {
          theme = "ivy",
          find_command = {
            'fd',
            '--type', 'f',
            '--hidden',
            '--exclude', '.git' -- respect .gitignore, exclude .git folder
          },
        },
        live_grep = {
          theme = "ivy",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- fuzzy matching
          override_generic_sorter = true, -- faster sorting
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {

          }
        }
      }
    }
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('ui-select')

    vim.keymap.set("n", "<space>ff", require("telescope.builtin").find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set("n", "<space>fw", require("telescope.builtin").live_grep, { desc = '[W]ord' })
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
