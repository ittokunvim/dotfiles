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

" " tab => whitespace
" set expandtab

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
noremap <Space>w :<C-u>w<CR>
noremap <Space>q :<C-u>q<CR>
noremap <Space>e :<C-u>e .<CR>

" use emac key bind when insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>

" no yank wen use 'd' and 'x'
vnoremap d "_d
nnoremap x "_x

" no open select range after indent in visual mode
vnoremap > >gv
vnoremap < <gv

" split display
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l

