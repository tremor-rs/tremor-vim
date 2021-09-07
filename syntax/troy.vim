" Vim syntax file
" Language: tremor-deploy (troy)
" Maintainer: The Tremor Team

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword tremorDeployKwSpecial  define deploy connector pipeline flow config to links connect args
hi def link tremorDeployKwSpecial  Type

syn keyword tremorDeployKwControl  define deploy connector pipeline flow config to links connect args
hi def link tremorDeployKwControl  Keyword

syn cluster tremorDeployKeyword    contains=tremorDeployKw.*

" source syntax definitions from the tremor-script file
" (since troy files can embed tremor-script code)
runtime! syntax/tremor.vim

" source syntax definitions from the tremor-query file
" (since troy files can embed tremor-script code)

" source syntax definitions from the common tremor file
runtime! syntax/tremor_common.vim

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = 'troy'
