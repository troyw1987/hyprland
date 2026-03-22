return {
	-- 1. Catppuccin Default
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- options: latte, frappe, macchiato, mocha
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},

	-- 2. Rosé Pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
			})
			-- Removed vim.cmd from here so it doesn't override Catppuccin
		end,
	},

	-- 3. Kanagawa
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup()
		end,
	},

	-- 4. Nightfox
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup()
		end,
	},

	-- 5. Vague
	{
		"vague-theme/vague.nvim",
		priority = 1000,
		config = function()
			require("vague").setup()
		end,
	},
}
