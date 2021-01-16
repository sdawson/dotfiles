augroup SdawsonAfterObject
  autocmd!
  autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
augroup END
