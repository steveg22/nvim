return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
			css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
			html = { names = false }, -- Disable parsing "names" like Blue or Gray
		})
	end,
}
