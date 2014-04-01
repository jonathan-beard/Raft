" Vim syntax file " Language:	  Raft
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/raft.vim
" Last Change:	2010 March 23

" Please check :help raft.vim for comments on some of the options available.

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='raft'
  syn region raftFold start="{" end="}" transparent fold
endif

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ RaftHiLink hi link <args>
else
  command! -nargs=+ RaftHiLink hi def link <args>
endif

" some characters that cannot be in a raft program (outside a string)
syn match raftError "[`]"
syn match raftError "<<<\|\.\.\|=>\|<>\|||=\|&&=\|[^-]->\|\*\/"
syn match raftOK "\.\.\."

" use separate name so that it can be deleted in raftcc.vim
RaftHiLink raftError2 raftError



" keyword definitions
syn keyword raftExternal	native package
syn match raftExternal		"#include"
syn keyword raftError		goto
syn keyword raftConditional	if else switch
syn keyword raftRepeat		while for do
syn match   raftRepeat     "@/"
syn keyword raftBoolean		true false
syn keyword raftConstant	null
syn match raftConstant          "\$" 
" syn match raftConstant          '\#'
syn keyword raftTypedef		this super
syn keyword raftOperator	new alloc free
syn keyword raftConditional     onsignal
syn keyword raftType		bool int8 int16 int32 int64 uint8 uint16 uint32 uint64 float32 float64 float96 String atomic nonatomic auto const struct
syn keyword raftType		void
syn keyword raftStatement	return
syn keyword raftStorageClass	static synchronized transient volatile final
syn keyword raftExceptions	throw try catch finally
syn keyword raftAssert		assert
syn keyword raftClassDecl	extends implements interface elof
" to differentiate the keyword class from MyClass.class we use a match here
syn match   raftTypedef		"\.\s*\<class\>"ms=s+1
syn keyword raftClassDecl	enum
syn match   raftClassDecl	"^class\>"
syn match   raftClassDecl	"[^.]\s*\<class\>"ms=s+1
syn match   raftAnnotation	"@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>"
syn match   raftClassDecl	"@interface\>"
syn keyword raftBranch		break continue nextgroup=raftUserLabelRef skipwhite
syn match   raftUserLabelRef	"\k\+" contained
syn match   raftVarArg		"\.\.\."
syn keyword raftScopeDecl	@ports @public @protected @private @configs 
syn keyword raftAnnotation overrides implements streams
if exists("raft_highlight_raft_lang_ids")
  let raft_highlight_all=1
endif
if exists("raft_highlight_all")  || exists("raft_highlight_raft")  || exists("raft_highlight_raft_lang") 
  " raft.lang.*
  syn match raftLangClass "\<System\>"
  syn keyword raftR_RaftLang NegativeArraySizeException ArrayStoreException IllegalStateException RuntimeException IndexOutOfBoundsException UnsupportedOperationException ArrayIndexOutOfBoundsException ArithmeticException ClassCastException EnumConstantNotPresentException StringIndexOutOfBoundsException IllegalArgumentException IllegalMonitorStateException IllegalThreadStateException NumberFormatException NullPointerException TypeNotPresentException SecurityException
  syn cluster raftTop add=raftR_RaftLang
  syn cluster raftClasses add=raftR_RaftLang
  RaftHiLink raftR_RaftLang raftR_Raft
  syn keyword raftC_RaftLang Process RuntimePermission StringKeySet CharacterData01 Class ThreadLocal ThreadLocalMap CharacterData0E Package Character StringCoding Long ProcessImpl ProcessEnvironment Short AssertionStatusDirectives 1PackageInfoProxy UnicodeBlock InheritableThreadLocal AbstractStringBuilder StringEnvironment ClassLoader ConditionalSpecialCasing CharacterDataPrivateUse StringBuffer StringDecoder Entry StringEntry WrappedHook StringBuilder StrictMath State ThreadGroup Runtime CharacterData02 MethodArray Object CharacterDataUndefined Integer Gate Boolean Enum Variable Subset StringEncoder Void Terminator CharsetSD IntegerCache CharacterCache Byte CharsetSE Thread SystemClassLoaderAction CharacterDataLatin1 StringValues StackTraceElement Shutdown ShortCache String ConverterSD ByteCache Lock EnclosingMethodInfo Math Float Value Double SecurityManager LongCache ProcessBuilder StringEntrySet Compiler Number UNIXProcess ConverterSE ExternalData CaseInsensitiveComparator CharacterData00 NativeLibrary
  syn cluster raftTop add=raftC_RaftLang
  syn cluster raftClasses add=raftC_RaftLang
  RaftHiLink raftC_RaftLang raftC_Raft
  syn keyword raftE_RaftLang IncompatibleClassChangeError InternalError UnknownError ClassCircularityError AssertionError ThreadDeath IllegalAccessError NoClassDefFoundError ClassFormatError UnsupportedClassVersionError NoSuchFieldError VerifyError ExceptionInInitializerError InstantiationError LinkageError NoSuchMethodError Error UnsatisfiedLinkError StackOverflowError AbstractMethodError VirtualMachineError OutOfMemoryError
  syn cluster raftTop add=raftE_RaftLang
  syn cluster raftClasses add=raftE_RaftLang
  RaftHiLink raftE_RaftLang raftE_Raft
  syn keyword raftX_RaftLang CloneNotSupportedException Exception NoSuchMethodException IllegalAccessException NoSuchFieldException Throwable InterruptedException ClassNotFoundException InstantiationException
  syn cluster raftTop add=raftX_RaftLang
  syn cluster raftClasses add=raftX_RaftLang
  RaftHiLink raftX_RaftLang raftX_Raft

  RaftHiLink raftR_Raft raftR_
  RaftHiLink raftC_Raft raftC_
  RaftHiLink raftE_Raft raftE_
  RaftHiLink raftX_Raft raftX_
  RaftHiLink raftX_		     raftExceptions
  RaftHiLink raftR_		     raftExceptions
  RaftHiLink raftE_		     raftExceptions
  RaftHiLink raftC_		     raftConstant

  syn keyword raftLangObject clone equals finalize getClass hashCode
  syn keyword raftLangObject notify notifyAll toString wait
  RaftHiLink raftLangObject		     raftConstant
  syn cluster raftTop add=raftLangObject
