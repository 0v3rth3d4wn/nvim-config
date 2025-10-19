-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- enable 24-bit colour
vim.opt.termguicolors = true
vim.o.undofile = true
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.breakindent = true
vim.o.updatetime = 250
vim.o.updatecount = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"
vim.o.cursorline = false
vim.o.wrap = true
vim.opt.wrap = true
vim.o.winborder = "single"

vim.g.maplocalleader = " "
vim.g.mapleader = " "
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

require("config.lazy")
-- vim.notify = require("notify")

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#9ece6a", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#e0af68", bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#db4b4b", bg = "NONE" })
-- <D-k> is basically the super key
-- vim.keymap.set('n', 'L', function() vim.diagnostic.open_float() end)
vim.keymap.set({ "n", "v" }, "<C-w><C-g>", function()
	require("nvim-tree.api").tree.toggle()
end)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- vim.keymap.set('n', "<space>x", ":.lua<CR>")
-- vim.keymap.set('v', "<space>x", ":lua<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
-- vim.keymap.set("n", "<C-b><C-b>", "<cmd>lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<C-b><C-b>", function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
	MiniFiles.open(path)
	MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<space>d", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<space>dd", "<cmd>DiffviewClose<CR>")
