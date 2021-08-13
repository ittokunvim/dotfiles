" ===========================================
" __     _____ __  __ ____   ____
" \ \   / /_ _|  \/  |  _ \ / ___|
"  \ \ / / | || |\/| | |_) | |
"   \ V /  | || |  | |  _ <| |___
"    \_/  |___|_|  |_|_| \_\\____|
" ===========================================
" select shell
set shell=/bin/zsh
" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=utf-8,ucs-boms,enc-jp,ep932
set fileformats=unix,dos,mac
set ambiwidth=double
set nobomb
set t_Co=256
" changed place of create swapfile
set noswapfile
" connect yank to clipboard
set clipboard=unnamed
" silent beep
set belloff=all
" line number
set nonumber
" title
set title
" indent
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
au FileType go setlocal sw=4 ts=4 sts=4 noet
set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" enable backspace in insert mode
set backspace=indent,eol,start
" ignore case sensitivity when searching
set ignorecase
" highlight word when searching
" set nohlsearch
" autocomplete commnad mode
set wildmenu
" display position of cursor
set ruler

"
" ===========================================
" Key bindings
" ===========================================
"

" no yank wen use "x"
vnoremap x "_x
nnoremap x "_x
" display previous tab
nnoremap <silent> , :bprevious<CR>
" display next tab
nnoremap <silent> . :bnext<CR>
" delete current buffer
nnoremap bd :bd<CR>
" autocomplate Bracket
inoremap {<ENTER> {}<Left><CR><ESC><S-o>
inoremap [<ENTER> []<Left><CR><ESC><S-o>
inoremap (<ENTER> ()<Left><CR><ESC><S-o>
" autocomplate quotation
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
" use emac key bind when insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>

" no open selct range after indent in visual mode
vnoremap > >gv
vnoremap < <gv

" split
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l

" .vimrc
cnoremap init :<C-u>edit $MYVIMRC<CR>
noremap <Space>s :source $MYVIMRC<CR>
" basic
noremap <Space>w :<C-u>w<CR>
noremap <Space>q :<C-u>q<CR>
noremap <Space>e :<C-u>e .<CR>
noremap <Space>t :<C-u>tabe .<CR>

"
" ===========================================
" plugin manager (dein)
" ===========================================
"

if &compatible
  set nocompatible
endif

" Directory where plugins are installed
let s:dein_dir = expand('~/.cache/nvim')
" place of dein.vim repository
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" toml
let s:toml_dir=expand('~/.config/nvim/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein_lazy.toml'

" load plugin
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy':1})

  " end certain structures automatically
  " call dein#add('tpope/vim-endwise')
  " usage: help emmet
  " call dein#add('mattn/emmet-vim')
  " file search
  " call dein#add('junegunn/fzf', { 'build': './install' })
  " call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " slim syntax
  " call dein#add('slim-template/vim-slim')
  " react syntax
  " call dein#add('maxmellon/vim-jsx-pretty')
  " yaml syntax
  " call dein#add('stephpy/vim-yaml')
  " git
  " call dein#add('tpope/vim-fugitive')

  call dein#end() 
  call dein#save_state()
endif

" slim syntax
autocmd BufRead,BufNewFile *.slim setfiletype slim

" execute install if any plugins not install
if dein#check_install()
  call dein#install()
endif

" ===========================================
" color scheme
" ===========================================
"
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax enable




" ===========================================
" snippets
" ===========================================
"
let g:user_emmet_settings = {
\  'html' : {
  \    'snippets' : {
    \      'pe': "<%= ${child}| %>", 
    \      'else': "<% else %>", 
    \      'end': "<% end %>", 
    \      'link_to': "<%= link_to ${child}| %>"
    \    }
    \  }
    \}

