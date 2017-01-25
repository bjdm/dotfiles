"-------------------------------------------------------------------------------
" unite.vim mappings
"

" Recursively show files within the current working directory
nnoremap <leader>t :Unite -no-split -buffer-name=files -toggle -start-insert file_rec/async:!<cr>

" Show files within the current working directory
nnoremap <leader>f :Unite -no-split -buffer-name=files -toggle -start-insert file<cr>

" Show most recently used files
nnoremap <leader>r :Unite -no-split -buffer-name=mru -start-insert file_mru<cr>

" Show yank buffer
nnoremap <leader>y :Unite -buffer-name=yanks -profile-name='yank-search' history/yank<cr>
nnoremap <leader>Y :Unite
					\ -winheight=10
					\ -buffer-name=yanks
					\ -no-empty
					\ -direction=botright
					\ <cr>

" Show buffers
nnoremap <leader>b :Unite -quick-match -start-insert -profile-name='buffer-search' buffer -direction=botright -vertical-preview<cr>
