/**

 * @author Jonathan Beard
 * @version Last Modified 18 January 2013
 */
%{
#include <cstdio>
#include <string>
#include "x_scanner.hpp"
#include "Data.hpp"

typedef APParse::X_Parser::token token;


#define PUSHTOSTREAM( x ) data.parsestream() << yytext; \
                          data.set_current_line( yylineno );

#define TOKEN( x ) data.parsestream() << yytext; \
                   data.set_current_line( yylineno ); \
                   yylval->s_val = new std::string( yytext ); \
                   return( token::x )

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
                    data.reset_parse_stream(); 
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
"<"			      { TOKEN(LANGLE); }
">"			      { TOKEN(RANGLE); }
"["			      { TOKEN(LBRACK); }
"]"			      { TOKEN(RBRACK); }
"("			      { TOKEN(LPAREN); }
")"			      { TOKEN(RPAREN); }
"{"			      { TOKEN(LBRACE); }
"}"			      { TOKEN(RBRACE); }
":"			      { TOKEN(COLON);  }
";"			      { TOKEN(SEMI);   }
"."			      { TOKEN(DOT);    }
","			      { TOKEN(COMMA);  }
"*"			      { TOKEN(STAR);   }
"="			      { TOKEN(EQUALS); }
"->"		         { TOKEN(RARROW); }
"=<"		         { TOKEN(SPLIT);  }
">="		         { TOKEN(MERGE);  }
"is"		         { TOKEN(IS);     }
"at"              { TOKEN(AT);     }
"measure"         { TOKEN(MSRESYM); }
"array"           { TOKEN(ARRAY_TOKEN);	}
"block"	         { TOKEN(BLOCK_TOKEN);	}
"misc"	         { TOKEN(MISC_TOKEN);		}
"constant"        { TOKEN(CONST_TOKEN);	}
"config"		      { TOKEN(CONFIG_TOKEN);	}
"resource"	      { TOKEN(RES_TOKEN);	}
"impl"		      { TOKEN(IMPL_TOKEN);	}
"input"		      { TOKEN(INPUT_TOKEN);	}
"output"		      { TOKEN(OUTPUT_TOKEN);	}
"linktype" 	      { TOKEN(LINKTYPE_TOKEN);	}
"platform"	      { TOKEN(PLATFORM_TOKEN);	}
"use"			      { TOKEN(USE_TOKEN);	}
"map"			      { TOKEN(MAP_TOKEN);	}
"typedef"	      { TOKEN(TYPEDEF_TOKEN);	}
"knob"		      { TOKEN(KNOB_TOKEN);	}

SIGNED8|SIGNED16|SIGNED32|SIGNED64  {
                                       /* yylval->s_val = STOKEN( yytext ); */
                                       TOKEN( BASICTYPE_TOKEN );
                                    }

UNSIGNED8|UNSIGNED16|UNSIGNED32|UNSIGNED64   {
                                            /* yylval->s_val = STOKEN( yytext );*/
                                                TOKEN( BASICTYPE_TOKEN );
                                             }

FLOAT32|FLOAT64|FLOAT96        {
                                    /* yylval->s_val = STOKEN( yytext ); */
                                    TOKEN( BASICTYPE_TOKEN );
                               }

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
