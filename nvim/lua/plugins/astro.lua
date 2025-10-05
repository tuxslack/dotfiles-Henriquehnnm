-- plugins/astro.lua
return {
	-- Treesitter com suporte a Astro
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "astro", "javascript", "typescript", "html", "css" },
			highlight = { enable = true },
		},
	},

	-- LSP para Astro
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
		local lspconfig = require("lspconfig")

		-- Garantir que o filetype .astro é reconhecido
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = "*.astro",
			callback = function()
			vim.bo.filetype = "astro"
			end,
		})

		-- Config do LSP do Astro
		lspconfig.astro.setup({})
		end,
	},

	-- Plugin extra (syntax/indent) opcional, mas ajuda bastante
	{
		"wuelnerdotexe/vim-astro",
		ft = "astro",
	},
}
