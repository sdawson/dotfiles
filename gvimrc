set nocompatible

set laststatus=2
set cmdheight=2
set ruler
set title

set showmode
set showcmd
set report=0
set visualbell

set incsearch
set showmatch

set nowrap
set listchars+=extends:@

set autoindent
set tabstop=2
set expandtab
set copyindent

set shiftwidth=2
set shiftround

set textwidth=79
set formatoptions=tcroqwn
set backspace=indent,eol,start

syntax on
colo molokai
set background=dark

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

filetype on
autocmd FileType make :set noexpandtab
autocmd FileType c :set cindent
autocmd FileType txt :set wrap
autocmd FileType python :set textwidth=0
filetype plugin indent on
filetype plugin on

set backup
set backupdir=~/.vim/backup

set wildchar=<TAB>
set wildmenu
set wildmode=longest,full

set history=50
set nu
set sm
set wm=0

if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ 8
endif

#
call pathogen#infect()
