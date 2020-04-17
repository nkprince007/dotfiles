" ***************************************************************************
" BASE CONFIGURATION
" ***************************************************************************
scriptencoding utf-8    " set character encoding to utf-8
set nocompatible        " do not use vi compatibility
let &t_ut=''

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
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', {'as': 'dracula'}
Plug 'mattn/emmet-vim'                                  " emmet autocomplete
Plug 'tpope/vim-fugitive'                               " git wrapper for vim
Plug 'tpope/vim-surround'                               " surroundings vim
Plug 'tpope/vim-commentary'                             " comments made easy
Plug 'godlygeek/tabular'                                " text alignment
Plug 'ap/vim-buftabline'

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

let g:ackprg='ag --nogroup --column --nocolor'

" ***************************************************************************
" THEMING AND SYNTAX
" ***************************************************************************
set background=dark              " set light background
syntax enable                    " enable syntax highlighting

" This enables truecolor support for nvim
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
nmap <leader>ft :NERDTreeToggle<cr>

" vim markdown preview
let g:vim_markdown_preview_pandoc=1

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap Q !!$SHELL<CR>

" Emmet configuration
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Movemenet in buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprev<cr>

" Movement in tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" ctrlp.vim configuration
let g:ctrlp_custom_ignore = 'node_modules\|vendor\|DS_Store\|git'

" theme configuration
" colorscheme dracula

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

" Python configuration
autocmd BufNewFile,BufRead *.py
  \ set tabstop=4
  \ softtabstop=4
  \ shiftwidth=4
  \ textwidth=79
  \ expandtab
  \ autoindent
  \ fileformat=unix
