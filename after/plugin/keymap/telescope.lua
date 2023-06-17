local Remap = require("angel.keymap")
local nnoremap = Remap.nnoremap

require('telescope').load_extension('media_files')

nnoremap("<C-p>", ":Telescope")

nnoremap("<leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>fg", function()
    require('telescope.builtin').live_grep()
end)

nnoremap("<leader>fm", function()
    require('telescope').extensions.media_files.media_files()
end)
