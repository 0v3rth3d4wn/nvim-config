-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.mouse = 'a'
-- vim.o.spell = true
-- vim.o.spelllang = "en_us"


--[[ vim.api.nvim_create_autocmd({ "FocusGained" }, {
  callback = function()
    if vim.fn.executable("im-select") == 1 then
      local input_english = "com.apple.keylayout.ABC"
      os.execute("im-select " .. input_english)
    end
  end
}) ]]
-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- {
    --   "folke/tokyonight.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   opts = {
    --     style = "night",
    --     transparent = false,
    --     styles = {
    --       functions = {},
    --       keywords = { italic = false }
    --     },
    --     on_colors = function(colors)
    --       colors.bg = "#000000"
    --       colors.bg_dark = "#000000"
    --       colors.bg_dark1 = "#000000"
    --       --[[ colors.cyan = "#4cc9f0"
    --       colors.blue = "#4361ee" ]]
    --     end,
    --     on_highlights = function(highlights, colors)
    --       highlights.FlashLabel = { bg = "#f72585", fg = "#000000" }
    --     end
    --
    --   },
    --   config = function(_, opts)
    --     require("tokyonight").setup(opts)
    --     vim.cmd [[colorscheme tokyonight]]
    --   end
    -- },
    --[[ {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
} ]]
    --[[ {
      "EdenEast/nightfox.nvim",
      lazy = false,
      config = function()
        require("nightfox").setup({
          palettes = {
            duskfox = {
              --   green = "#00E78A",
              --   yellow = "#F9C80E",
              --   pink = "#F6019D",
              --   red = "#FD1D53",
              --   magenta = "#791E94",
              --   cyan = "#2DE2E6",
              --   blue = "#006AF9",
              --   orange = "#FF6C11",
              --   black = "#000000",
              --   white = "#FFFFFF",
              -- bg1 = "#540D6E",
            },
            carbonfox = {
              bg1 = "#000000"
              -- black = {
              --   base = "#000000",
              --   bright = "#000000",
              --   dim = "#000000"
              -- },
              -- white = {
              --   base = "#000000",
              --   bright = "#000000",
              --   dim = "#000000"
              -- }
            }
          }
        })
        -- vim.cmd("colorscheme duskfox")
        vim.cmd("colorscheme carbonfox")
      end
    } ]]
    {
      "scottmckendry/cyberdream.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("cyberdream").setup({
          colors = {
            bg = "#000000"
          }
        })
        vim.cmd("colorscheme cyberdream")
      end
    },
    -- import your plugins
    { import = "config.plugins" },
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "scottmckendry/cyberdream.nvim" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})
