" Leader mappings

" <leader><leader>: Stop highlighting search matches
nnoremap <leader><leader> :noh<CR>

" <leader>v: Highlight text that was last pasted
nnoremap <leader>v V`]

" <leader>=: Adjust splits to be the same size
nnoremap <leader>= <c-w>=

" <leader>-: Max out the height of a split (e.g. wmii)
nnoremap <leader>- <c-w>_

" <leader>s: Save vim session
nnoremap <leader>s :mksession<CR>

" <leader>y: Toggle line numbers between relative and normal mode
nnoremap <leader>y :call sophied#functions#NumberToggle()<CR>

" <leader>l: Toggle line wrapping on or off
nnoremap <leader>l :call sophied#functions#WrapToggle()<CR>

" <leader>d: Insert todays date into the current buffer
nnoremap <leader>d :call sophied#functions#Today()<CR>

" <leader>r: Reload all the current windows
nnoremap <leader>r :windo e<CR>

" <leader>u: Show or hide undotree
nnoremap <leader>u :UndotreeToggle<CR>

" <leader>c: Activate scalpel plugin
nnoremap <leader>c <Plug>(Scalpel)

" <leader>o: Close all windows except the current one
nnoremap <leader>o :only<CR>

" <leader>f: Open last buffer
nnoremap <leader>f <C-^>

" <leader>p: Show the path of the current file (for when you're in
" a split that's too small to see the file path in the status line)
nnoremap <leader>p :echo expand('%')<CR>

" <localleader>h: Fix syntax highlighting issues in the current buffer
nnoremap <silent> <localleader>h :syntax sync fromstart<CR>

" <localleader>e: Edit file, starting from the same directory as the current
" file
nnoremap <localleader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" <localleader>s: Show the syntax group name of the item under the cursor
nnoremap <localleader>s :call sophied#functions#SyntaxAttr()<CR>
