require("zestsystem.set")
require("zestsystem.packer")
require("zestsystem.neogit")
require("zestsystem.debugger")
require("zestsystem.lualine")
require("zestsystem.gitsigns")
require("zestsystem.bufferline")
require("zestsystem.ts-autotag")
require("zestsystem.mason")
require("zestsystem.lspsaga")

local augroup = vim.api.nvim_create_augroup
zestsystemGroup = augroup('zestsystem', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = zestsystemGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = zestsystemGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

