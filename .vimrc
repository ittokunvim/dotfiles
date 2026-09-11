" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"   \ V /  | || |  | |  _ <| |___
"    \_/  |___|_|  |_|_| \_\\____|
" =====================================

" vimのセットアップ
" =====================================
"
" 文字コードをUTF-8に設定
set fenc=utf-8
" バックアップファイルを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもそのほかのファイルを開けれるようにする
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" エディタのセットアップ
" =====================================
"
" " 行番号を表示する
" set number
" " 現在の行を強調表示
" set cursorline
" " 現在の列を強調表示
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるようにする
set virtualedit=onemore
" インデントはスマートインデントにする
set smartindent
" " ビープ音を可視化する
" set visualbell
" 括弧入力時の対応する括弧を表示する
set showmatch
" ステータスラインを常に表示する
set laststatus=2
" コマンドラインの補完を行う
set wildmode=list:longest
" 折り返し時に表示行単位での移動をできるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトを有効にする
syntax enable

" タブ設定
" =====================================
"
" 不可視文字を可視化する
set list listchars=tab:\▸\-
" タブ文字を半角スペースにする
set expandtab
" 行頭以外のタブ文字の表示幅を設定する
set tabstop=2
" 行頭でのタブ文字の表示幅を設定する
set shiftwidth=2

" 検索時の設定
" =====================================
"
" 検索文字列が小文字の場合、大文字小文字を区別なく検索する
set ignorecase
" 検索文字に大文字が含まれる場合、区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列をヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索後をハイライトで表示する
set hlsearch
" エスケープ連打でハイライトを解除する
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" キーマッピング
" =====================================
"
" マップリーダーをスペースに変更する
let mapleader = " "
" 行末までヤンクする
nnoremap Y y$
" レジスタに入れずに削除を行う
nnoremap x "_d
nnoremap X "_D
nnoremap x "_x
onoremap x d
" カーソルの上にある文字列を選択する
onoremap i<space> iW
xnoremap i<space> iW
" Uでリドゥする
nnoremap U <c-r>
" Mで括弧にジャンプする
packadd matchit
" qをプレフィックスにする
nnoremap <script><expr> q empty(reg_recording()) ? '<sid>(q)' : 'q'
nnoremap <sid>(q)q qq
" 入力後に大文字小文字切替を行う
inoremap<C-g><C-u> <esc>gUiwgi
inoremap<C-g><C-l> <esc>guiwgi
inoremap<C-g><C-k> <esc>bgUlgi
" ビジュアルモードでインデントを操作する
xnoremap < <gv
xnoremap > >gv
" 行を上下に移動する
nnoremap <expr> <C-k> $'<Cmd>move-1-{v:count1}<CR>=l'
nnoremap <expr> <C-j> $'<Cmd>move+{v:count1}<CR>=l'
xnoremap <silent><C-k> :move'<-2<CR>gv=gv
xnoremap <silent><C-j> :move'>+1<CR>gv=gv

" 私のショートカット
" =====================================
"
noremap <leader>w :update<CR>
noremap <leader>q :exit<CR>
noremap <leader>e :Ex<CR>
noremap <leader>t :tabnew<CR>
" 画面分割を行う
nnoremap <leader>ss :<C-u>sp<CR><C-w>j
nnoremap <leader>sv :<C-u>vs<CR><C-w>l
" 数値を増減させる
nnoremap + <C-a>
nnoremap - <C-x>
" 全てを選ぶ
nnoremap <C-a> gg<S-v>G
" ファイルの移動、削除を行う
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
" 文字を削除してもヤンクしない
nnoremap x "_x
nnoremap D "_D
" クリップボードにコピー
set clipboard=unnamedplus


