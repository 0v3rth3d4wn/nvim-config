return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
    "thenbe/neotest-playwright"
  },
  config = function()
    vim.keymap.set("n", '<space>tt', function()
      require("neotest").output_panel.clear()
      require("neotest").output_panel.open()
      -- vim.api.nvim_win_set_height(0, 15)
      require("neotest").run.run()
    end, { desc = "Run the nearest test" })

    vim.keymap.set("n", '<space>tf', function()
      require("neotest").output_panel.clear()
      require("neotest").output_panel.open()
      require("neotest").run.run(vim.fn.expand("%"))
    end, { desc = "Run the current file" })

    vim.keymap.set("n", '<space>to', function()
      require("neotest").output_panel.toggle()
    end, { desc = "Toggle the output panel" })

    vim.keymap.set("n", '<space>ts', function()
      require("neotest").summary.toggle()
    end, { desc = "Toggle the summary window" })

    vim.keymap.set("n", '<space>tc', function()
      require("neotest").output_panel.clear()
    end, { desc = "Clears the output panel" })

    require('neotest').setup({
      adapters = {
        -- require("plenary"),
        require('neotest-jest')({
          jestCommand = "npm test -- --colors",
          jestConfigFile = "jest.config.js",
          -- env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        -- require('neotest-playwright').adapter({
        --   options = {
        --     persist_project_selection = true,
        --     enable_dynamic_test_discovery = true,
        --   },
        -- }),
      }
    })
  end
}
