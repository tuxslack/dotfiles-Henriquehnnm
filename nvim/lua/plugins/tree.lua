return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = false,
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = {
							".git",
							"node_modules",
							".cache",
						},
					},
				},
				window = {
					position = "left",
					width = 30,
				},
				default_component_configs = {
					border = {
						style = "none",
					},
				},
			})

			local map = vim.keymap.set
			map("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
		end,
	},
}
