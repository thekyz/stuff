" Language stuff {{{

if has("win32")
    language English_United States
endif

if has("nvim")
endif

" }}}
"
" Basic stuff and plugins {{{

filetype off
filetype plugin indent on

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

set re=1
set lazyredraw

" vim fugitive force vertical split on diff
set diffopt+=vertical

" shift-tab unindent
" command mode
"nnoremap <S-Tab> <<
" insert mode
"inoremap <S-Tab> <C-d>

"set colorcolumn=140

let g:ale_linters = { 'python': ['flake8'] }
"let g:ale_linters_explicit = 1
let g:ale_python_flake8_options = '--max-line-length=120'

" CtrlP shortcuts
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_ccstom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.((exe|so|dll|a|o|gcno|gcda|d)$|(nostrip))'
    \ }
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ycm_rust_src_path="~/dev/rust-master/src/"

set shortmess+=c

let g:NERDTreeChDirMode = 2

let NERDTreeIgnore = ['\.gcda$','\.gcno$','\.d$']

let g:NERDTreeChDirMode = 2

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:Powerline_symbols = 'unicode'

"set switchbuf=usetab,newtab
set switchbuf=useopen

set nocompatible
set modelines=0

inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap
set smarttab

set list
set listchars=tab:>-

set encoding=utf-8
"set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set mouse=a
set ruler
set backspace=indent,eol,start
" always display status bar (0 never, 1 only more than 1 window, 2 always)
set laststatus=2
set relativenumber
set number
set undofile

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
"
" Color scheme and GUI {{{

syntax on
"set background=dark
colorscheme molokai
"colorscheme fruchtig

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Font
if has('gui_running')
    if has('gui_win32')
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
    else
        set guifont=PragmataPro\ for\ Powerline\ 10
    endif
endif

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" }}}
"
" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}
"
" Shortcuts {{{

let mapleader = ","

" NerdTree toggle
nnoremap <leader>b :NERDTreeToggle<CR>

"nnoremap ; :

" Save files on loss of focus (not sure if i like this one after all ...)
"au FocusLost * :wa
au VimResized * :wincmd =

augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

let g:ackprg = 'ag --vimgrep'
nnoremap <leader>a :Ack!

" Clear trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Toggle [i]nvisible characters
nnoremap <leader>l :set list!<CR>
nnoremap <leader>w <C-w>v<C-w>l

" edit vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>:setlocal relativenumber!<cr>

" Tabs
nnoremap <leader>[ :tabprev<cr>
nnoremap <leader>] :tabnext<cr>

" Inserting blank lines
" I never use the default behavior of <cr> and this saves me a keystroke...
nnoremap <cr> o<esc>

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Nerd commenter remap
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>

" Delete buffer while keeping window
nnoremap <silent> <leader>d :bp\|bd #<CR>

set pastetoggle=<F2>

" Quickfix window open for shellcheck
au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

" }}}
"
" Search {{{

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" }}}
"
"" Syntastic {{{
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 5
""let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"
""let g:syntastic_error_symbol = '?'
""let g:syntastic_style_error_symbol = '??'
""let g:syntastic_warning_symbol = '??'
""let g:syntastic_style_warning_symbol = '??'
"
"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn
"
"let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
 
" fix mouse not working past 220th column
"if has("mouse_sgr")
    "set ttymouse=sgr
"else
    "set ttymouse=xterm2
"end

" }}}

augroup markdown
    au!
    au BufNewFile,BufRead *.md setlocal filetype=ghmarkdown
augroup END

filetype on
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>

" cscope setup
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap <silent> <F9> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>

" jump to a function declaration
nmap <silent> <F10> :cs find s <C-R>=expand("<cword>")<CR><CR>1<CR><CR>
" jump to a function definition
nmap <silent> <F9> :cs find g <C-R>=expand("<cword>")<CR><CR>
" show a list of where function is called
nmap <silent> <F12> :cs find c <C-R>=expand("<cword>")<CR><CR>

