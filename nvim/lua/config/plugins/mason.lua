return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
