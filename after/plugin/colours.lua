function ColourMyPencils(colour)
	colour = colour or "rose-pine"
	vim.cmd.colorscheme(colour)

	-- set the background to be transparent
	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColourMyPencils()
