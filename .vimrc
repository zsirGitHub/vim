" made by zsir

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"github plugin list
Plugin 'jlanzarotta/bufexplorer'
Plugin 'godlygeek/csapprox'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/winmanager'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'itchyny/calendar.vim'
Plugin 'altercation/vim-colors-solarized'
" vim-scripts repos  
Plugin 'autoload_cscope.vim'
Plugin 'c.vim'
Plugin 'ifdef-highlighting'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

set t_Co=256
set cursorline
set nocursorcolumn
set fencs=utf-8,gb18030 
set hls
set incsearch   
set ignorecase
set nowrapscan
set nowrap
set mousemodel=extend  " shift + LeftClick to search
set showcmd
set history=200
set autoread 
set mouse=

let g:mapleader = ","

" 快速重载配置文件
map <leader>s :source ~/.vimrc<cr> 
map <leader>e :e! ~/.vimrc<cr>
map Y "+y
map P "+p
nnoremap R "_d


" 自动跳转到上一次打开的位置
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal! g'\"" |
			\ endif 


syntax enable
" 设置vim的本色方案
set background=dark
"colorscheme wombat
"colorscheme desertEx
"colorscheme desert_my
"colorscheme solarized_my
"colorscheme solarized
"let g:solarized_degrade=0
"let g:solarized_termcolors=256

" 语法高亮
" 字体
"set gfn=Vera\ Sans\ YuanTi\ Mono:h10
"set gfn=Droid\ Sans\ Fallback:h10
" GUI
if has("gui_running")
    "colorscheme solarized
    colorscheme mine
else
    "colorscheme mine
    "colorscheme solarized
    colorscheme desert_my
    "colorscheme wombat256
    "colorscheme darkblue_my
endif

if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 11
elseif has("gui_macvim")
    set guifont=DejaVu_Sans_Mono:h11
elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono:h11
end


" 折叠相关
set foldmethod=marker
" Tab缩进
set smarttab
set expandtab 
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 自动缩进 
set smartindent 
set autoindent 
set cindent 

" 显示行号
set number 

" 显示光标位置 
set ruler 

" wild菜单 
set wildmenu 

" 上下移动时，留3行
set so=7

" set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap-=<,>
",h,l

" set magic on 
set magic 

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" 括号匹配
set showmatch 
set wildignore+=*.o,*.d

" How many tenths of a second to blink
set mat=2

" 状态栏
set laststatus=2
function! CurDir()
	let curdir = substitute(getcwd(), '/home/zsir', "~/", "g")
	return curdir
endfunction
set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ %=Pos:\ %l/%L:%c\ %p%%\ 


" Smart way to move btw. windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" 命令窗口大小
set cmdheight=1
" 文件编码 
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big-5,ucs,latin1

" 文件类型
set ffs=unix,dos
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" 不备份文件
set nobackup
set nowritebackup
set completeopt=longest,menu

" for taglist
nmap <F8> :TlistToggle <CR> 
let Tlist_Show_One_File = 1             " show one file tags
let Tlist_Use_Right_Window=1            
let Tlist_File_Fold_Auto_Close= 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Horiz_Window = 0 
let Tlist_WinWidth = 50
let Tlist_Exit_OnlyWindow = 1
let Tlist_Close_On_Select = 1
nmap <F7> :NERDTreeToggle <CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
noremap <C-S> :update<CR>
inoremap <C-S> <Esc>:update<CR>
noremap <C-L> :BufExplorer<CR>
noremap <C-K> :TlistToggle<CR>

set hidden
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bb :b#<cr> 
nmap <leader>bls :buffers<cr>
nmap <leader>b1 :b1<cr>
nmap <leader>b2 :b2<cr>
nmap <leader>b3 :b3<cr>
nmap <leader>b4 :b4<cr>
nmap <leader>b5 :b5<cr>
nmap <leader>b6 :b6<cr>
nmap <leader>b7 :b7<cr>
nmap <leader>b8 :b8<cr>
nmap <leader>b9 :b9<cr> 

nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt

set grepformat=%f:%l:%m
set tags=tags;
set autochdir

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"===================================================================
