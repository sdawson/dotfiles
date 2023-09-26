augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call sophied#functions#OnLspBufferEnabled()
augroup END

" vim-lsp settings
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'rust-analyzer',
    \ 'cmd': {server_info->['rust-analyzer']},
    \ 'allowlist': ['rust'],
    \ })
endif

let g:lsp_fold_enabled=0

let g:lsp_use_lua = has('lua') && has('patch-8.2.0775')
let g:lsp_use_native_client = has('patch-8.2.4780')
