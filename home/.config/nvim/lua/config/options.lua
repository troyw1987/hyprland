-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- I prefer 4 spaced tabs, sue me
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- prevents furthering of comments
opt.formatoptions:remove({ "c", "r", "o" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

vim.g.lazyvim_lsp_inlay_hints = true
