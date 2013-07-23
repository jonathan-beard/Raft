/**
 * raft_lexer.l - lexer for Raft
 * @version 3.0b1
 * @author Jonathan Beard
 * @contact jbeard@wustl.edu
 */
%{

#include <cstdlib>
#include <cstdio>
#include <string>
#include <cstring>
#include <cassert>
#include <cinttypes>

#include "raft_scanner.hpp"
#include "data.hpp"
#include "cpp_output_handler.hpp"

typedef Raft::Parser::token token;

#define PUSHTOSTREAM( x )  data.get_rf_parsestream() << yytext;


#define TOKEN( x ) \
                   data.get_rf_parsestream() << yytext; \
                   return( token::x )

#define STOKEN( x ) yylval->sval = new std::string( yytext ); \
                    data.get_rf_parsestream() << yytext; \
                    return( token::x )

/* define yyterminate as this instead of NULL */
#define yyterminate() return( token::END )

/* msvc2010 requires that we exclude this header file */
#define YY_NO_UNISTD_H

%}

%option debug
%option nodefault
%option yyclass="Scanner"
%option noyywrap
%option c++

D		               [0-9]
EXP		            [e][+-]?{D}+
IDENT		            [A-Za-z][A-Za-z0-9_]*
WSCHAR		         [ \t\f\v\r]
WHITESPACE	         {WSCHAR}+|({WSCHAR}*\\\n)+{WSCHAR}*
STRING		         \".*\"
DIRECTIVE	         {WSCHAR}*#(.*\\\n)*.*

/* DECLARE RULES */
%x ML_COMMENT 

%%
"$"                 {   TOKEN( DOLLAR ); }
"@"                 {   TOKEN( AT ); }
"#"                 {  
                        TOKEN( POUND ); }
"\n"                { 
                        data.reset_rf_parsestream(); 
                        data.get_cpp_handler().IncrementHead();
                    }
{WHITESPACE}      { PUSHTOSTREAM( yytext ); }

<INITIAL>"/*"     BEGIN( ML_COMMENT );
<ML_COMMENT>{
"*/"              BEGIN( INITIAL ); 
.                 { PUSHTOSTREAM( yytext ); }
}

"//".+[^\n]*             {
                           data.reset_rf_parsestream();
                         }
