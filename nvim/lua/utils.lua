local utils = {}

function utils.set(key, val)
	local c = type(val) == 'boolean' and (val and key or 'no'..key) or key..'='..val
	vim.cmd(('set %s'):format(c))
end

function utils.map(key, ...)
	local cmd = ''
	for _, v in ipairs{...} do
		cmd = ('%s<cmd>%s<cr>'):format(cmd, v)
	end
	local mode, keymap = key:match'([^|]*)|?(.*)'
	local options = {noremap=true, silent=true, expr=false, nowait=false}
	vim.api.nvim_set_keymap(mode, keymap, cmd, options)
end

function utils.mapP(key, cmd)
	local mode, keymap = key:match'([^|]*)|?(.*)'
  vim.cmd(('%smap %s <plug>(%s)'):format(mode, keymap, cmd))
end


return utils
