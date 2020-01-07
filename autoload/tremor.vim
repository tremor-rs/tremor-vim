" Vim autoload file
" Language: Tremor
" Maintainer: The Tremor Team

function tremor#SetCommonTremorOptions()
  " syntax highligting
  set syntax=tremor

  " filetype settings
  runtime! ftplugin/tremor.vim

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
endfunction
