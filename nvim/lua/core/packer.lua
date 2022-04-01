return require('packer').startup(function()
	-- plugins management
	use 'wbthomason/packer.nvim'

	-- preload management
	-- use 'lewis6991/impatient.nvim'
	-- use 'nathom/filetype.nvim'
	use 'dstein64/vim-startuptime'

	-- syntax enhancement
	use {'lukas-reineke/indent-blankline.nvim', requires = 'nvim-treesitter/nvim-treesitter'}
	use {'romgrk/nvim-treesitter-context',      requires = 'nvim-treesitter/nvim-treesitter'}
	use {'abecodes/tabout.nvim',                requires = 'nvim-treesitter/nvim-treesitter'}

	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'p00f/nvim-ts-rainbow'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'mfussenegger/nvim-ts-hint-textobject'
	use 'windwp/nvim-ts-autotag'
	use 'andymass/vim-matchup'

	-- ui enhancement
	use {'catppuccin/nvim'}
	use {'akinsho/bufferline.nvim',  requires = 'kyazdani42/nvim-web-devicons'}
	use {'nvim-lualine/lualine.nvim',requires = 'kyazdani42/nvim-web-devicons'}
	use {'SmiteshP/nvim-gps',          requires = 'nvim-lualine/lualine.nvim'}
	use {'arkav/lualine-lsp-progress', requires = 'nvim-lualine/lualine.nvim' }

	-- basic editor enhancement
	use {'edluffy/specs.nvim', opt = true, event = 'CursorMoved'}
	use 'aserowy/tmux.nvim'
	use 'mg979/vim-visual-multi'
	use 'rmagatti/auto-session'
	use 'jiangmiao/auto-pairs'
	use 'rhysd/accelerated-jk'
	use 'itchyny/vim-cursorword'
	use 'terrortylor/nvim-comment'
	use 'hrsh7th/vim-eft'
	use 'romainl/vim-cool'
	use 'phaazon/hop.nvim'

	-- version control enhancement
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use 'lewis6991/gitsigns.nvim'

	-- panes enhancement
	use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
	use { 'nvim-telescope/telescope.nvim', 
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-lua/popup.nvim'
		} 
	}
	use 'simrat39/symbols-outline.nvim'

	-- language server enhancement
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
end)
