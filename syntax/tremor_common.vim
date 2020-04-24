" Vim syntax file
" Description: Common syntax definitions for all tremor languages
" Language: Tremor
" Maintainer: The Tremor Team

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

syn match   tremorErrSymbol       /[@'^&\\#?]/
hi def link tremorErrSymbol       Error

syn match   tremorErrNumeric      /__\+/ contained
hi def link tremorErrNumeric      Error

syn match   tremorBracket         /[{[()\]}]/

" keywords common to all tremor languages
" grouping as special so that we have different color for these from other keywords
syn keyword tremorKwSpecial       event state args group window
hi def link tremorKwSpecial       Special

syn keyword tremorNull            null
hi def link tremorNull            Constant

syn keyword tremorBoolean         true false
hi def link tremorBoolean         Boolean

syn match tremorInteger           /\v%(\d+_*)+/ contains=tremorErrNumeric
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

syn region  tremorInterpolation   contained matchgroup=tremorBracket start=/{/ end=/}/ contains=@tremorExpression

syn region  tremorString          matchgroup=tremorStringX start=/"/ skip=/\\./ end=/"/ contains=tremorInterpolation,tremorEscapeDQuote,tremorEscape,tremorErrEscape
hi def link tremorString          String
syn region  tremorDocumentString  matchgroup=tremorDocumentStringX start=/"\ze""/ end=/"""*\zs"/
hi def link tremorDocumentString  String

syn region  tremorTest            matchgroup=tremorTestX start=/|/ skip=/\\./ end=/|/ contains=tremorEscape,tremorErrEscape
hi def link tremorTest            String

syntax match   tremorOperator     "\([-!#$%`&\*\+./<=>@^|~:]\|\<\>\)"
hi def link    tremorOperator     Operator

syn keyword tremorOperatorWords   and or xor not present absent with as of
hi def link tremorOperatorWords   Operator

syntax match   tremorModuleName   "\(\w\(\w\)*\*\:\:\)*\w\(\w\)*"
hi def link    tremorModuleName   Function
syntax match   tremorFuncName     "\(\(\w\(\w\)*\:\:\)\)?\w\(\w\)*("he=e-1,me=e-1
hi def link    tremorFuncName     Function
syntax match   tremorExtrName     "\w\(\w\)*|"he=e-1,me=e-1
hi def link    tremorExtrName     Function

syn keyword tremorCommentTodo     TODO contained
hi def link tremorCommentTodo     Todo
syn keyword tremorCommentBug      BUG contained
hi def link tremorCommentBug      Todo
syn keyword tremorCommentNote     NOTE contained
hi def link tremorCommentNote     Underlined
syn cluster tremorCommentSpecial  contains=tremorCommentTodo,tremorCommentBug,tremorCommentNote

syn match   tremorComment         @#.*$@ contains=@tremorCommentSpecial
hi def link tremorComment         Comment

syn match   tremorCommentX        @/\ze/.*$@ contained transparent
hi def link tremorTestX           String
hi def link tremorStringX         String
hi def link tremorDocumentStringX String

syn cluster tremorExpression      contains=tremor.*

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = 'tremor_common'
