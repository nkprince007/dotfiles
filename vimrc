" ***************************************************************************
" BASE CONFIGURATION 
" ***************************************************************************
scriptencoding utf-8    " set character encoding to utf-8
set nocompatible        " do not use vi compatibility

" i prefer using vim-plug, why because it's so small in size
let g:pluginstall=system('[ -s ~/.vim/autoload/plug.vim ] ; echo $?')
if g:pluginstall != 0
    call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    so ~/.vim/autoload/plug.vim
endif

" ***************************************************************************
" PLUGINS 
" ***************************************************************************
call plug#begin()

Plug 'dracula/vim'                                      " colorscheme
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}    " file navbar
Plug 'vim-airline/vim-airline'                          " statusline plugin
Plug 'tpope/vim-fugitive'                               " git plugin
Plug 'ctrlpvim/ctrlp.vim'                               " fuzzy search

call plug#end()

" ***************************************************************************
" MOVEMENT, SEARCHES
" ***************************************************************************
set hlsearch    " highlight all search matches 
set ignorecase  " ignore case for searching
set smartcase   " override `ignorecase` if pattern contains uppercase letters 
set incsearch   " show where the pattern, as it was typed so far, matches

" ***************************************************************************
" TEXT, EDITING AND DISPLAY
" ***************************************************************************
set number                  " show line numbers
set relativenumber          " set relative line numbering
set scrolloff=3             " number of lines to be shown above/below cursor
set linebreak               " soft wrap text
set showbreak="> "          " preceed wrapped text
set colorcolumn=80          " show column ruler at 80 char width
set textwidth=80            " width of text to be shown
set showmatch               " display matching braces 
set list                    " show tabs and trailing whitespaces
set listchars=tab:▸\ ,eol:¬ " strings to use in `list` mode
set showcmd                 " show pressed commands in key line
set noshowmode              " hide current mode details
set ruler                   " show current row and column info
set undolevels=1000
set backspace=indent,eol,start

" ***************************************************************************
" THEMING AND SYNTAX
" ***************************************************************************
set background=dark " set dark background mode
colorscheme dracula " set colorscheme dracula
syntax on

" show cursor line only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" ***************************************************************************
" INDENTATION 
" ***************************************************************************
set autoindent      " auto indentation
set expandtab       " expand TAB into spaces
set shiftwidth=4    " helps indent plugins work better
set smartindent     " smart choose indentation (e.g. comments continuously)
set smarttab        " smart add tab in a new line 
set softtabstop=4   " number of spaces to be inserted for a tab

augroup IndentExceptions
    autocmd!
    autocmd filetype typescript,html,css setlocal shiftwidth=2
    autocmd filetype typescript,html,css setlocal softtabstop=2
augroup END

" ***************************************************************************
" FILES
" ***************************************************************************
set wildignore+=.git                            " git version control
set wildignore+=*.out,*.class,*.pyc,__pycache__ " binary, bytecode
set wildignore+=*.jpg,*.jpeg,*.png              " image files
set wildignore+=Library,.DS_Store               " macOS ignore
set autoread                                    " autoread external changes

" ***************************************************************************
" KEYMAPPING
" ***************************************************************************
let mapleader = ","

nmap <c-p> :CtrlP<cr>
nmap <leader>b :NERDTree<cr>

" AIRLINE CONFIG
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_skip_empty_sections = 1
" powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
