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
