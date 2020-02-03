" Vim syntax file
" Language: Tremor
" Maintainer: The Tremor Team

if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

syn match   trickleErrSymbol       /[@'^&\\#?]/
hi def link trickleErrSymbol       Error

syn match   trickleErrNumeric      /__\+/ contained
hi def link trickleErrNumeric      Error

syn match   trickleBracket         /[{[()\]}]/

" keywords common to all trickle languages
" grouping as special so that we have different color for these from other keywords
syn keyword trickleKwSpecial       event
hi def link trickleKwSpecial       Special

syn keyword trickleScriptKwSpecial emit drop
hi def link trickleScriptKwSpecial Type
syn keyword trickleScriptKwControl const let
                                \ for
                                \ match of case when default end
                                \ patch insert upsert update erase move copy merge
hi def link trickleScriptKwControl Keyword

syn keyword trickleQueryKwSpecial  select create define
hi def link trickleQueryKwSpecial  Type
syn keyword trickleQueryKwControl  operator script
                                \ from into with
                                \ group by args window stream tumbling sliding where having
                                \ set each
hi def link trickleQueryKwControl  Keyword

syn keyword trickleNull            null
hi def link trickleNull            Constant

syn keyword trickleBoolean         true false
hi def link trickleBoolean         Boolean

syn match trickleInteger           /\v%(\d+_*)+/ contains=trickleErrNumeric
hi def link trickleInteger         Number

syn match   trickleFloat           /\v%(\d+_*)+[eE][-+]?%(\d+_*)+/ contains=trickleErrNumeric
syn match   trickleFloat           /\v%(\d+_*)+\.%(\d+_*)+%([eE][-+]?%(\d+_*)+)?/ contains=trickleErrNumeric
hi def link trickleFloat           Float

syn cluster trickleKeyword         contains=trickleScriptKw.*,trickleQueryKw.*,trickleBoolean
syn cluster trickleComments        contains=trickleComment

syn match   trickleErrEscape       /\\\_.\?\_s*/ contained
hi def link trickleErrEscape       Error
syn match   trickleEscapeSQuote    /\\'/ contained
hi def link trickleEscapeSQuote    SpecialChar
syn match   trickleEscapeDQuote    /\\"/ contained
hi def link trickleEscapeDQuote    SpecialChar
syn match   trickleEscape          /\\[abefnrtv\\0]/ contained
syn match   trickleEscape          /\v\\x\x{2}/ contained
syn match   trickleEscape          /\v\\u\x{4}/ contained
syn match   trickleEscape          /\v\\U\x{6}/ contained
hi def link trickleEscape          SpecialChar

syn region  trickleInterpolation   contained matchgroup=trickleBracket start=/{/ end=/}/ contains=@trickleExpression

syn region  trickleString          matchgroup=trickleStringX start=/"/ skip=/\\./ end=/"/ contains=trickleInterpolation,trickleEscapeDQuote,trickleEscape,trickleErrEscape
hi def link trickleString          String
syn region  trickleDocumentString  matchgroup=trickleDocumentStringX start=/"\ze""/ end=/"""*\zs"/
hi def link trickleDocumentString  String

syn region  trickleTest            matchgroup=trickleTestX start=/|/ skip=/\\./ end=/|/ contains=trickleEscape,trickleErrEscape
hi def link trickleTest            String

syntax match   trickleOperator     "\([-!#$%`&\*\+./<=>@^|~:]\|\<\>\)"
hi def link    trickleOperator     Operator

syn keyword trickleOperatorWords   and or xor not present absent
hi def link trickleOperatorWords   Operator

syntax match   trickleModuleName   "\w\(\w\)*\:\:"
hi def link    trickleModuleName   Function
syntax match   trickleFuncName     "\w\(\w\)*("he=e-1,me=e-1
hi def link    trickleFuncName     Function
syntax match   trickleExtrName     "\w\(\w\)*|"he=e-1,me=e-1
hi def link    trickleExtrName     Function

syn keyword trickleCommentTodo     TODO contained
hi def link trickleCommentTodo     Todo
syn keyword trickleCommentBug      BUG contained
hi def link trickleCommentBug      Todo
syn keyword trickleCommentNote     NOTE contained
hi def link trickleCommentNote     Underlined
syn cluster trickleCommentSpecial  contains=trickleCommentTodo,trickleCommentBug,trickleCommentNote

syn match   trickleComment         @#.*$@ contains=@trickleCommentSpecial
hi def link trickleComment         Comment

syn match   trickleCommentX        @/\ze/.*$@ contained transparent
hi def link trickleTestX           String
hi def link trickleStringX         String
hi def link trickleDocumentStringX String

syn cluster trickleExpression      contains=trickle.*

let &cpo = s:cpo_save
unlet s:cpo_save
let b:current_syntax = 'trickle'
