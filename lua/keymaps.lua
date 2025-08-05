-- Define options
local opts = {
        noremap = true,
        silent = true
}

-- Folding
vim.keymap.set('n', '<Space><Space>', 'za', opts)

-- Window management
vim.keymap.set('n', '<S-Left>', '<c-w>H', opts)
vim.keymap.set('n', '<S-Right>', '<c-w>L', opts)
vim.keymap.set('n', '<S-Down>', '<c-w>J', opts)
vim.keymap.set('n', '<S-Up>', '<c-w>K', opts)

-- Buffers
vim.keymap.set('n', '<C-Down>', ':bn<CR>', opts)
vim.keymap.set('n', '<C-Up>', ':bp<CR>', opts)
vim.keymap.set('n', '<C-d>', ':bd<CR>', opts)

-- NerdTree
-- vim.keymap.set('n', '<C-f>', ':NERDTreeFocus<CR>', opts)
-- vim.keymap.set('n', '<C-n>', ':NERDTree<CR>', opts)
-- vim.keymap.set('n', '<C-0>', ':NERDTree ~<CR>', opts)
-- vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', opts)
-- Neotree
vim.keymap.set('n', '<C-t>', ':Neotree toggle<CR>', opts)

-- Vimtex
vim.keymap.set('n', 'tt', ':VimtexCompile<CR>', opts)

-- Telescope
vim.keymap.set('n', '<Space>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<Space>ll', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<Space>bb', ':Telescope buffers<CR>', opts)

-- Parenthesis
vim.keymap.set('i', '(', '()<esc>i', opts)
vim.keymap.set('i', '[', '[]<esc>i', opts)
vim.keymap.set('i', '[', '[]<esc>i', opts)
vim.keymap.set('i', '\'', '\'\'<esc>i', opts)
vim.keymap.set('i', '\"', '\"\"<esc>i', opts)


-- Function to set key mappings based on filetype
local function set_keymap()
    if vim.bo.filetype == "cpp" or vim.bo.filetype == "hpp" then
        vim.keymap.set('i', '{', '{<esc>o<CR>}<esc>%<CR>a', { buffer = true, noremap = true, silent = true })
        vim.keymap.set('n', '<space><CR>', ':!g++ % -o run && ./run <CR>', {buffer = true, noremap = true, silent = true})

    elseif vim.bo.filetype == "py" then
        vim.keymap.set('i', '{', '{}<esc>i', { buffer = true, noremap = true, silent = true})
        vim.keymap.set('n', '<space><CR>', ':!python3 %<CR>', {buffer = true, noremap = true, silent = true})

    else
        vim.keymap.set('i', '{', '{}<esc>i', { buffer = true, noremap = true, silent = true})
    end
end


-- Create an autocommand to set the key mappings when a buffer is entered
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = set_keymap
})

-- Map to quicksave
vim.keymap.set('i', ';;', '<esc>:w<CR>', opts)
vim.keymap.set('v', ';;', '<esc>:w<CR>', opts)
vim.keymap.set('n', ';;', ':w<CR>', opts)

-- Map to close
vim.keymap.set('n', '<C-w>w', '<esc>:wq<CR>', opts)
vim.keymap.set('v', '<C-w>w', '<esc>:wq<CR>', opts)
vim.keymap.set('i', '<C-w>w', '<esc>:wq<CR>', opts)

-- Obsidian keymaps
vim.keymap.set('n', ';q', '<esc>:ObsidianSearch<CR>', opts)
vim.keymap.set('n', ';t', '<esc>:ObsidianTags<CR>', opts)
vim.keymap.set('n', ';b', '<esc>:ObsidianBacklinks<CR>', opts)
vim.keymap.set('n', ';d', '<esc>:ObsidianDailies<CR>', opts)
vim.keymap.set('n', ';e', '<esc>:ObsidianNew<CR>', opts)

-- LSP error mappings
vim.keymap.set('n', '<C-Left>', ':lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR, wrap = true})<CR><CR>')
vim.keymap.set('n', '<C-Right>', ':lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR, wrap = true})<CR><CR>')

-- Neogit
vim.keymap.set('n', '<space>gg', ':lua require("neogit").open({ kind = "vsplit"})<CR>')

-- Disable clangd
vim.keymap.set('n', ',,', '<esc>:LspStop clangd<CR>', opts)



