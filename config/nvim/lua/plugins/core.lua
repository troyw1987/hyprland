-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore

return {
  {
    "LazyVim/LazyVim",
    opts = {colorscheme = "catppuccin"},
    plugins = {

		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
    }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {"snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
┌────────────────────────────────────────────────────────────────────┐
│                                                                    │
│                                                                    │
│   _________  ________  ________      ___    ___ ________           │
│  |\___   ___\\   __  \|\   __  \    |\  \  /  /|\   ____\          │
│  \|___ \  \_\ \  \|\  \ \  \|\  \   \ \  \/  / | \  \___|_         │
│       \ \  \ \ \   _  _\ \  \\\  \   \ \    / / \ \_____  \        │
│        \ \  \ \ \  \\  \\ \  \\\  \   \/  /  /   \|____|\  \       │
│         \ \__\ \ \__\\ _\\ \_______\__/  / /       ____\_\  \      │
│          \|__|  \|__|\|__|\|_______|\___/ /       |\_________\     │
│                                    \|___|/        \|_________|     │
│                                                                    │
│                                                                    │
│   _______   ________  ___  _________  ________  ________           │
│  |\  ___ \ |\   ___ \|\  \|\___   ___\\   __  \|\   __  \          │
│  \ \   __/|\ \  \_|\ \ \  \|___ \  \_\ \  \|\  \ \  \|\  \         │
│   \ \  \_|/_\ \  \ \\ \ \  \   \ \  \ \ \  \\\  \ \   _  _\        │
│    \ \  \_|\ \ \  \_\\ \ \  \   \ \  \ \ \  \\\  \ \  \\  \|       │
│     \ \_______\ \_______\ \__\   \ \__\ \ \_______\ \__\\ _\       │
│      \|_______|\|_______|\|__|    \|__|  \|_______|\|__|\|__|      │
│                                                                    │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
},
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {'nvim-treesitter/nvim-treesitter'},
  {'akinsho/toggleterm.nvim', version = "*", opts = {}},
}
