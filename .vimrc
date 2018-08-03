set nocompatible
filetype off

syntax enable
syntax on
set nu
set nobackup

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set timeout timeoutlen=3000 ttimeoutlen=100 "fix lag bug when use 'O' to insert a new line
set backspace=indent,eol,start
set clipboard=unnamed
set noswapfile
"set smartindent
"set autoindent

set t_Co=256
colorscheme monokai
"colorscheme solarized
"

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>




imap ¡ <Esc>:tabn 1<CR>i
imap ™ <Esc>:tabn 2<CR>i
imap £ <Esc>:tabn 3<CR>i
imap ¢ <Esc>:tabn 4<CR>i
imap ∞ <Esc>:tabn 5<CR>i
imap § <Esc>:tabn 6<CR>i
imap ¶ <Esc>:tabn 7<CR>i
imap • <Esc>:tabn 8<CR>i
imap ª <Esc>:tabn 9<CR>i

map ¡ :tabn 1<CR>
map ™ :tabn 2<CR>
map £ :tabn 3<CR>
map ¢ :tabn 4<CR>
map ∞ :tabn 5<CR>
map § :tabn 6<CR>
map ¶ :tabn 7<CR>
map • :tabn 8<CR>
map ª :tabn 9<CR>

" mac iterm alt map => siwtch window in nerdtree
nnoremap ∑ <C-w><C-w>
nnoremap ˙ <C-w><C-h>
nnoremap ¬ <C-w><C-l>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'crusoexia/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/MatchTagAlways'
"Plugin 'surround.vim'
Plugin 'SuperTab'
Plugin 'Shougo/neocomplete'
"Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'posva/vim-vue'
Plugin 'digitaltoad/vim-pug'
"Plugin 'tpope/vim-commentary'


"=====================================
"Great Plugin
"Plugin 'takac/vim-hardtime'
"Plugin 'matchit.zip'
"=====================================

call vundle#end()
filetype plugin indent on

set nobackup
set cursorline
set hlsearch
nnoremap j jzz
nnoremap k kzz
nnoremap ,= ggVG=<C-o><C-o>
"译释：nmap 是绑定一个在normal模式下的快捷键
nmap ,s :source ~/.vimrc<CR>:nohl<CR>
nmap ,v :e ~/.vimrc<CR>:nohl<CR>

"nmap <tab> v>
"nmap <s-tab> <v
"vmap <tab> >gv
"vmap <s-tab> <gv

set synmaxcol=128
set foldmethod=indent
set foldlevel=99 "fix folding when opening files in the beginning
let mapleader = "\<Space>"


nnoremap <Leader>t :tabe<CR>
nnoremap <Leader>l :ls<CR>
"remove highlight part after search
nnoremap <Leader>h :nohl<CR>

"set shortcut for emmet
"let g:user_emmet_leader_key='C-'

" copy content in mac terminal into other application like web browser
vmap <Leader>y :w !pbcopy<CR><CR>
"nmap <Leader>p :r !pbpaste<CR><CR> " don't working well in mac terminal

"this one is better
nmap <Leader>p "+p

" jump to next line after paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" choose the text you just paste
noremap gV `[v`]

" ignore .pyc file in python project
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" nerdtree-tab config
map <Leader>n <plug>NERDTreeTabsToggle<CR>

autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.php set filetype=html
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.pug set filetype=html
autocmd BufNewFile,BufRead *.scss set filetype=css

"autocmd BufNewFile,BufRead *.css set filetype=css
"autocmd FileType css set dictionary=~/.vim/dict/css.dict

"markdown preview
let g:vim_markdown_conceal = 0
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"

"ignore file in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"===============================================
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"===============================================

"===============================================
"vim-multiple-cursors # fix conflicts with neocomplete

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
"===============================================
