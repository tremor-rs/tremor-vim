" Vim syntax file
" Language: tremor-script
" Maintainer: The Tremor Team

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword tremorScriptKwSpecial emit drop
hi def link tremorScriptKwSpecial Type

syn keyword tremorScriptKwControl const let
                                \ for
                                \ match of case when default end
                                \ patch insert upsert update erase move copy merge
                                \ mod use
                                \ intrinsic fn recur
hi def link tremorScriptKwControl Keyword

syn cluster tremorScriptKeyword   contains=tremorScriptKw.*

" source syntax definitions from the common tremor file
runtime! syntax/tremor_common.vim

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = 'tremor'
