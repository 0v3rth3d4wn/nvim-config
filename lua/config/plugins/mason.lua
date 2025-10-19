return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = {
					"stylua",
					"prettierd",
					"tailwindcss-language-server",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- A list of servers you want Mason to automatically install.
				-- The name must be an exact match with the Mason package name.
				ensure_installed = { "eslint", "vtsls" },
				--[[ exclude = {
          "ts_ls"
        } ]]
			})
		end,
	},
}
