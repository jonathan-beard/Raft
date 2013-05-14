#ifndef _XSCANNER_HPP_
#define _XSCANNER_HPP_

#if ! defined( yyFlexLexerOnce )
#include <FlexLexer.h>
#endif

#undef YY_DECL
#define YY_DECL int APParse::X_Scanner::yylex()


#include "x_parser.tab.hh"
#include "Data.hpp"

namespace APParse{

class X_Scanner : public yyFlexLexer{
public:
   X_Scanner( std::istream *in, Data &d) : yyFlexLexer( in ),
                                           yylval( nullptr ),
                                           data( d ){};
   int yylex( APParse::X_Parser::semantic_type *lval )
   {
      yylval = lval;
      return( yylex() );
   }
private:
   int yylex();
   APParse::X_Parser::semantic_type *yylval;
   Data &data;
};

} /* end namespace APParse */

#endif /* END _XSCANNER_HPP_ */
