vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

require("config.lazy")
-- vim.notify = require("notify")

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- <D-k> is basically the super key
vim.keymap.set('n', '<D-k>', function() vim.diagnostic.open_float() end)
-- enable 24-bit colour
--vim.opt.termguicolors = true