endif

if filereadable(expand("<sfile>:p:h")."/raftid.vim")
  source <sfile>:p:h/raftid.vim
endif

if exists("raft_space_errors")
  if !exists("raft_no_trail_space_error")
    syn match	raftSpaceError	"\s\+$"
  endif
  if !exists("raft_no_tab_space_error")
    syn match	raftSpaceError	" \+\t"me=e-1
  endif
endif

syn region  raftLabelRegion	transparent matchgroup=raftLabel start="\<case\>" matchgroup=NONE end=":" contains=raftNumber,raftCharacter
syn match   raftUserLabel	"^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=raftLabel
syn keyword raftLabel		default

if !exists("raft_allow_cpp_keywords")
  syn keyword raftError extern friend inline redeclared
  syn keyword raftError register signed template typedef union
  syn keyword raftError unsigned operator
endif

" The following cluster contains all raft groups except the contained ones
syn cluster raftTop add=raftExternal,raftError,raftError,raftBranch,raftLabelRegion,raftLabel,raftConditional,raftRepeat,raftBoolean,raftConstant,raftTypedef,raftOperator,raftType,raftType,raftStatement,raftStorageClass,raftAssert,raftExceptions,raftMethodDecl,raftClassDecl,raftClassDecl,raftClassDecl,raftScopeDecl,raftError,raftError2,raftUserLabel,raftLangObject,raftAnnotation,raftVarArg


" Comments
syn keyword raftTodo		 contained TODO FIXME XXX
if exists("raft_comment_strings")
  syn region  raftCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=raftSpecial,raftCommentStar,raftSpecialChar,@Spell
  syn region  raftComment2String   contained start=+"+	end=+$\|"+  contains=raftSpecial,raftSpecialChar,@Spell
  syn match   raftCommentCharacter contained "'\\[^']\{1,6\}'" contains=raftSpecialChar
  syn match   raftCommentCharacter contained "'\\''" contains=raftSpecialChar
  syn match   raftCommentCharacter contained "'[^\\]'"
  syn cluster raftCommentSpecial add=raftCommentString,raftCommentCharacter,raftNumber
  syn cluster raftCommentSpecial2 add=raftComment2String,raftCommentCharacter,raftNumber
endif
syn region  raftComment		 start="/\*"  end="\*/" contains=@raftCommentSpecial,raftTodo,@Spell
syn match   raftCommentStar	 contained "^\s*\*[^/]"me=e-1
syn match   raftCommentStar	 contained "^\s*\*$"
syn match   raftLineComment	 "//.*" contains=@raftCommentSpecial2,raftTodo,@Spell
RaftHiLink raftCommentString raftString
RaftHiLink raftComment2String raftString
RaftHiLink raftCommentCharacter raftCharacter

syn cluster raftTop add=raftComment,raftLineComment

