" Vim ftplugin file
" Language: Tremor
" Maintainer: The Tremor Team

if exists('b:did_ftplugin')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal comments=:#,mb:#
setlocal formatoptions-=t fo+=c fo+=r fo+=o fo+=q fo+=l fo+=j
setlocal commentstring=#%s
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

runtime macros/matchit.vim " needed for the following match settings to work
let b:match_ignorecase = 0
let b:match_skip = 's:Comment\|String\|CaseGuard'
let b:match_words = 'match:case:default:end,' .
                  \ 'patch:end,' .
                  \ 'merge:end,' .
                  \ 'select:from:into,' .
                  \ 'create:end,' .
                  \ 'define:end'

let &cpo = s:cpo_save
unlet s:cpo_save
let b:did_ftplugin = 1
