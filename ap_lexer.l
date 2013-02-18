/**
 * ap_lexer.l - lexer for AutoPipe version 3
 * @version 3.0b1
 * @author Jonathan Beard
 * @contact jbeard@wustl.edu
 */
%{

#include <cstdio>
#include <string>
#include "ap_scanner.hpp"
#include "AP_Data.hpp"

typedef APParse::AP_Parser::token token;

#define PUSHTOSTREAM( x ) data.parsestream() << yytext; \
                          data.set_current_line( yylineno );

#define TOKEN( x ) data.parsestream() << yytext; \
                   data.set_current_line( yylineno ); \
                   yylval->s_val = new std::string( yytext ); \
                   return( token::x );

#define STOKEN( x ) ( new std::string( x ) )

#define yyterminate() return( token::END )

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
                    data.ResetParseStream(); 
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

"{"
"}"
"("
")"
"define"
"class"

STRING                         {
                                    /* yylval->s_val = STOKEN( yytext ); */
                                    TOKEN( BASICTYPE_TOKEN );
			                      }

"-"?{D}+		                   { 
                                    yylval->lli_val = strtoll(yytext, nullptr, 10);
			                           TOKEN(INT_TOKEN);		
                               }

"-"?[0-9]+"."[0-9]*{EXP}?	    { 
                                    yylval->ld_val = strtold(yytext, 0);
			                           TOKEN(FLOAT_TOKEN);		
                               }

{IDENT}			                { 
                                    /* yylval->s_val = STOKEN( yytext );*/
			                           TOKEN(IDENT_TOKEN); 		
                               }
{STRING}		                   { 
                                    /* yylval->s_val = STOKEN( yytext ); */
			                           TOKEN(STRING_TOKEN);		
                               }

.                              { PUSHTOSTREAM( yytext ); } /* everything else I forgot */
%%
