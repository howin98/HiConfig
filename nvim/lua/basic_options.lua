local basic_options = {}

function basic_options.init_map()
	local map = require'utils'.map
	map('n|sh', 'set nosplitright','vnew')
	map('n|sj', 'set splitbelow','new')
	map('n|sk', 'set nosplitbelow','new')
	map('n|sl', 'set splitright','vnew')

	vim.cmd'xmap > >gv'
	vim.cmd'xmap < <gv'
	vim.cmd'nmap > >>'
	vim.cmd'nmap < <<'

	vim.cmd'nmap > >>'
	vim.cmd'nmap < <<'

	vim.cmd'nmap - <C-b>'
	vim.cmd'nmap = <C-f>'
end

function basic_options.init_cmd()
	local set = require'utils'.set

	set('tgc', true)
	set('cul', true)
	set('nu', true)
	set('ts', 2)
	set('so', 2)
	set('sw', 2)
	set('sts', 2)
	set('swf', false)
	set('fdm', 'expr')
	set('fml', 3)
	set('fdl', 99)
	set('fde', 'nvim_treesitter#foldexpr()')
	set('hid', true)
end


return basic_options
