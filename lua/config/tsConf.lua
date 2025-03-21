local ts_config = require('nvim-treesitter.configs')
ts_config.setup({
    highlight = {enable = true},
  	textobjects = {
  	  	select = {
  	  	  	enable = true,
  	  	  	lookahead = true,
			-- iF and aF families for selecting text objects
  	  	  	keymaps = {
  	  	  		-- v keymaps are for key-values
  	  	  	  	["av"] = "@function.outer",
  	  	  	  	["iv"] = "@function.inner",
				-- c keymaps are for dictionaries
  	  	  	  	["ac"] = "@class.outer",
  	  	  	  	["ic"] = "@class.inner",
				-- k keymaps are for comments
  	  	  	  	["ak"] = "@comment.outer",
  	  	  	  	["ik"] = "@comment.inner",
  	  	  	},
  	  	},
  	  	move = {
  	  	  	enable = true,
  	  	  	set_jumps = true,
			-- Granular control over motions on key-values and dictionaries
			-- if you want it
  	  	  	goto_next_start = {
  	  	  	  	["]m"] = "@function.outer",
  	  	  	  	["]]"] = "@class.outer",
  	  	  	},
  	  	  	goto_next_end = {
  	  	  	  	["]M"] = "@function.outer",
  	  	  	  	["]["] = "@class.outer",
  	  	  	},
  	  	  	goto_previous_start = {
  	  	  	  	["[m"] = "@function.outer",
  	  	  	  	["[["] = "@class.outer",
  	  	  	},
  	  	  	goto_previous_end = {
  	  	  	  	["[M"] = "@function.outer",
  	  	  	  	["[]"] = "@class.outer",
  	  	  	},
  	  	},
		swap = {
    	  	enable = true,
		  	-- Swap parameters; ie. if a key-value has multiple values and you want to swap them
    	  	swap_next = {
    	  	  	[",a"] = "@parameter.inner",
    	  	},
    	  	swap_previous = {
    	  	  	[",A"] = "@parameter.inner",
    	  	},
    	},
  	},

    textsubjects = {
        enable = true,
        keymaps = {
			-- Press v. inside a key-value or a comment (then . or ; repeatedly)
            ['.'] = 'textsubjects-smart',
			-- Press v; to select surrounding dictionary
            [';'] = 'textsubjects-container-outer',
        }
    },
})

require("treesitter-context").setup({
    throttle = true,
    patterns = {
		-- This will show context for functions, classes and mehod
		-- in all languages
        default = { 'function', 'class', 'method' },
		-- In OpenFOAM files, we have dicts and key-val pairs
		-- (you might want to add '^list')
        foam = { '^dict$', '^key_value$' }
    },
    -- Make sure foam is treated with exact Lua patterns
    exact_patterns = { foam = true, }
})
