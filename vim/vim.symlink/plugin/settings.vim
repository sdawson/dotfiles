set laststatus=2
set cmdheight=2
set ruler
set title

set showmode
set showcmd
set report=0
set visualbell

set incsearch
set hlsearch
set showmatch
set ignorecase " searches are case insensitive
set smartcase  " unless they contain at least one capital letter
set gdefault

set nowrap
set listchars+=extends:@

set autoindent
set tabstop=2
set expandtab
set copyindent

set shiftwidth=2
set shiftround

set textwidth=79
set wrapmargin=0
set formatoptions=tcroqwn
set backspace=indent,eol,start

" When joining lines that end with '.', '?' or '!', only insert one space, not two
set nojoinspaces

set history=50
set backup
set backupdir=~/.vim/backup

set wildchar=<TAB>
set wildmenu
set wildmode=longest,full

" set hybrid line number mode
set number
if exists('+relativenumber')
  set relativenumber
end
set cursorline
set cursorlineopt=number

" Spellcheck settings
set spelllang=en_au

" Persistent Undo
if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000 " max number of changes that can be undone
  set undoreload=10000 " max number of lines to save in undofile when a buffer reloads
end

if has('folding')
  if has('windows')
    set fillchars=vert:┃
  endif
endif
