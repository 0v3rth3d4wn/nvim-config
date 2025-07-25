return {
  'dense-analysis/ale',
  config = function()
    -- Configuration goes here.
    local g = vim.g
    g.ale_fix_on_save = 1
    g.ale_ruby_rubocop_auto_correct_all = 1

    g.ale_linters = {
      ruby = { 'rubocop', 'ruby' },
      lua = { 'lua_language_server' },
      javascript = {},
      typescript = {},
    }

    g.ale_fixers = {
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' }
    }
  end
}
