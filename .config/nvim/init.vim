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
noremap init :<C-u>e $MYVIMRC<CR>
" my shortcut
noremap <Space>w :<C-u>w<CR>
noremap <Space>q :<C-u>q<CR>

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

" vim-plug (https://github.com/junegunn/vim-plug)
" =====================================
" installation
" 1. run sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" 2. run vim command :PlugInstall
"
call plug#begin('~/.vim/plugged')

" japanese documentation (https://github.com/vim-jp/vimdoc-ja)
Plug 'vim-jp/vimdoc-ja'

" language server (https://github.com/neoclide/coc.nvim)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" file searcher (https://github.com/junegunn/fzf.vim)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" file preview (https://github.com/yuki-yano/fzf-preview.vim)
Plug 'yuki-yano/fzf-preview.vim'

" file explorer (https://github.com/lambdalisue/fern.vim)
Plug 'lambdalisue/fern.vim'

" live server (https://github.com/turbio/bracey.vim)
Plug 'turbio/bracey.vim'

" colorscheme (https://github.com/lambdalisue/fern.vim)
Plug 'sainnhe/gruvbox-material'

call plug#end()

" plugin settings
" =====================================
"
" coc
let g:global_extensions = ['coc-html', 'coc-css']

# coc document scroll
inoremap <silent><expr> <c-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<c-j>"
inoremap <silent><expr> <c-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<c-k>"

" fern
noremap <Space>e :<C-u>Fern .<CR>

" fzf
noremap fzf :<C-u>Files<CR>

" gruvbox-material
colorscheme gruvbox-material 

" set indent of html <script>, <style> to 0
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "zero"

