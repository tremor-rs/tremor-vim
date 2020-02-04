" Vim ftplugin file
" Description: Common file settings for all tremor languages
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

" setup for language server
" depends on https://github.com/wayfair-incubator/ale
" proceed only if ALE is installed -- we determine that by checking whether
" the ALEInfo command is present
if exists(':ALEInfo')
  " use the common tremor integration defined in ALE
  let b:ale_linter_aliases = ['tremor']

  " actually enables the language server.
  " better to set from inidividual vimrc (along with other ale linters), so disabled here
  "let b:ale_linters = ['tremor-language-server']
endif

let &cpo = s:cpo_save
unlet s:cpo_save
let b:did_ftplugin = 1
