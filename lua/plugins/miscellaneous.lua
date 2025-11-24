return { -- Collection of various small independent plugins/modules
	-- {
	-- 	"echasnovski/mini.nvim",
	-- 	config = function()
	-- 		-- Better Around/Inside textobjects
	-- 		--
	-- 		-- Examples:
	-- 		--  - va)  - [V]isually select [A]round [)]paren
	-- 		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
	-- 		--  - ci'  - [C]hange [I]nside [']quote
	-- 		require("mini.ai").setup({ n_lines = 500 })
	--
	-- 	end,
	-- },
	{
		"https://github.com/nvim-mini/mini.surround",
		-- Add custom surroundings to be used on top of builtin ones. For more
		-- information with examples, see `:h MiniSurround.config`.
		custom_surroundings = nil,

		-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
		highlight_duration = 500,
		opts = {
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 20,
		},
	},
}
