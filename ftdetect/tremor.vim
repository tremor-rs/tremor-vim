" Vim ftdetect file
" Language: Tremor
" Maintainer: The Tremor Team

autocmd BufNewFile,BufRead *.tremor set filetype=tremor-script
autocmd BufNewFile,BufRead *.trickle set filetype=tremor-query

" we apply common configuration for all tremor filetypes right now, but the
" distinction between filetypes is still going to be useful for users (and
" also for external tools like tremor language server)
autocmd Filetype tremor-script,tremor-query call tremor#SetCommonTremorOptions()
