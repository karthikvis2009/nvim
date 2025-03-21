local cp = require('catppuccin')

cp.setup({
    flavour = "mocha",
    transparent_background = true,
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {"bold"},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {bold},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    default_integration = true,
    integrations = {
        cmp = true,
        treesitter = true,
        markdown = true
    }
})

vim.cmd('colorscheme catppuccin')
