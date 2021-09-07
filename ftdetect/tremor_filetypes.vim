" Vim ftdetect file
" Description: Filetype detection for all tremor languages
" Language: Tremor
" Maintainer: The Tremor Team

autocmd BufNewFile,BufRead *.tremor set filetype=tremor
autocmd BufNewFile,BufRead *.trickle set filetype=trickle
autocmd BufNewFile,BufRead *.troy set filetype=troy
