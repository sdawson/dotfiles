" Leader mappings

" <leader><leader>: Stop highlighting search matches
nnoremap <leader><leader> :noh<CR>

" <leader>v: Highlight text that was last pasted
nnoremap <leader>v V`]

" <leader>=: Adjust splits to be the same size
nnoremap <leader>= <c-w>=

" <leader>-: Max out the height of a split (e.g. wmii)
nnoremap <leader>- <c-w>_

" <leader>k: Save vim session
nnoremap <leader>k :mksession<CR>

" <leader>y: Toggle line numbers between relative and normal mode
nnoremap <leader>y :call sophied#functions#NumberToggle()<CR>

" <leader>tw: Toggle line wrapping on or off
nnoremap <leader>tw :call sophied#functions#WrapToggle()<CR>

" <leader>tl: Toggle line wrapping on or off
nnoremap <leader>tl :call sophied#functions#ToggleLsp()<CR>

" <leader>d: Insert todays date into the current buffer
nnoremap <leader>d :call sophied#functions#Today()<CR>

" <leader>r: Reload all the current windows
nnoremap <leader>r :windo e<CR>

" <leader>u: Show or hide undotree
nnoremap <leader>u :UndotreeToggle<CR>

" <leader>c: Activate scalpel plugin
nnoremap <leader>cs <Plug>(Scalpel)

" <leader>cd: change working directory for the current buffer towards
" the directory of the file being edited
nnoremap <leader>cd :lcd %:h<CR>

" <leader>o: Close all windows except the current one
nnoremap <leader>o :only<CR>

" <leader>f: Open last buffer
nnoremap <leader>f <C-^>

" <leader>p: Show the path of the current file (for when you're in
" a split that's too small to see the file path in the status line)
nnoremap <leader>ps :echo expand('%')<CR>

" Copy the line number and filename of the current file into the + register
nnoremap <leader>py :let @+=expand('%') . ':' . line('.')<cr>

" <leader>ev: Open vimrc file for editing
nnoremap <silent> <leader>ev :execute 'edit' resolve($MYVIMRC)<cr>

" <leader>xv: Reload vimrc file in current session
nnoremap <silent> <leader>xv :source $MYVIMRC<cr>

" <localleader>h: Fix syntax highlighting issues in the current buffer
nnoremap <silent> <localleader>h :syntax sync fromstart<CR>

" <localleader>e: Edit file, starting from the same directory as the current
" file
nnoremap <localleader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" <localleader>s: Show the syntax group name of the item under the cursor
nnoremap <localleader>s :call sophied#functions#SyntaxAttr()<CR>
