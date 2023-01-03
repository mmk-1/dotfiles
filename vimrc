" GENERAL
syntax on
set number
set hlsearch
set incsearch
set relativenumber
set noswapfile
set mouse=a
set showmatch
set undofile
set clipboard=unnamedplus
    " TABS
    set tabstop=4
    set shiftwidth=4
    set expandtab " Uses 4 spaces instead of Tab indent
    set autoindent
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

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" KEYMAPPINGS
let mapleader = " "

" NERDTree stuff
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>ne :NERDTree<CR>


set nocompatible
" PLUGINS
call plug#begin('~/.vim/autoload')
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-obsession'
Plug 'lifepillar/vim-gruvbox8'
call plug#end()

    " TMUX
    let g:tmux_navigator_no_mappings = 1
    noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
    noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
    noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
    noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>

    " NERDTREE
    let loaded_netrwPlugin = 1 " Disable netrw
    " nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTree<CR>
    nnoremap <leader>e :NERDTreeToggle<CR>
    nnoremap <C-f> :NERDTreeFind<CR>


" Colorscheme
let g:gruvbox_italicize_strings = 0
" disable bold in terminal vim
set t_md=
colorscheme gruvbox8
    " Remove transparency
    highlight Normal ctermbg=Black
    highlight NonText ctermbg=Black


