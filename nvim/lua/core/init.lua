require('core.packer')
-- require('config.specs')
require('config.bufferline')
require('config.lualine')
require('config.nvimtree')
require('config.gitsigns')
require('config.tmux')



vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require('indent_blankline').setup{
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true
}
