set nocompatible
syntax on
filetype indent plugin on
language messages English_United States
set langmenu=en_US.UTF-8

"whitespace
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set textwidth=80

"Disable automatic line breaks
set wrapmargin=0  " Wrap lines immediately
set formatoptions-=t  " Diable 'tearoff menu items'

"convenience
set autoread
set path+=**
set wildignore+=.*,*/__pycache__/*,*/virtualenv/*,*/venv/*
set wildmenu

"complete/ctags
set complete-=i
command! Ctags execute "!ctags --recurse --languages=Python --exclude=.git --exclude=.mypy_cache --exclude=virtualenv"

"gui
set anti enc=utf-8
if has("win32")
    set guifont=Consolas:h9
elseif has("unix")
    set guifont=Noto\ Mono\ 9
endif
colo evening
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set nu
let &colorcolumn=join(range(81,999),",")
highlight Cursor guibg=LightBlue guifg=Black
highlight ColorColumn ctermbg=0 guibg=gray17
highlight Pmenu guibg=Black gui=bold
highlight VertSplit guifg='#444444' guibg=gray17
highlight StatusLine guibg=fg guifg='#444444'
highlight StatusLineNC guibg='#444444' guifg='#444444'
highlight EndOfBuffer guibg=gray17 guifg=gray17
highlight LineNr guibg='#444444'
highlight CursorLineNr guibg='#444444'
highlight SignColumn guibg='#444444'
set cursorline
set listchars=tab:>-,trail:·
set list
set number relativenumber
set laststatus=2
set signcolumn=yes
"window title
auto BufEnter * let &titlestring = fnamemodify(getcwd(), ":t")

"keys
set backspace=indent,start
command! W w
nnoremap <F2> <C-]>
inoremap <C-Space> <C-n>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"latex
let g:tex_flavor="latex"

"python
command! Yapf execute "!yapf --in-place %"
command! Mypy execute "!mypy --namespace-packages %"
command! Pep8 execute "!autopep8 --in-place --aggressive --aggressive %"

"netrw
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

"make
function! CMakeFunc(directory)
    set makeprg=cmake\ --build\ $*
    set errorformat=\ %#%f(%l):\ %#%t%[A-z]%#\ %[A-Z\ ]%#%n:\ %m
    execute "make " . a:directory
endfunction
command! -nargs=1 -complete=dir CMake call CMakeFunc(<f-args>)

"testing
function! CTestFunc(directory)
    call CMakeFunc(a:directory)
    set makeprg=cd\ $*\ &&\ ctest\ -V
    set errorformat=%.%#:\ %#%f(%l):\ %m
    execute "make " . a:directory
endfunction
command! -nargs=1 -complete=dir CTest call CTestFunc(<f-args>)

"vim-plug options
call plug#begin("~/vimfiles/plugged")
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
call plug#end()

"vim-airline-themes options
let g:airline_theme='angr'
let g:airline#extensions#ale#enabled = 1

"gutentags
let g:gutentags_generate_on_new = 0  " gutentags overwrites tags file otherwise

"ale options
let g:ale_open_list = 1
let g:ale_echo_msg_format = "%linter%: %s"
let g:ale_linters = {"python": ["mypy", "flake8"]}
let g:ale_python_mypy_options = "--ignore-missing-imports --disallow-untyped-defs --disallow-incomplete-defs"
