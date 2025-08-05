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


vim.opt.conceallevel = 2

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
            -- [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
            severity = vim.diagnostic.severity.ERROR
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

-- Neovim different default font size

if vim.env.TERM == "xterm-kitty" then
    vim.opt.guifont = "JetBrains Mono NF:12"
end


vim.defer_fn(function()
    vim.api.nvim_set_hl(0, 'RenderMarkdownH1', { fg = '#08EF63', bg = '#1A1A1A', bold = true })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { fg = '#B50862', bg = '#2E2E2E', bold = true })

    vim.api.nvim_set_hl(0, 'RenderMarkdownH2', { fg = '#08EF63', bg = '#1A1A1A', bold = true })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { fg = '#08B562', bg = '#2E2E2E', bold = true })

    vim.api.nvim_set_hl(0, 'RenderMarkdownH3', { fg = '#08EF63', bg = '#1A1A1A', bold = true })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { fg = '#0862B5', bg = '#2E2E2E', bold = true })

    vim.api.nvim_set_hl(0, 'RenderMarkdownH4', { fg = '#08EF63', bg = '#1A1A1A', bold = true })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { fg = '#B56208', bg = '#2E2E2E', bold = true })

    vim.api.nvim_set_hl(0, 'RenderMarkdownH5', { fg = '#08EF63', bg = '#1A1A1A', bold = true })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { fg = '#62B508', bg = '#2E2E2E', bold = true })

    vim.api.nvim_set_hl(0, 'RenderMarkdownH6', { fg = '#08EF63', bg = '#1A1A1A', bold = true })
    vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { fg = '#6208B5', bg = '#2E2E2E', bold = true })

--     vim.api.nvim_set_hl(0, 'RenderMarkdownH2', { fg = '#F1FA8C', bg = 'NONE', bold = true })
--     vim.api.nvim_set_hl(0, 'RenderMarkdownH3', { fg = '#8BE9FD', bg = 'NONE' })
--     vim.api.nvim_set_hl(0, 'RenderMarkdownH4', { fg = '#50FA7B', bg = 'NONE' })
--     vim.api.nvim_set_hl(0, 'RenderMarkdownH5', { fg = '#BD93F9', bg = 'NONE' })
--     vim.api.nvim_set_hl(0, 'RenderMarkdownH6', { fg = '#FF79C6', bg = 'NONE' })
--     -- Add more as needed
end, 100)
