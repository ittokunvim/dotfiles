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
set number

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
" highright string searching
set hls

" key bindings
" =====================================
"
" open this file
" noremap init :<C-u>e $MYVIMRC<CR>

" my shortcut
noremap ;w :update<CR>
noremap ;q :exit<CR>
noremap ;e :Ex<CR>

" use emac key bind when insert mode
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>

" split display
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l

syntax on

