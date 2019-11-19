" Vim syntax file
" Language:     Tremor
" Maintainer:   Darach Ennis

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

"syn case match tremorSync grouphere NONE /\v^\s*%(emit|drop|event|let|match|of|case|when|end|patch|insert|upsert|update|erase|merge|for|default|present|absent)>/

syn match   tremorErrSymbol       /[@'^&\\#?]/
hi def link tremorErrSymbol       Error

syn match   tremorErrNumeric     /__\+/ contained
hi def link tremorErrNumeric     Error

syn match   tremorBracket         /[{[()\]}]/

syn keyword tremorKwControl       emit drop const let match of case when end patch insert upsert update
                            \     erase merge event for default present absent
hi def link tremorKwControl       Keyword

syn keyword tremorNull            null
hi def link tremorNull            String

syn keyword tremorBoolean         true false
hi def link tremorBoolean         Boolean

syn match tremorInteger         /\v%(\d+_*)+/ contains=tremorErrNumeric
hi def link tremorInteger         Number

syn match   tremorFloat           /\v%(\d+_*)+[eE][-+]?%(\d+_*)+/ contains=tremorErrNumeric
syn match   tremorFloat           /\v%(\d+_*)+\.%(\d+_*)+%([eE][-+]?%(\d+_*)+)?/ contains=tremorErrNumeric
hi def link tremorFloat           Float


syn cluster tremorKeyword         contains=tremorKw.*,tremorBoolean
syn cluster tremorComments        contains=tremorComment

syn match   tremorErrEscape       /\\\_.\?\_s*/ contained
hi def link tremorErrEscape       Error
syn match   tremorEscapeSQuote    /\\'/ contained
hi def link tremorEscapeSQuote    SpecialChar
syn match   tremorEscapeDQuote    /\\"/ contained
hi def link tremorEscapeDQuote    SpecialChar
syn match   tremorEscape          /\\[abefnrtv\\0]/ contained
syn match   tremorEscape          /\v\\x\x{2}/ contained
syn match   tremorEscape          /\v\\u\x{4}/ contained
syn match   tremorEscape          /\v\\U\x{6}/ contained
hi def link tremorEscape          SpecialChar

syn region  tremorString          matchgroup=tremorStringX start=/"/ skip=/\\./ end=/"/ contains=tremorEscapeDQuote,tremorEscape,tremorErrEscape
hi def link tremorString          String
syn region  tremorDocumentString  matchgroup=tremorDocumentStringX start=/"\ze""/ end=/"""*\zs"/
hi def link tremorDocumentString  String

syn region  tremorTest            matchgroup=tremorTestX start=/|/ skip=/\\./ end=/|/ contains=tremorEscape,tremorErrEscape
hi def link tremorTest            String

" Operators
syntax match tremorOperator "\([-!#$%`&\*\+./<=>@^|~:]\|\<\>\)"
highlight link tremorOperator Operator
syn keyword tremorOperatorWords   and or xor not
hi def link tremorOperatorWords   Operator

syntax match     tremorModuleName    "\w\(\w\)*\:\:"
syntax match     tremorFuncName    "\w\(\w\)*("he=e-1,me=e-1
highlight link tremorFuncName Function
highlight link tremorModuleName Function

syn keyword tremorCommentTodo    TODO contained
hi def link tremorCommentTodo    Todo
syn keyword tremorCommentBug     BUG contained
hi def link tremorCommentBug     Todo
syn keyword tremorCommentNote    NOTE contained
hi def link tremorCommentNote    Underlined
syn cluster tremorCommentSpecial contains=tremorCommentTodo,tremorCommentBug,tremorCommentNote

syn match tremorComment         @#.*$@ contains=@tremorCommentSpecial
hi def link tremorComment       Comment

syn match tremorCommentX        @/\ze/.*$@ contained transparent
hi def link tremorTestX           String
hi def link tremorStringX         String
hi def link tremorDocumentStringX String

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = 'tremor'
