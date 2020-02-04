" Vim syntax file
" Language: tremor-query (trickle)
" Maintainer: The Tremor Team

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword tremorQueryKwSpecial  select create define
hi def link tremorQueryKwSpecial  Type

syn keyword tremorQueryKwControl  operator script
                                \ from into with
                                \ group by args window stream tumbling sliding where having
                                \ set each
hi def link tremorQueryKwControl  Keyword

syn cluster tremorQueryKeyword    contains=tremorQueryKw.*

" source syntax definitions from the tremor-script file
" (since trickle files can embed tremor-script code)
runtime! syntax/tremor-script.vim

" source syntax definitions from the common tremor file
runtime! syntax/tremor.vim

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = 'tremor-query'
