-- pcall(require, 'impatient')

local basic_options = require'basic_options'

basic_options.init_cmd()
basic_options.init_map()

local plugin = require'plugin'
plugin.check()
plugin.load()
local autocmd = require'autocmd'

