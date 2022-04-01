lua require('core')

set clipboard=unnamedplus
set softtabstop=2
set shiftwidth=2
set scrolloff=4
set tabstop=2

set termguicolors
set cursorline
set autochdir
set number
set hidden

let mapleader=" "
map <leader> <nop>


noremap <silent><M-h> <cmd>lua require("tmux").move_left()    <cr>
noremap <silent><M-j> <cmd>lua require("tmux").move_bottom()  <cr>
noremap <silent><M-k> <cmd>lua require("tmux").move_top()     <cr>
noremap <silent><M-l> <cmd>lua require("tmux").move_right()   <cr>

noremap <silent><M-Left>  <cmd>lua require("tmux").resize_left()  <cr>
noremap <silent><M-Down>  <cmd>lua require("tmux").resize_bottom()<cr>
noremap <silent><M-Up>    <cmd>lua require("tmux").resize_top()   <cr>
noremap <silent><M-Right> <cmd>lua require("tmux").resize_right() <cr>

noremap <silent><M-[> <cmd>BufferLineCyclePrev<cr>
noremap <silent><M-]> <cmd>BufferLineCycleNext<cr>
noremap <silent><M-/> <cmd>BufferLinePick<cr>

noremap <silent><M-;> <cmd>NvimTreeToggle<cr><cmd>NvimTreeRefresh<cr>

map s <nop>
noremap <silent>sh <cmd>set nosplitright<cr><cmd>vnew<cr>
noremap <silent>sj <cmd>set   splitbelow<cr><cmd> new<cr>
noremap <silent>sk <cmd>set nosplitbelow<cr><cmd> new<cr>
noremap <silent>sl <cmd>set   splitright<cr><cmd>vnew<cr>
noremap <silent>st <cmd>tabnew<cr>

colorscheme catppuccin
