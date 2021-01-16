" Toggle between hybrid and absolute line number modes
" (assumes set number has previously been set)
function! sophied#functions#NumberToggle() abort
  if exists('+relativenumber')
    if(&relativenumber == 1)
      set norelativenumber
    else
      set relativenumber
    endif
  end
endfunction

" Add right margin highlighting to lines longer than textwidth
function! sophied#functions#HighlightTooLongLines() abort
  highlight def link RightMargin Error
  if &textwidth != 0
    exec 'match RightMargin /\%<' . (&textwidth + 3) . 'v.\%>' . (&textwidth + 1) . 'v/'
  endif
endfunction

function! sophied#functions#WrapToggle() abort
  if &wrap
    setlocal nowrap
    set virtualedit=all
  else
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal textwidth=0
    setlocal wrapmargin=0
  endif
endfunction

function! sophied#functions#Today() abort
  let today=strftime("%A %d\/%m\/%Y")
  exe "normal a". today
endfunction

function! sophied#functions#Spell() abort
  if has('syntax')
    setlocal spell
  endif
endfunction

function! sophied#functions#Plaintext() abort
  setlocal textwidth=0
  setlocal wrap

  call sophied#functions#Spell()

  " Break undo sequences into chunks that occur after punctuation.
  "
  " Taken from https://github.com/wincent/wincent/blob/master/aspects/vim/files/.vim/autoload/wincent/functions.vim#L22-L40,
  " which is in turn taken from https://github.com/ahmedelgabri/dotfiles/blob/f2b74f6cd4d/files/.vim/plugin/mappings.vim#L27-L33
  inoremap <buffer> ! !<C-g>u
  inoremap <buffer> , ,<C-g>u
  inoremap <buffer> . .<C-g>u
  inoremap <buffer> : :<C-g>u
  inoremap <buffer> ; ;<C-g>u
  inoremap <buffer> ? ?<C-g>u

  " Highlight trailing whitespace when writing plaintext
  if has('autocmd')
    autocmd BufWinEnter <buffer> match Error /\s\+$/
    autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
    autocmd InsertLeave <buffer> match Error /\s\+$/
    autocmd BufWinLeave <buffer> call clearmatches()
  endif
endfunction
