return require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	sync_install = true,
  ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
  },
	incremental_selection = {
		enable = true
	},
}
