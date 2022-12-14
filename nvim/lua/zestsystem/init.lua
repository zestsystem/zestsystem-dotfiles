require("zestsystem.set")
require("zestsystem.remap")

local augroup = vim.api.nvim_create_augroup
ZestsystemGroup = augroup("zestsystem", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
	group = ZestsystemGroup,
	pattern = "*.rs",
	callback = function()
		require("lsp_extensions").inlay_hints({})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ZestsystemGroup,
	pattern = "*",
	command = [[%s/\\s\\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
