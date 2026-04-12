function gh(text)
	return "https://github.com/" .. text
end

vim.pack.add({
	gh("nvim-lua/plenary.nvim"),
	gh("sainnhe/gruvbox-material"),
	gh("echasnovski/mini.icons"),
	gh("stevearc/oil.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("mason-org/mason.nvim"),
	gh("stevearc/conform.nvim"),
	gh("echasnovski/mini.nvim"),
	gh("saghen/blink.cmp"),
	{ src = gh("ThePrimeagen/harpoon"), version = "harpoon2" },
  gh("nvim-telescope/telescope.nvim")

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

-- Harpoon
require("harpoon").setup()

vim.keymap.set("n", "<leader>a", function()
	require("harpoon"):list():add()
end, { desc = "Harpoon Add" })

vim.keymap.set("n", "<leader>e", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon List" })

vim.keymap.set("n", "<A-1>", function()
	require("harpoon"):list():select(1)
end)

vim.keymap.set("n", "<A-2>", function()
	require("harpoon"):list():select(2)
end)

vim.keymap.set("n", "<A-3>", function()
	require("harpoon"):list():select(3)
end)

vim.keymap.set("n", "<A-4>", function()
	require("harpoon"):list():select(4)
end)

-- Telescope

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