if !exists("raft_ignore_raftdoc") && main_syntax != 'jsp'
  syntax case ignore
  " syntax coloring for raftdoc comments (HTML)
  " syntax include @raftHtml <sfile>:p:h/html.vim
  " unlet b:current_syntax
  " HTML enables spell checking for all text that is not in a syntax item. This
  " is wrong for Raft (all identifiers would be spell-checked), so it's undone
  " here.
  syntax spell default

  syn region  raftDocComment	start="/\*\*"  end="\*/" keepend contains=raftCommentTitle,@raftHtml,raftDocTags,raftDocSeeTag,raftTodo,@Spell
  syn region  raftCommentTitle	contained matchgroup=raftDocComment start="/\*\*"   matchgroup=raftCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@raftHtml,raftCommentStar,raftTodo,@Spell,raftDocTags,raftDocSeeTag

  syn region raftDocTags	 contained start="{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
  syn match  raftDocTags	 contained "@\(param\|exception\|throws\|since\)\s\+\S\+" contains=raftDocParam
  syn match  raftDocParam	 contained "\s\S\+"
  syn match  raftDocTags	 contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
  syn region raftDocSeeTag	 contained matchgroup=raftDocTags start="@see\s\+" matchgroup=NONE end="\_."re=e-1 contains=raftDocSeeTagParam
  syn match  raftDocSeeTagParam  contained @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ extend
  syntax case match
endif

" match the special comment /**/
syn match   raftComment		 "/\*\*/"

