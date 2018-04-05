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
set guifont=Consolas:h9
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
highlight StatusLineNC guibg=fg guifg=gray17
highlight EndOfBuffer guibg=bg guifg=fg
highlight SignColumn guibg=gray17
set cursorline
set listchars=tab:>-,trail:·
set list
set number relativenumber
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"keys
command W w
inoremap <C-Space> <C-n>
set backspace=indent,start

"latex
set conceallevel=2
set concealcursor=nc
let g:tex_conceal="abdgms"
let g:tex_flavor="latex"

"python
command Pep8 execute "!autopep8 --in-place --aggressive --aggressive %"

"netrw
let g:netrw_altv=1
let g:netrw_browse_split=2
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

"vim-plug options
call plug#begin("~/vimfiles/plugged")
Plug 'vim-syntastic/syntastic'
call plug#end()

"Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let syntastic_quiet_messages = {
    \ "level": "warnings",
    \ "type": "style",
    \ "regex": '.*Could not execute LaTeX command\..*',
    \ "file": '.*\.tex$'}

