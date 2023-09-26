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

" Show the syntax group name of the item under cursor.
"	e.g map -a :call SyntaxAttr()<CR>
function! sophied#functions#SyntaxAttr() abort
  let synid = ""
  let guifg = ""
  let guibg = ""
  let gui   = ""
  let id1  = synID(line("."), col("."), 1)
  let tid1 = synIDtrans(id1)

  if synIDattr(id1, "name") != ""
    let synid = "group: " . synIDattr(id1, "name")

    if (tid1 != id1)
      let synid = synid . '->' . synIDattr(tid1, "name")
    endif
    let id0 = synID(line("."), col("."), 0)

    if (synIDattr(id1, "name") != synIDattr(id0, "name"))
      let synid = synid .  " (" . synIDattr(id0, "name")
      let tid0 = synIDtrans(id0)

      if (tid0 != id0)
        let synid = synid . '->' . synIDattr(tid0, "name")
      endif
      let synid = synid . ")"
    endif
  endif

     " Use the translated id for all the color & attribute lookups; the linked id yields blank values.
  if (synIDattr(tid1, "fg") != "" )
    let guifg = " guifg=" . synIDattr(tid1, "fg") . "(" . synIDattr(tid1, "fg#") . ")"
  endif
  if (synIDattr(tid1, "bg") != "" )
    let guibg = " guibg=" . synIDattr(tid1, "bg") . "(" . synIDattr(tid1, "bg#") . ")"
  endif
  if (synIDattr(tid1, "bold"     ))
    let gui = gui . ",bold"
  endif
  if (synIDattr(tid1, "italic"   ))
    let gui = gui . ",italic"
  endif
  if (synIDattr(tid1, "reverse"  ))
    let gui = gui . ",reverse"
  endif
  if (synIDattr(tid1, "inverse"  ))
    let gui = gui . ",inverse"
  endif
  if (synIDattr(tid1, "underline"))
    let gui = gui . ",underline"
  endif
  if (gui != ""                  )
    let gui = substitute(gui, "^,", " gui=", "")
  endif

  echohl MoreMsg
  let message = synid . guifg . guibg . gui
  if message == ""
   echohl WarningMsg
   let message = "<no syntax group here>"
  endif
  echo message
  echohl None
endfunction

function! sophied#functions#OnLspBufferEnabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes # what does this mean?
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)

  let g:lsp_format_sync_timeout=1000
  let g:lsp_inlay_hints_enabled = 1
  let g:lsp_inlay_hints_mode = {
  \  'normal': ['always'],
  \}
  hi link lspInlayHintsType Comment
  hi link lspInlayParameter Comment
endfunction

function! sophied#functions#ToggleLsp() abort
endfunction
