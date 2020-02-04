" Vim syntax file
" Language: Trickle (tremor-query)
" Maintainer: The Tremor Team

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" reuse definitions from the common file
" TODO move trickle-only stuff out of here
runtime! syntax/tremor.vim

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = 'trickle'
