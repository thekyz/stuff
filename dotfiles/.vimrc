" Language stuff {{{

if has("win32")
    language English_United States
endif

" }}}
"
" Basic stuff and plugins {{{

filetype off
call pathogen#infect()
filetype plugin indent on

" CtrlP shortcuts
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" NerdTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

set switchbuf=usetab,newtab

set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
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
set background=dark
colorscheme molokai

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

"set list
set listchars=tab:?\ ,eol:¬

nnoremap ; :

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

" Clear trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Toggle [i]nvisible characters
nnoremap <leader>l :set list!<CR>
nnoremap <leader>a :Ack
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Tabs
nnoremap <leader>[ :tabprev<cr>
nnoremap <leader>] :tabnext<cr>

" Inserting blank lines
" I never use the default behavior of <cr> and this saves me a keystroke...
nnoremap <cr> o<esc>

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" MBE mappings
nnoremap <leader>mbe :MBEOpen<cr>
nnoremap <leader>mbc :MBEClose<cr>
nnoremap <leader>mbt :MBEToggle<cr>

" Nerd commenter remap
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>

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
set gdefault
set incsearch
set showmatch
set hlsearch

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" }}}
"
" Search {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"let g:syntastic_error_symbol = '?'
"let g:syntastic_style_error_symbol = '??'
"let g:syntastic_warning_symbol = '??'
"let g:syntastic_style_warning_symbol = '??'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" }}}

