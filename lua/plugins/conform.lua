return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "golines", "gofmt" },
			},
  },
  keys = {
      {
        '<S-A-F>',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
  }

}
