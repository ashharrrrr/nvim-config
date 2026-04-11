function gh(text)
	return "https://github.com/" .. text
end

vim.pack.add({
	gh("sainnhe/gruvbox-material"),
	gh("echasnovski/mini.icons"),
	gh("stevearc/oil.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("mason-org/mason.nvim"),
	gh("stevearc/conform.nvim"),
	gh("echasnovski/mini.nvim"),
	gh("saghen/blink.cmp"),
})

-- Gruvbox
vim.g.gruvbox_material_enable_italic = false
vim.cmd.colorscheme("gruvbox-material")

-- Mini icons
require("mini.icons").setup()

-- Oil
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Lualine
require("lualine").setup()

-- Mason
require("mason").setup()

-- Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "golines", "gofmt" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		markdown = { "prettierd" },
		yaml = { "prettierd" },
	},
})
vim.keymap.set("n", "<S-A-F>", function()
	require("conform").format({ async = true, lsp_format = "falback" })
end, { desc = "[F]ormat buffer" })

-- Mini
-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require("mini.surround").setup()
require("mini.pairs").setup()

-- Blink.cmp
require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
})
