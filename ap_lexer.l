/**
 * ap_lexer.l - lexer for AutoPipe version 3
 * @version 3.0b1
 * @author Jonathan Beard
 * @contact jbeard@wustl.edu
 */
%{

#include <cstdio>
#include <string>

#include "AP_Scanner.hpp"
#include "AP_Data.hpp"

typedef AP::AP_Parser::token token;

#define PUSHTOSTREAM( x ) data.get_ap_parsestream() << yytext; \
                          data.set_current_line( yylineno );
                   
//yylval->sval = new std::string( yytext ); 

#define TOKEN( x ) data.get_ap_parsestream() << yytext; \
                   data.set_current_line( yylineno ); \
                   std::cerr << yytext << "\n"; \
                   return( token::x )

#define STOKEN( x ) ( new std::string( x ) )

/* define yyterminate as this instead of NULL */
#define yyterminate() return( token::END )

/* msvc2010 requires that we exclude this header file */
#define YY_NO_UNISTD_H

%}

%option debug
%option nodefault
%option yyclass="AP_Scanner"
%option noyywrap
%option c++

D		               [0-9]
EXP		            [e][+-]?{D}+
IDENT		            [A-Za-z\@][A-Za-z0-9_\@]*
WSCHAR		         [ \t\f\v\r]
WHITESPACE	         {WSCHAR}+|({WSCHAR}*\\\n)+{WSCHAR}*
STRING		         \"([^\\\n\"])*\"
DIRECTIVE	         {WSCHAR}*#(.*\\\n)*.*

/* DECLARE RULES */
%x ML_COMMENT 

%%
\n                { 
                    data.reset_ap_parsestream(); 
                    yylineno++;
                  }
^{DIRECTIVE}\n    { PUSHTOSTREAM( yytext ); }
{WHITESPACE}      { PUSHTOSTREAM( yytext ); }

<INITIAL>"/*"     BEGIN( ML_COMMENT );
<ML_COMMENT>{
"*/"              BEGIN( INITIAL ); 
.                 { PUSHTOSTREAM( yytext ); }
}

"//"+[^\n]*            ; //eat line 

"{"                     { TOKEN( LEFTBRACE ); }
"}"                     { TOKEN( RIGHTBRACE ); }
"["                     { TOKEN( LEFTBRACKET ); }
"]"                     { TOKEN( RIGHTBRACKET ); }
"("                     { TOKEN( LPAREN ); }
")"                     { TOKEN( RPAREN ); }
"<"                     { TOKEN( LCARROT ); }
">"                     { TOKEN( RCARROT ); }
":"                     { TOKEN( COLON ); }
";"                     { TOKEN( SEMI ); }
"@"                     { TOKEN( AT ); }
"define"                { TOKEN( DEFINE ); }
"ports"                 { TOKEN( PORTS ); }
"configs"               { TOKEN( CONFIGS ); }
"autogen"               { TOKEN( AUTOGEN ); }
"auto"                  { TOKEN( AUTO ); }
"final"                 { TOKEN( FINAL ); }
"class"                 { TOKEN( CLASS ); }
"system"                { TOKEN( SYSTEM); }
"abstract"              { TOKEN( ABSTRACT ); }
"interface"             { TOKEN( INTERFACE ); }
"overrides"             { TOKEN( OVERRIDES ); }
"implements"            { TOKEN( IMPLEMENTS ); }
"extends"               { TOKEN( EXTENDS ); }
"public"                { TOKEN( PUBLIC ); }
"private"               { TOKEN( PRIVATE ); }
"protected"             { TOKEN( PROTECTED ); }
"return"                { TOKEN( RETURN ); }
"void"                  { TOKEN( VOID ); }
"this"                  { TOKEN( THIS ); }
"for"                   { TOKEN( FOR ); }
"foreach"               { TOKEN( FOREACH ); }
"while"                 { TOKEN( WHILE ); }
"if"                    { TOKEN( IF ); }
"else"                  { TOKEN( ELSE ); }
"null"                  { TOKEN( NILL ); }
"new"                   { TOKEN( NEW ); }
"++"                    { TOKEN( INCREMENT ); }
"--"                    { TOKEN( DECREMENT ); }
"?"                     { TOKEN( QUESTION ); }
"/"                     { TOKEN( FORWARDSLASH ); }
"-"                     { TOKEN( MINUS ); }
"+"                     { TOKEN( PLUS ); }
"=="                    { TOKEN( OP_EQ ); }
"!="                    { TOKEN( OP_NEQ ); }
"<="                    { TOKEN( OP_LEQ ); }
">="                    { TOKEN( OP_GEQ ); }
"!"                     { TOKEN( NOT ); }
"||"                    { TOKEN( OP_LOR ); }
"|"                     { TOKEN( OR ); }
"&&"                    { TOKEN( OP_LOAND ); }
"&"                     { TOKEN( AND ); }
"-="                    { TOKEN( ASS_MINUS ); }
"+="                    { TOKEN( ASS_PLUS ); }
"="                     { TOKEN( EQUALS ); }
"*"                     { TOKEN( OP_MUL ); }
"~"                     { TOKEN( TILDE ); }
[\.]                    { TOKEN( PERIOD ); }
"\^"                    { TOKEN( HAT ); }
","                     { TOKEN( COMMA ); }
"alignof"               { TOKEN( ALIGNOF ); }
"bool"                  { TOKEN( BOOLEAN ); }
"int8_t"                { TOKEN( INT8T ); }
"int16_t"               { TOKEN( INT16T ); }
"int32_t"               { TOKEN( INT32T ); }
"int64_t"               { TOKEN( INT64T ); }
"uint8_t"               { TOKEN( UINT8T ); }
"uint16_t"              { TOKEN( UINT16T ); }
"uint32_t"              { TOKEN( UINT32T ); }
"uint64_t"              { TOKEN( UINT64T ); }
"float32"               { TOKEN( FLOAT32 ); }
"float64"               { TOKEN( FLOAT64 ); }
"float96"               { TOKEN( FLOAT96 ); }
"vector"                { TOKEN( VECTOR ); }
{STRING}                { TOKEN( STRING ); }
"-"?{D}+		            { 
                           //yylval->lli_val = strtoll(yytext, nullptr, 10);
			                  TOKEN(INT_TOKEN);		
                        }

"-"?[0-9]+"."[0-9]*{EXP}?	    { 
                                    //yylval->ld_val = strtold(yytext, 0);
			                           TOKEN(FLOAT_TOKEN);		
                               }

{IDENT}			                { 
			                           TOKEN( IDENTIFIER ); 		
                               }

.                              { PUSHTOSTREAM( yytext ); } /* everything else I forgot */
%%
