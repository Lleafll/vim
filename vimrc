set nocompatible
syntax on
filetype indent plugin on

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
set wildmenu

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
highlight ColorColumn ctermbg=0 guibg=gray17
highlight Pmenu guibg=Black gui=bold
highlight VertSplit guibg=gray17 guifg=gray17
highlight StatusLine guibg=fg guifg=gray17
highlight EndOfBuffer guibg=bg guifg=fg
highlight SignColumn guibg=gray17
set cursorline
set listchars=tab:>-,trail:�
set list
set number relativenumber
set laststatus=2

"keys
command! W w
inoremap <C-Space> <C-n>
set backspace=indent,start
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"latex
set conceallevel=2
set concealcursor=nc
let g:tex_conceal="abdgms"
let g:tex_flavor="latex"

"python
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
call plug#end()

"Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
let g:syntastic_python_checkers=["flake8"]

"vim-airline-themes options
let g:airline_theme='bubblegum'

