return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    -- Define the formatting group once
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          -- Clear any existing autocmds in the group for this buffer
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          -- Create a new autocmd to format on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                timeout_ms = 2000,
                filter = function(format_client)
                  -- Optionally ensure only null-ls does formatting
                  return format_client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end
}
