local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            -- For OpenFOAM
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-textsubjects',
            'romgrk/nvim-treesitter-context',
        },
        init = function()
            require("config.tsConf")
    end,
    },

    -- LSP
    {
        "onsails/lspkind.nvim",
    },

    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        init = function()
            require("config.snippets")
        end,
    },

    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer", -- buffer auto-completion
            "hrsh7th/cmp-path", -- path auto-completion
            "hrsh7th/cmp-cmdline", -- cmdline auto-completion
            "saadparwaiz1/cmp_luasnip", -- luasnip cmp
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },

    -- LSP manager
    {
    "williamboman/mason.nvim",
    dependencies = {"williamboman/mason-lspconfig.nvim",},
    config = function()
        require("config.lsp")
    end,
    },
    "neovim/nvim-lspconfig",

    --LSP saga

    {
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        },
    },

    -- Lualine
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function ()
        require("config.lualine")
    end
    },

    -- Neo-tree
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
      init = function ()
          require("config.neotree")
      end
      }
    },

    {
        "lervag/vimtex",
        lazy = false,  -- we don't want to lazy load VimTeX
        init = function()
            vim.g.vimtex_view_method = "zathura"  -- Set the PDF viewer
            vim.g.vimtex_compiler_method = "latexmk"  -- Set latexmk as the compiler
            vim.g.vimtex_compiler_latexmk = {
                backend = 'nvim',
                build_dir = '',
                callback = 1,
                continuous = 1,
                executable = 'latexmk',
                options = {
                    '-pdf',
                    '-pdflatex=xelatex',
                    '-shell-escape',
                    '-verbose',
                    '-file-line-error',
                    '-synctex=1',
                    '-interaction=nonstopmode',
                },
            }
        end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                              , branch = '0.1.x',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-lua/plenary.nvim',
            'sharkdp/fd', 
            'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'},
        init = function ()
            require("config.telescopeConfig")
        end
    },

    -- Commentary
    "tpope/vim-commentary",

    -- Themes 
    -- moonfly
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000,
        init = function()
        -- vim.cmd('colorscheme moonfly')
        end
    },
    --catppuccin (Very similar to moonfly but supports more colors)
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
        init = function()
            require("config.catppuccin")
        end
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- Markdown
    {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        "https://github.com/tree-sitter-grammars/tree-sitter-markdown",
        "https://github.com/latex-lsp/tree-sitter-latex"
    },
    config = function()
        require('config.markdown')
    end,
    },
    
    -- Git
    {
        "NeogitOrg/neogit",

        dependencies = {
            "sindrets/diffview.nvim",
        },

        init = function()
            require("config.neogitconfig")
        end,
    }

})

