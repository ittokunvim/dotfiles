set fileencoding=utf-8
set noswapfile
set autoread
set hidden
set showcmd
set clipboard=unnamedplus

" 行末の1文字先までカーソルを移動できるようにする
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
syntax enable
" % で HTML のタグなどにもジャンプできるようにする
packadd! matchit

" インデント
set list listchars=tab:\▸\-,trail:-,nbsp:+
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

" 検索
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

let mapleader = " "

" 折り返した行を見た目の行単位で移動する
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap U <C-r>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-a> ggVG

" x と D はレジスタに入れずに削除する
nnoremap x "_x
nnoremap D "_D
xnoremap x "_d
onoremap x d
" 空白区切りの単語（WORD）を選択する
onoremap i<Space> iW
xnoremap i<Space> iW

" インデントを変えても選択を解除しない
xnoremap < <gv
xnoremap > >gv
" 行を上下に移動する
nnoremap <expr> <C-k> $'<Cmd>move-1-{v:count1}<CR>=l'
nnoremap <expr> <C-j> $'<Cmd>move+{v:count1}<CR>=l'
xnoremap <silent> <C-k> :move'<-2<CR>gv=gv
xnoremap <silent> <C-j> :move'>+1<CR>gv=gv

" 挿入モードで Emacs 風にカーソルを動かす
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
" 直前の単語を大文字／小文字／先頭だけ大文字にする
inoremap <C-g><C-u> <Esc>gUiwgi
inoremap <C-g><C-l> <Esc>guiwgi
inoremap <C-g><C-k> <Esc>bgUlgi

nnoremap <leader>w :update<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>ss :<C-u>split<CR><C-w>j
nnoremap <leader>sv :<C-u>vsplit<CR><C-w>l
