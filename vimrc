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

"convenience
set autoread
set path+=**
set wildignore+=.*,*/virtualenv/*,*/__pycache__/*
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
let &colorcolumn=81
highlight Cursor guibg=LightBlue guifg=Black
highlight ColorColumn ctermbg=0 guibg=gray17
highlight Pmenu guibg=Black gui=bold
highlight VertSplit guibg='#444444' guifg='#444444'
highlight StatusLine guibg='#444444' guifg='#444444'
highlight StatusLineNC guibg='#444444' guifg='#444444'
highlight EndOfBuffer guibg=gray17 guifg=gray17
highlight SignColumn guibg=gray17
set cursorline
set listchars=tab:>-,trail:·
set list
set number relativenumber
set laststatus=2
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
command! MyPy execute "!mypy --ignore-missing-imports %"
command! Pep8 execute "!autopep8 --in-place --aggressive --aggressive %"

"netrw
let g:netrw_altv=1
let g:netrw_browse_split=2
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
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

"Syntastic options
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
"C++
let g:syntastic_cpp_checkers=["clang_check"]
let g:syntastic_cpp_clang_check_post_args=""
"latex
let syntastic_quiet_messages = {
    \ "level": "warnings",
    \ "type": "style",
    \ "regex": '.*Could not execute LaTeX command\..*',
    \ "file": '.*\.tex$'}
"Python
let g:syntastic_python_checkers=["flake8", "mypy"]
let g:syntastic_python_mypy_args="--ignore-missing-imports --follow-imports=silent --disallow-untyped-defs --disallow-incomplete-defs"

"vim-airline-themes options
let g:airline_theme='angr'

"gutentags
let g:gutentags_generate_on_new = 0  " gutentags overwrites tags file otherwise

