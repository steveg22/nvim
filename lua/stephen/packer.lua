
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	use({ 'rose-pine/neovim', as = 'rose-pine' })

	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'},
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				run = 'make',
			},
		}
	})

	use({'nvim-treesitter/nvim-treesitter', run= ':TSUpdate' , requires = {'nvim-treesitter/nvim-treesitter-textobjects'} })
	use('nvim-treesitter/playground')

	use('theprimeagen/harpoon')
	use('mbbill/undotree')

	use('tpope/vim-fugitive')

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	use({
		-- LSP Configuration & Plugins
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig',
		'folke/neodev.nvim'
	})

	use {
		'j-hui/fidget.nvim',
		tag = 'legacy',
		config = function()
			require("fidget").setup {
				-- options
			}
		end,
	}

    use('sbdchd/neoformat')

	-- Autocompletion
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lua',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	})

end)
