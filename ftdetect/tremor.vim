" Vim ftdetect file
" Description: Filetype detection for all tremor languages
" Language: Tremor
" Maintainer: The Tremor Team

" TODO remove the "-" from name (can cause issues in older vim)
" or just stick to tremor & trickle?
autocmd BufNewFile,BufRead *.tremor set filetype=tremor-script
autocmd BufNewFile,BufRead *.trickle set filetype=tremor-query
