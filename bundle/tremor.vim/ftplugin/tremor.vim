" Vim ftplugin file
" Language:     Tremor
" Maintainer:   Darach Ennis

if exists('b:did_ftplugin') finish endif

let s:cpo_save = &cpo
set cpo&vim

setlocal comments=:#,mb:#
setlocal formatoptions-=t fo+=c fo+=r fo+=o fo+=q fo+=l fo+=j
setlocal commentstring=##%s
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let b:match_ignorecase = 0
let b:match_skip = 's:Comment\|String\|CaseGuard'
let b:match_words = '\v<%(emit|drop|let|match|of|case|when|default|patch|insert|update|upsert|erase|merge|patch|for|end|event)>

let &cpo = s:cpo_save
unlet s:cpo_save
let b:did_ftplugin = 1'
