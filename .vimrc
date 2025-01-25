" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"   \ V /  | || |  | |  _ <| |___
"    \_/  |___|_|  |_|_| \_\\____|
" =====================================

" setup
" =====================================
"
" display line number
set nonumber

" auto indent when newline
set autoindent

" tabsize = 4
set tabstop=4

" 4 whitespace when autoindent
set shiftwidth=4

" open right when vertical sprit
set splitright

" copy on clipboard when yank string
set clipboard=unnamed

" cursor line
set cursorline

" search ignore case
set ignorecase
set smartcase

" changed leader key (\)
let mapleader = " "

" CapsLock -> Ctrl
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus

" key bindings
" =====================================
"
" my shortcut
noremap <leader>w :update<CR>
noremap <leader>q :exit<CR>
noremap <leader>e :Ex<CR>
noremap <leader>t :tabnew<CR>

" split display
nnoremap <leader>ss :<C-u>sp<CR><C-w>j
nnoremap <leader>sv :<C-u>vs<CR><C-w>l
" increment and decrement
nnoremap + <C-a>
nnoremap - <C-x>
" select all
nnoremap <C-a> gg<S-v>G

" use emac key bind when insert mode
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>

" no yank with delete key
nnoremap x "_x
" nnoremap d "_d
nnoremap D "_D
