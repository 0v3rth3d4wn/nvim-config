return {
  {
    "williamboman/mason.nvim",
    version = "1.11.0",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.32.0",
    config = function()
      require("mason-lspconfig").setup({
        -- A list of servers you want Mason to automatically install.
        -- The name must be an exact match with the Mason package name.
        ensure_installed = { "eslint", "ts_ls" },
        --[[ exclude = {
          "ts_ls"
        } ]]
      })
    end,
  },
}
