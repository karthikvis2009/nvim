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


-- LSP
vim.wo.signcolumn = 'yes'
--vim.diagnostic.set(0, {severity = vim.diag
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      severity = vim.diagnostic.severity.ERROR,
      wrap = true
    },
    underline = {
      severity = vim.diagnostic.severity.ERROR
    },
    signs = {
      severity = vim.diagnostic.severity.ERROR
    }
    -- signs = {
    -- numhl = {
    --         [vim.diagnostic.severity.ERROR] = 'ErrorMsg'
    --      }
    -- }
  }
)
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.g.lsp_signs_enable = 1
vim.g.lsp_inlay_hints_enabled = 1
