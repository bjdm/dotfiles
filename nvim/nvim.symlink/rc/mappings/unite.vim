"-------------------------------------------------------------------------------
" unite.vim mappings
"

" Recursively show files within the current working directory
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>

" Show files within the current working directory
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>

" Show most recently used files
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>

" Show 'outline'??
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>

" Show yank buffer
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank -start-insert yank<cr>

" Show buffers
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
