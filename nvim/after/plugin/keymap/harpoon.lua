local nnoremap = require("zestsystem.keymap").nnoremap

local silent = { silent = true }

-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
--
-- These functions are stored in harpoon.  A plugn that I am developing
nnoremap("<leader><leader>g", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader><leader>f", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<leader><leader>t", function() require("harpoon.cmd-ui").toggle_quick_menu() end, silent)

nnoremap("<C-u>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-i>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-o>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<C-p>", function() require("harpoon.ui").nav_file(4) end, silent)

