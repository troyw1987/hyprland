return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				sources = {
					explorer = {
						hidden = true, -- show dotfiles in the explorer sidebar
						ignored = false, -- set true to also show git-ignored files (e.g. node_modules)
					},
					files = {
						hidden = true, -- show dotfiles in fuzzy file picker (<leader>ff)
					},
					grep = {
						hidden = true, -- include dotfiles in live grep (<leader>sg)
					},
				},
			},
		},
	},
}
