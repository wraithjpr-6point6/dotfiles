set nocompatible              " be iMproved, required
filetype off                  " required

" =============================================================================
" Install Vim plugin manager, https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" =============================================================================
call plug#begin('~/.vim/plugged')

"Plug 'altercation/vim-colors-solarized' " solarized colour scheme
"Plug 'tomasr/molokai'                   " molokai color scheme. Needs let g:rehash256 = 1 to be good for 256 color terminals.
Plug 'NLKNguyen/papercolor-theme'       " PaperColor color scheme inspired by Google's material design. May need set t_Co=256.
Plug 'machakann/vim-highlightedyank'    " Make the yanked region apparent
Plug 'tpope/vim-surround'               " easily add, change & delete surroundings in pairs brackets, quotes, XML & HTML tags
Plug 'tpope/vim-repeat'                 " adds support of . vim command to plugins, eg. vim-surround
Plug 'git://github.com/jiangmiao/auto-pairs.git'
Plug 'editorconfig/editorconfig-vim'    " adds support for .editorconfig files
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" =============================================================================
" VIM settings
" =============================================================================
filetype plugin indent on     " required
set encoding=utf-8
set mouse=nicr
syntax enable

" Set leader key
let mapleader      = "\\"
let maplocalleader = "\\"

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
set termguicolors

" colour scheme
set background=dark
"set background=light
colorscheme PaperColor

" presentation settings
set nocursorline                    " no highlight of the screen line of the cursor
set list listchars=tab:→\ ,trail:▸  " in list mode show tabs and trailing spaces
set number                          " precede each line with its line number
set numberwidth=3                   " number of columns for line numbers
set relativenumber                  " Show the line number relative to the line with the cursor
set ruler                           " line and column number of the cursor position
set showcmd                         " Show (partial) command in status line.
set showmatch                       " Show matching brackets.
set visualbell t_vb=                " use visual bell instead of beeping (no flash)

" Behaviour
set hidden                          " a buffer becomes hidden when it is abandoned.
set autoindent                      " automatically indent new line
set autoread                        " automatically read a file changed on disk externally to vim
set backspace=indent,eol,start
set completeopt=menu,menuone,preview,longest
set guioptions-=m                   "remove menu bar
set guioptions-=T                   "remove toolbar
set linebreak                       " wrap long lines
set matchpairs+=<:>,=:;             " the % command also jumps for HTML tags and JavaScript assignment syntax
set shell=$SHELL                    " use current shell for shell commands
set smartindent                     " smart auto-indenting when starting a new line
set smarttab                        " samrt tabs according to shiftwidth and tabstop
set splitbelow                      " spawn horizontal splits below instead of above
set splitright                      " spawn vertical splits to the right instead of to the left
set virtualedit=block,insert        " Useful for selecting a rectangle in Visual mode and editing a table.
set wildmenu                        " Enhanced mode code completion

"ignore these file types when completing names and in explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" Tab settings
set tabstop=4                       " number of spaces in a tab
set shiftwidth=4                    " Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
set expandtab                       " expand tabs into spaces

" search settings
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

" directory settings
set nobackup            " do not write backup files.
set noswapfile          " do not write .swp files
set nowritebackup       " back up while a file is being written, then discarded.

" -----------------------------------------------------------------------------
" KEY MAPPING config
" NB. Do not put comments on rhs as they are considered part of the rhs
" -----------------------------------------------------------------------------

" To use `CTRL+{h,j,k,l}` to navigate windows consistently from any mode:
inoremap <C-c> <C-\><C-N><C-w>c
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

nnoremap <C-c> <C-w>c
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remove highlighting in normal mode
nnoremap <Leader><Space> :noh<CR>

" Move to next buffer
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Quickfix list commands
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" Location list commands
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

" Fuzzy find with fzf.
nnoremap <C-p> :FZF<CR>

" Fuzzy find on FZF Buffers
nnoremap <Leader>p :Buffers<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ----------------------------------------------------------------------------
" Insert text
" ----------------------------------------------------------------------------
" Quickly insert a timestamp in ISO8601 format
nnoremap <Leader>ds "=strftime("%Y-%m-%d")<CR>p
"nnoremap <Leader>ts "=strftime("%F %T%z")<CR>p
nnoremap <Leader>ts "=strftime("%Y-%m-%dT%H:%M:%SZ")<CR>p

" =============================================================================
" PLUGIN CONFIGS
" =============================================================================

" -----------------------------------------------------------------------------
"  " FZF config
"  " See https://github.com/junegunn/fzf.vim#fzf-heart-vim
"  "
"  -----------------------------------------------------------------------------
" Default fzf layout
" - Popup window
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '33%' }

" This is the default option:
"   - Preview window on the right with 50% width, hidden by default
"   - CTRL-/ will toggle preview window.
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
"let g:fzf_preview_window = []

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

" -----------------------------------------------------------------------------
" EDITORCONFIG config
" -----------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns=['fugitive://.*', 'scp://.*']

" -----------------------------------------------------------------------------
" LIGHTLINE config
" -----------------------------------------------------------------------------
if !has('gui_running')
  set t_Co=256
endif
let g:rehash256 = 1
let g:lightline = { 'colorscheme': 'PaperColor' }

set laststatus=2                    " always show the status lines
set noshowmode                      " the info is now shown in the statusline, so no need to see it again.

