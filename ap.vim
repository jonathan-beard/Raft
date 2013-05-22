" Vim syntax file
" Language: Auto-pipe
" Maintainer: Jonathan Beard
" Latest Revision: 21 May 2013

if exists("b:current_syntax")
   finish
endif

" Keywords
syn keyword AutopipeLanguageKeywords define abstract class @public @private @protected
syn keyword AutopipeLanguageKeywords @ports @configs final system extends implements
syn keyword AutopipeLanguageKeywords overrides autogen 

" highlights
hi def link apTodo   TODO FIXME

" regions
syn region apString start='"' end='"' contained

" Regular int like number with - + or nothing in front
syn match apNumber '\d\+' contained display
syn match apNumber '[-+]\d\+' contained display

" Floating point number with decimal no E or e (+,-)
syn match apNumber '\d\+\.\d*' contained display
syn match apNumber '[-+]\d\+\.\d*' contained display

" Floating point like number with E and no decimal point (+,-)
syn match apNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match apNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' contained display

" Floating point like number with E and decimal point (+,-)
syn match apNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
syn match apNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display