"{"                     { TOKEN( LBRACE ); }
"}"                     { TOKEN( RBRACE ); }
"["                     { TOKEN( LBRACKET ); }
"]"                     { TOKEN( RBRACKET ); }
"("                     { TOKEN( LPAREN ); }
")"                     { TOKEN( RPAREN ); }
"<"                     { TOKEN( LCARROT ); }
">"                     { TOKEN( RCARROT ); }
":"                     { TOKEN( COLON ); }
";"                     { TOKEN( SEMI ); }
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
"@public:"              { TOKEN( ATPUBLIC ); }
"@private:"               { TOKEN( ATPRIVATE ); }
"@protected:"             { TOKEN( ATPROTECTED ); }
"@ports:"                 { TOKEN( ATPORTS ); }
"return"                { TOKEN( RETURN ); }
"void"                  { TOKEN( VOID ); }
"this"                  { TOKEN( THIS ); }
"super"                 { TOKEN( SUPER ); }
"for"                   { TOKEN( FOR ); }
"foreach"               { TOKEN( FOREACH ); }
"while"                 { TOKEN( WHILE ); }
"if"                    { TOKEN( IF ); }
"else"                  { TOKEN( ELSE ); }
"null"                  { TOKEN( NILL ); }
"alloc"                   { TOKEN( ALLOC ); }
"new"                   { TOKEN( NEW ); } 
"const"                 { TOKEN( CONST ); }
"static"                { TOKEN( STATIC ); }
"atomic"                { TOKEN( ATOMIC ); }
"nonatomic"             { TOKEN( NONATOMIC ); } 
"struct"                { TOKEN( STRUCT ); }
"free"                  { TOKEN( FREE ); }
"++"                    { TOKEN( INCREMENT ); }
"--"                    { TOKEN( DECREMENT ); }
"?"                     { TOKEN( QUESTION ); }
"/"                     { TOKEN( FORWARDSLASH ); }
"-"                     { TOKEN( MINUS ); }
"+"                     { TOKEN( PLUS ); }
"=="                    { TOKEN( OP_EQ ); }
"!="                    { TOKEN( OP_NE ); }
"<="                    { TOKEN( OP_LE ); }
">="                    { TOKEN( OP_GE ); }
"!"                     { TOKEN( BANG ); }
"%"                     { TOKEN( PERCENT ); }
"||"                    { TOKEN( OP_LOR ); }
"|"                     { TOKEN( OR ); }
"&&"                    { TOKEN( OP_LAND ); }
"&"                     { TOKEN( AND ); }
"-="                    { TOKEN( ASS_MINUS ); }
"+="                    { TOKEN( ASS_PLUS ); }
"="                     { TOKEN( EQUALS ); }
"*"                     { TOKEN( ASTERICK ); }
"~"                     { TOKEN( TILDE ); }
[\.]                    { TOKEN( PERIOD ); }
"\^"                    { TOKEN( HAT ); }
","                     { TOKEN( COMMA ); }
"bool"                  { TOKEN( BOOLEAN ); }
"true"                  { TOKEN( TRUE ); }
"false"                 { TOKEN( FALSE ); }
"int8"                { TOKEN( INT8T ); }
"int16"               { TOKEN( INT16T ); }
"int32"               { TOKEN( INT32T ); }
"int64"               { TOKEN( INT64T ); }
"uint8"               { TOKEN( UINT8T ); }
"uint16"              { TOKEN( UINT16T ); }
"uint32"              { TOKEN( UINT32T ); }
"uint64"              { TOKEN( UINT64T ); }
"float32"               { TOKEN( FLOAT32 ); }
"float64"               { TOKEN( FLOAT64 ); }
"float96"               { TOKEN( FLOAT96 ); }
"String"                { TOKEN( STRING ); }
{STRING}                { STOKEN( STR_TOKEN ); }
"-"?{D}+{EXP}?          { 
                           char *buffer(nullptr);
                           buffer = (char*) alloca( sizeof(char) );
                           assert( buffer != nullptr );
                           buffer[0] = '\0';
                           errno = EXIT_SUCCESS;
                           yylval->uint_val = 
                              strtoumax(yytext, &buffer, 10);
                           assert( buffer[0] == '\0' );
			                  assert( errno == 0 );
                           TOKEN(INT_TOKEN);		
                        }
0[xX][0-9a-fA-F]+          {
                           char *buffer(nullptr);
                           buffer = (char*) alloca( sizeof(char) );
                           assert( buffer != nullptr );
                           buffer[0] = '\0';
                           errno = EXIT_SUCCESS;
                           yylval->uint_val = 
                              strtoumax(yytext, &buffer, 16);
                           assert( buffer[0] == '\0' );
			                  assert( errno == 0 );
                           TOKEN(INT_TOKEN);		
                        }
O[0-7]+          {
                           char *buffer(nullptr);
                           buffer = (char*) alloca( sizeof(char) );
                           assert( buffer != nullptr );
                           buffer[0] = '\0';
                           errno = EXIT_SUCCESS;
                           yylval->uint_val = 
                              strtoumax(yytext, &buffer, 8);
                           assert( buffer[0] == '\0' );
			                  assert( errno == 0 );
                           TOKEN(INT_TOKEN);		
                  }
"-"?[0-9]+"."[0-9]*{EXP}?	    { 
                                    char *buffer( nullptr );
                                    buffer = (char*) alloca( 
                                                   sizeof(char) );
                                    assert( buffer != nullptr );
                                    buffer[0] = '\0';
                                    errno = EXIT_SUCCESS;
                                    yylval->dval = strtold( yytext, 
                                                            &buffer );
                                    assert( buffer[0] == '\0' );
                                    assert( errno == 0 );
			                           TOKEN(FLOAT_TOKEN);		
                               }

{IDENT}			                { 
			                          STOKEN( IDENTIFIER ); 		
                               }

.                              { PUSHTOSTREAM( yytext ); } 
%%