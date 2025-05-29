-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- enable 24-bit colour
vim.opt.termguicolors = true

vim.g.maplocalleader = " "
vim.g.mapleader = " "

require("config.lazy")
-- vim.notify = require("notify")

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- <D-k> is basically the super key
-- vim.keymap.set('n', 'L', function() vim.diagnostic.open_float() end)
vim.keymap.set({ "n", "v" }, "<C-w><C-g>", function() require("nvim-tree.api").tree.toggle() end)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- vim.keymap.set('n', "<space>x", ":.lua<CR>")
-- vim.keymap.set('v', "<space>x", ":lua<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-b><C-b>", "<cmd>lua MiniFiles.open()<CR>")
