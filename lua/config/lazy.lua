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
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.number = true
vim.opt.relativenumber = true


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      'maxmx03/fluoromachine.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        local fm = require 'fluoromachine'

        fm.setup {
          glow = false,
          brightness = 0,
          theme = 'fluoromachine',
          transparent = true,
        }

        vim.cmd.colorscheme 'fluoromachine'
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
  install = { colorscheme = { "fluoromachine" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})
