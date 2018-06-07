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
    PlugInstall
endif

" ***************************************************************************
" PLUGINS
" ***************************************************************************
call plug#begin()

Plug 'dracula/vim', {'as': 'dracula'}                   " colorscheme
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}    " file navbar
Plug 'ctrlpvim/ctrlp.vim'                               " fuzzy search
Plug 'airblade/vim-gitgutter'                           " git gutter
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}        " Golang support
Plug 'vim-airline/vim-airline'                          " status line
Plug 'vim-airline/vim-airline-themes'                   " theme status line
Plug 'Valloric/YouCompleteMe'                           " autocomplete
Plug 'mattn/emmet-vim'                                  " emmet autocomplete
Plug 'dougnukem/vim-swap-lines'                         " swap lines
Plug 'vim-scripts/indentpython.vim'                     " python autoindent
Plug 'tpope/vim-fugitive'                               " git wrapper for vim

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
set switchbuf=usetab            " use tabs instead of buffers
set clipboard=unnamed           " use system clipboard
set splitbelow                  " split below current pane
set splitright                  " split right side of current pane
set number                      " show line numbers
set relativenumber              " set relative line numbering
set scrolloff=5                 " number of lines to be shown above/below cursor
set linebreak                   " soft wrap text
set showbreak="> "              " preceed wrapped text
set colorcolumn=80              " show column ruler at 80 char width
set textwidth=80                " width of text to be shown
set showmatch                   " display matching braces
set list                        " show tabs and trailing whitespaces
set listchars=tab:▸\ ,eol:¬     " strings to use in `list` mode
set showcmd                     " show pressed commands in key line
set noshowmode                  " hide current mode details
set ruler                       " show current row and column info
set undolevels=1000             " set no of undo levels
set backspace=indent,eol,start  " makes backspace key more powerful
set autowrite                   " autosave before :next, :previous etc
set updatetime=100              " update the refresh interval
set encoding=utf-8              " set default encoding to utf-8
set ttyfast                     " Indicate fast terminal conn for faster redraw

if !has('nvim')
    set ttymouse=xterm2         " Indicate terminal type for mouse codes
    set ttyscroll=3             " Speedup scrolling
endif

set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set showcmd                     " show me what I type
set noswapfile                  " don't use swapfiles
set nobackup                    " don't create annoying backupfiles
set fileformats=unix,dos,mac    " prefer unix over windows over OS 9
set lazyredraw                  " wait to redraw

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo/
endif

" ***************************************************************************
" THEMING AND SYNTAX
" ***************************************************************************
" set background=dark " set dark background mode
color dracula " set colorscheme dracula
syntax enable

" show cursor line only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

highlight ExtraWhitespace ctermbg=red guibg=red
augroup WhitespaceMatch
  " Remove ALL autocommands for the WhitespaceMatch group.
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match_number =
        \ matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction

" ***************************************************************************
" INDENTATION
" ***************************************************************************
set autoindent      " auto indentation
set expandtab       " expand TAB into spaces
set shiftwidth=4    " helps indent plugins work better
" set smartindent     " smart choose indentation (e.g. comments continuously)
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
nmap <leader>ft :NERDTreeToggle<cr>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Emmet configuration
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Movement in tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" airline configuration
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1

" Golang configuration
let g:go_auto_sameids = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1

augroup go
    autocmd FileType go nmap <C-n> :cnext<CR>
    autocmd FileType go nmap <C-m> :cprevious<CR>
    autocmd FileType go nnoremap <C-a> :cclose<CR>
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <Leader>i <Plug>(go-info)
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-browser)
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
augroup end

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Python configuration
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

