syntax on
set number
set relativenumber
set noswapfile

" Tab stuff
set tabstop=4
set shiftwidth=4
set expandtab " Uses 4 spaces instead of Tab indent

" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
" Vertical bar in insert mode
let &t_SI = "\<Esc>[6 q"
" Underline in replace mode
let &t_SR = "\<Esc>[4 q"
" Block in other modes
let &t_EI = "\<Esc>[2 q"

" Plugins
call plug#begin('~/.vim/autoload')
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" Colorscheme
set background=dark
colorscheme PaperColor

