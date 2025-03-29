-- Syntax
vim.cmd('syntax on')

-- Filetype
vim.cmd('filetype on')
vim.cmd('filetype plugin on')

-- Misc
vim.opt.autoindent = true
vim.opt.splitright = true
vim.opt.compatible = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu','menuone','noselect'}
vim.opt.ttyfast = true
vim.opt.swapfile = false

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI config
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Spell checking
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"tex","md"},
    callback = function()
        vim.opt.spell = true
        vim.opt.spelllang = en_us
    end,
})

-- Folding
if vim.bo.filetype == "cpp" or vim.bo.filetype == "hpp" then
    vim.cmd('set foldmethod=syntax')
    vim.cmd('set nofoldenable')
elseif vim.bo.filetype == "python" then
    vim.cmd('set foldmethod=indent')
    vim.cmd('set nofoldenable')
end


-- LSP Diagnostics
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
        severity = vim.diagnostic.severity.ERROR,
        },
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR,
        wrap = true
    }
})
