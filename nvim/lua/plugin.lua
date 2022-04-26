local mapP = require 'utils'.mapP
local map = require 'utils'.map

local plugin = {
	{ 'lewis6991/impatient.nvim' },
	{ 'nathom/filetype.nvim' },

	{ 'wbthomason/packer.nvim' },
	{ 'tweekmonster/startuptime.vim' },

	{
		'catppuccin/nvim',
		hook = function() vim.cmd [[colorscheme catppuccin]] end
	},

	{
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'romgrk/nvim-treesitter-context',
			'p00f/nvim-ts-rainbow',
			'lukas-reineke/indent-blankline.nvim',
		},
		hook = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = 'all',
				ignore_install = { 'phpdoc' },
				sync_install = false,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				},
				incremental_selection = { enable = true },
				rainbow = { enable = true }
			}
			require 'treesitter-context'.setup {}
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			require 'indent_blankline'.setup {
				space_char_blankline = ' ',
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	},

	{
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		hook = function()
			map('n|<M-p>', 'BufferLinePick')
			require 'bufferline'.setup {}
		end
	},

	{
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'arkav/lualine-lsp-progress',
			'SmiteshP/nvim-gps',
		},
		hook = function()
			local gps = require 'nvim-gps'
			require 'nvim-gps'.setup {}
			require 'lualine'.setup {
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch' },
					lualine_c = { { gps.get_location, cond = gps.is_available } },
					lualine_x = { 'lsp_progress', 'fileformat', 'filetype' },
					lualine_y = { 'diff', 'diagnostics' },
					lualine_z = { 'progress', 'location' },
				},
				options = {
					theme = 'catppuccin',
					section_separators = '',
					component_separators = '',
					disabled_filetypes = {},
					globalstatus = true,
				}
			}
		end
	},


	{
		'mg979/vim-visual-multi',
		hook = function() vim.cmd [[let g:VM_theme = "iceblue"]] end
	},

	{ 'ethanholz/nvim-lastplace', as = 'nvim-lastplace' },

	{
		'neovim/nvim-lspconfig',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/nvim-cmp',
		},
		hook = function()
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			require 'lspconfig'.rust_analyzer.setup {}
			require 'lspconfig'.sumneko_lua.setup {}
			require 'lspconfig'.tsserver.setup {}
			require 'lspconfig'.pyright.setup {}
			require 'lspconfig'.clangd.setup {}
			require 'lspconfig'.cmake.setup {}
			require 'lspconfig'.gopls.setup {}
			local cmp = require 'cmp'
			map('n|K', 'lua vim.lsp.buf.hover()')
			cmp.setup {
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = cmp.config.sources {
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
					{ name = 'copilot' }
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				},
			}
		end
	},

	{
		'hrsh7th/vim-eft',
		hook = function()
			mapP('n|;', 'eft-repeat')
			mapP('x|;', 'eft-repeat')
			mapP('o|;', 'eft-repeat')

			mapP('n|f', 'eft-f')
			mapP('x|f', 'eft-f')
			mapP('o|f', 'eft-f')
			mapP('n|F', 'eft-F')
			mapP('x|F', 'eft-F')
			mapP('o|F', 'eft-F')

			mapP('n|t', 'eft-t')
			mapP('x|t', 'eft-t')
			mapP('o|t', 'eft-t')
			mapP('n|T', 'eft-T')
			mapP('x|T', 'eft-T')
			mapP('o|T', 'eft-T')
		end
	},

	'Chiel92/vim-autoformat',

	{ 'windwp/nvim-autopairs', as = 'nvim-autopairs' },
	{ 'norcalli/nvim-colorizer.lua', as = 'colorizer' },
	{ 'lewis6991/gitsigns.nvim', as = 'gitsigns' },
	{ 'edluffy/specs.nvim', as = 'specs' },
	{ 'karb94/neoscroll.nvim', as = 'neoscroll' },
	{
		'preservim/nerdcommenter',
		hook = function()
		end
		--[[ require'Comment'.setup{ ]]

	},

	{
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'simrat39/symbols-outline.nvim',
			'kyazdani42/nvim-tree.lua',
		},
		hook = function()
			require 'telescope'.setup {}
			require 'nvim-tree'.setup {}
			map('n|<M-/>', 'Telescope live_grep')
			map('n|<M-:>', 'Telescope commands')
			map('n|<M-?>', 'Telescope keymaps')
			map('n|<M-e>', 'Telescope find_files')
			map('n|<M-@>', 'Telescope lsp_dynamic_workspace_symbols')
			map('n|<M-#>', 'SymbolsOutline')
			map('n|<M-$>', 'NvimTreeToggle')

			map('n|gd', 'Telescope lsp_definitions')
			map('n|gr', 'Telescope lsp_references')
			map('n|ga', 'Telescope lsp_code_actions')
			vim.g.symbols_outline = {
				width = 30
			}
		end
	},


	'romainl/vim-cool',



	{
		'rcarriga/nvim-notify',
		config = function() require("telescope").load_extension("notify") end
	},
}


function plugin.check()
	local fn = vim.fn
	local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		PackerBootstrap = fn.system {
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path
		}

		require 'packer'.sync()
	end
end

function plugin.load()
	local packer_status, packer = pcall(require, 'packer')
	if packer_status then
		packer.startup {
			function(use)
				for _, elem in ipairs(plugin) do
					use(elem)
					_ = elem.hook and elem.hook()
					if elem.as then
						local status, obj = pcall(require, elem.as)
						_ = status and obj.setup {}
					end
				end
			end,
			config = {
				display = { open_fn = require('packer.util').float },
				git = { clone_timeout = 300 },
				auto_clean = true,
				compile_on_sync = true,
			}
		}
	end
end

return plugin
