-- Telescope for openfoam

local tb = require('telescope.builtin')
vim.keymap.set('n', '<Space>ee', function()
    require('telescope.builtin').live_grep{
        cwd = vim.fn.getenv("FOAM_TUTORIALS"),
        }
    end,
    {noremap = true, silent = true})

vim.keymap.set('n', '<Space>ef', function()
    tb.find_files{
        cwd = vim.fn.getenv("FOAM_TUTORIALS"),
        }
    end,
    {noremap = true, silent = true})
