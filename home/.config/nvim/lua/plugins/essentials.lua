return {

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
		end,
	},

	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = { "rafamadriz/friendly-snippets" },
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			-- Show the menu immediately (0ms delay)
			menu = { draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } } } },
			list = { selection = { preselect = true, auto_insert = true } },

			-- This makes the popup appear much faster
			trigger = {
				prefetch_on_insert = true, -- Pre-warm the cache
				show_on_keyword = true,
				show_on_trigger_character = true,
			},

			-- Lowering the delay from default 100ms to 50ms or 0ms
			-- 0ms can be a bit jittery, 30-50ms is usually the "sweet spot"
			ghost_text = { enabled = true },
		},
		sources = {
			min_keyword_length = 1,
			default = { "lsp", "path", "snippets", "buffer" },
			-- Lower the score of 'buffer' so it doesn't slow down LSP results
			providers = {
				buffer = { score_offset = -3 },
			},
		},
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "buffers",
				separator_style = "slant",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- NEW API: You now call 'setup' directly on the main module
			require("nvim-treesitter").setup({
				ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
				highlight = {
					enable = true,
					-- Optional: disable slow treesitter highlight for large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				indent = { enable = true },
			})
		end,
	},

	{ "akinsho/toggleterm.nvim", version = "*", opts = { open_mapping = [[<c-\>]], size = 20 } },
}
