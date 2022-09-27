vim.g.zestsystem_colorscheme = "gruvbox"

function ColorMyPencils()
	vim.g.gruvbox_contrast_dark = "hard"
	vim.g.gruvbox_invert_selection = "0"
	vim.opt.background = "dark"
	if vim.g.zestsystem_colorscheme == "tokyonight" then
		vim.g.tokyonight_transparent_sidebar = true
		vim.g.tokyonight_transparent = true
	end
	vim.cmd("colorscheme " .. vim.g.zestsystem_colorscheme)

	local hl = function(thing, opts)
		vim.api.nvim_set_hl(0, thing, opts)
	end

	hl("SignColumn", {
		bg = "none",
	})

	hl("ColorColumn", {
		ctermbg = 0,
		bg = "#555555",
	})

	hl("CursorLineNR", {
		bg = "None",
	})

	hl("Normal", {
		bg = "none",
	})
	if vim.g.zestsystem_colorscheme == "tokyonight" then
		hl("LineNr", {
			fg = "#5eacd3",
		})

		hl("netrwDir", {
			fg = "#5eacd3",
		})
	end
end
ColorMyPencils()
