" Vim ftplugin file
" Language: tremor-script
" Maintainer: The Tremor Team

if exists('b:did_ftplugin')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" source settings from the common tremor file
runtime! ftplugin/tremor_common.vim

" extend the functionality of % key to jump between these tremor keyword groups
runtime macros/matchit.vim " needed for the following match settings to work
let b:match_ignorecase = 0
let b:match_skip = 's:Comment\|String\|CaseGuard'
let b:match_words = 'match:case:default:end,' .
                  \ 'patch:end,' .
                  \ 'merge:end,'

let &cpo = s:cpo_save
unlet s:cpo_save
let b:did_ftplugin = 1