" Strings and constants
syn match   raftSpecialError	 contained "\\."
syn match   raftSpecialCharError contained "[^']"
syn match   raftSpecialChar	 contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region  raftString		start=+"+ end=+"+ end=+$+ contains=raftSpecialChar,raftSpecialError,@Spell
" next line disabled, it can cause a crash for a long line
"syn match   raftStringError	  +"\([^"\\]\|\\.\)*$+
syn match   raftCharacter	 "'[^']*'" contains=raftSpecialChar,raftSpecialCharError
syn match   raftCharacter	 "'\\''" contains=raftSpecialChar
syn match   raftCharacter	 "'[^\\]'"
syn match   raftNumber		 "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   raftNumber		 "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   raftNumber		 "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   raftNumber		 "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

" unicode characters
syn match   raftSpecial "\\u\d\{4\}"

syn cluster raftTop add=raftString,raftCharacter,raftNumber,raftSpecial,raftStringError

if exists("raft_highlight_functions")
  if raft_highlight_functions == "indent"
    syn match  raftFuncDef "^\(\t\| \{8\}\)[_$a-zA-Z][_$a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=raftScopeDecl,raftType,raftStorageClass,@raftClasses
    syn region raftFuncDef start=+^\(\t\| \{8\}\)[$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=raftScopeDecl,raftType,raftStorageClass,@raftClasses
    syn match  raftFuncDef "^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=raftScopeDecl,raftType,raftStorageClass,@raftClasses
    syn region raftFuncDef start=+^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=raftScopeDecl,raftType,raftStorageClass,@raftClasses
  else
    " This line catches method declarations at any indentation>0, but it assumes
    " two things:
    "	1. class names are always capitalized (ie: Button)
    "	2. method names are never capitalized (except constructors, of course)
    syn region raftFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|system\|implements\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*([^0-9]+ end=+)+ contains=raftScopeDecl,raftType,raftStorageClass,raftComment,raftLineComment,@raftClasses
  endif
  syn match  raftBraces  "[{}]"
  syn cluster raftTop add=raftFuncDef,raftBraces
endif

if exists("raft_highlight_debug")

  " Strings and constants
  syn match   raftDebugSpecial		contained "\\\d\d\d\|\\."
  syn region  raftDebugString		contained start=+"+  end=+"+  contains=raftDebugSpecial
  syn match   raftDebugStringError	+"\([^"\\]\|\\.\)*$+
  syn match   raftDebugCharacter	contained "'[^\\]'"
  syn match   raftDebugSpecialCharacter contained "'\\.'"
  syn match   raftDebugSpecialCharacter contained "'\\''"
  syn match   raftDebugNumber		contained "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
  syn match   raftDebugNumber		contained "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
  syn match   raftDebugNumber		contained "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
  syn match   raftDebugNumber		contained "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
  syn keyword raftDebugBoolean		contained true false
  syn keyword raftDebugType		contained null this super
  syn region raftDebugParen  start=+(+ end=+)+ contained contains=raftDebug.*,raftDebugParen

  " to make this work you must define the highlighting for these groups
  syn match raftDebug "\<System\.\(out\|err\)\.print\(ln\)*\s*("me=e-1 contains=raftDebug.* nextgroup=raftDebugParen
  syn match raftDebug "\<p\s*("me=e-1 contains=raftDebug.* nextgroup=raftDebugParen
  syn match raftDebug "[A-Za-z][a-zA-Z0-9_]*\.printStackTrace\s*("me=e-1 contains=raftDebug.* nextgroup=raftDebugParen
  syn match raftDebug "\<trace[SL]\=\s*("me=e-1 contains=raftDebug.* nextgroup=raftDebugParen

  syn cluster raftTop add=raftDebug

  if version >= 508 || !exists("did_c_syn_inits")
    RaftHiLink raftDebug		 Debug
    RaftHiLink raftDebugString		 DebugString
    RaftHiLink raftDebugStringError	 raftError
    RaftHiLink raftDebugType		 DebugType
    RaftHiLink raftDebugBoolean		 DebugBoolean
    RaftHiLink raftDebugNumber		 Debug
    RaftHiLink raftDebugSpecial		 DebugSpecial
    RaftHiLink raftDebugSpecialCharacter DebugSpecial
    RaftHiLink raftDebugCharacter	 DebugString
    RaftHiLink raftDebugParen		 Debug

    RaftHiLink DebugString		 String
    RaftHiLink DebugSpecial		 Special
    RaftHiLink DebugBoolean		 Boolean
    RaftHiLink DebugType		 Type
  endif
endif

if exists("raft_mark_braces_in_parens_as_errors")
  syn match raftInParen		 contained "[{}]"
  RaftHiLink raftInParen	raftError
  syn cluster raftTop add=raftInParen
endif

" catch errors caused by wrong parenthesis
syn region  raftParenT	transparent matchgroup=raftParen  start="("  end=")" contains=@raftTop,raftParenT1
syn region  raftParenT1 transparent matchgroup=raftParen1 start="(" end=")" contains=@raftTop,raftParenT2 contained
syn region  raftParenT2 transparent matchgroup=raftParen2 start="(" end=")" contains=@raftTop,raftParenT  contained
syn match   raftParenError	 ")"
" catch errors caused by wrong square parenthesis
syn region  raftParenT	transparent matchgroup=raftParen  start="\["  end="\]" contains=@raftTop,raftParenT1
syn region  raftParenT1 transparent matchgroup=raftParen1 start="\[" end="\]" contains=@raftTop,raftParenT2 contained
syn region  raftParenT2 transparent matchgroup=raftParen2 start="\[" end="\]" contains=@raftTop,raftParenT  contained
syn match   raftParenError	 "\]"

RaftHiLink raftParenError	raftError

if !exists("raft_minlines")
  let raft_minlines = 10
endif
exec "syn sync ccomment raftComment minlines=" . raft_minlines

" The default highlighting.
if version >= 508 || !exists("did_raft_syn_inits")
  if version < 508
    let did_raft_syn_inits = 1
  endif
  RaftHiLink raftFuncDef		Function
  RaftHiLink raftVarArg			Function
  RaftHiLink raftBraces			Function
  RaftHiLink raftBranch			Conditional
  RaftHiLink raftUserLabelRef		raftUserLabel
  RaftHiLink raftLabel			Label
  RaftHiLink raftUserLabel		Label
  RaftHiLink raftConditional		Conditional
  RaftHiLink raftRepeat			Repeat
  RaftHiLink raftExceptions		Exception
  RaftHiLink raftAssert			Statement
  RaftHiLink raftStorageClass		StorageClass
  RaftHiLink raftMethodDecl		raftStorageClass
  RaftHiLink raftClassDecl		raftStorageClass
  RaftHiLink raftScopeDecl		raftStorageClass
  RaftHiLink raftBoolean		Boolean
  RaftHiLink raftSpecial		Special
  RaftHiLink raftSpecialError		Error
  RaftHiLink raftSpecialCharError	Error
  RaftHiLink raftString			String
  RaftHiLink raftCharacter		Character
  RaftHiLink raftSpecialChar		SpecialChar
  RaftHiLink raftNumber			Number
  RaftHiLink raftError			Error
  RaftHiLink raftStringError		Error
  RaftHiLink raftStatement		Statement
  RaftHiLink raftOperator		Operator
  RaftHiLink raftComment		Comment
  RaftHiLink raftDocComment		Comment
  RaftHiLink raftLineComment		Comment
  RaftHiLink raftConstant		Constant
  RaftHiLink raftTypedef		Typedef
  RaftHiLink raftTodo			Todo
  RaftHiLink raftAnnotation		PreProc

  RaftHiLink raftCommentTitle		SpecialComment
  RaftHiLink raftDocTags		Special
  RaftHiLink raftDocParam		Function
  RaftHiLink raftDocSeeTagParam		Function
  RaftHiLink raftCommentStar		raftComment

  RaftHiLink raftType			Type
  RaftHiLink raftExternal		Include

  RaftHiLink htmlComment		Special
  RaftHiLink htmlCommentPart		Special
  RaftHiLink raftSpaceError		Error
endif

delcommand RaftHiLink

let b:current_syntax = "raft"

if main_syntax == 'raft'
  unlet main_syntax
endif

let b:spell_options="contained"

" vim: ts=8
