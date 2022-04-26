local basic_options = {}

function basic_options.init_map()
	local map = require'utils'.map
	vim.cmd'map <M-h> <C-w>h'
	vim.cmd'map <M-j> <C-w>j'
	vim.cmd'map <M-k> <C-w>k'
	vim.cmd'map <M-l> <C-w>l'
	map('n|sh', 'set nosplitright','vnew')
	map('n|sj', 'set splitbelow','new')
	map('n|sk', 'set nosplitbelow','new')
	map('n|sl', 'set splitright','vnew')

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
