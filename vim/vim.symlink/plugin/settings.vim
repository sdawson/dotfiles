set laststatus=2
set cmdheight=2
set ruler
set title

set showmode
set showcmd
set report=0
set visualbell

set nomodeline

set incsearch
set hlsearch
set showmatch
set ignorecase " searches are case insensitive
set smartcase  " unless they contain at least one capital letter
set gdefault

set autoindent
set tabstop=2
set expandtab
set copyindent

set shiftwidth=2
set shiftround

set nowrap
set listchars+=extends:@
set textwidth=79
set wrapmargin=0
set formatoptions=tcroqwn
set backspace=indent,eol,start

" When joining lines that end with '.', '?' or '!', only insert one space, not two
set nojoinspaces

set history=300

set backupcopy=yes " overwrite files to update, rather than renaming and rewriting
if exists('$SUDO_USER')
  set nobackup
  set nowritebackup
else
  set backup
  set backupdir=~/.vim/backup//
endif

if exists('$SUDO_USER')
  set noswapfile
else
  set directory=~/.vim/swap//
  set directory+=.
endif

if v:version > 703
  set formatoptions+=j
endif

set wildchar=<TAB>
set wildmenu
set wildmode=longest,full

" set hybrid line number mode
set number
if exists('+relativenumber')
  set relativenumber
endif
set cursorline
if exists('+cursorlineopt')
  set cursorlineopt=number
endif

" Spellcheck settings
set spelllang=en_au

" Spellcheck camelCased words as words delimited by the uppercase letters
" in the word
if exists('+spelloptions')
  set spelloptions+=camel
end

" Persistent Undo
if has("persistent_undo")
  if exists('$SUDO_USER')
    set noundofile
  else
    set undodir=~/.vim/undodir//
    set undodir+=.
    set undofile
    set undolevels=1000 " max number of changes that can be undone
    set undoreload=10000 " max number of lines to save in undofile when a buffer reloads
  endif
endif

if has('folding')
  if has('windows')
    set fillchars=vert:┃ " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif
endif
