/**
 * AP_Scanner.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:41 2013
 */
#ifndef _AP_SCANNER_HPP_
#define _AP_SCANNER_HPP_  1

#if ! defined( yyFlexLexerOnce )
#include <FlexLexer.h>
#endif

#undef YY_DECL
#define YY_DECL int AP::AP_Scanner::yylex()

#include "ap_parser.tab.hh"
#include "AP_Data.hpp"


namespace AP{

/**
 * AP_Scanner - scanner class that'll be instantiated to 
 * produce a flex scanner.
 */
class AP_Scanner : public yyFlexLexer{
public:
   /**
    * AP_Scanner - default constructor
    * @param   in - std::istream ptr
    * @param   d - AP_Data reference
    */
   AP_Scanner( std::istream *in, AP_Data &d ) : yyFlexLexer( in ),
                                                yylval( nullptr ),
                                                data( d ){};
   /**
    * yylex - this is the one that'll actually be called by Bison
    * @param   lval - AP::AP_Parser::semantic_type ptr
    * @return int
    */
   int yylex( AP::AP_Parser::semantic_type *lval )
   {
      yylval = lval;
      return( yylex() );
   }
private:
   int yylex();
   /* this is the ptr for returning from the scanner */
   AP::AP_Parser::semantic_type *yylval;
   /* AP_Data reference for scanner, used for errors, etc */
   AP_Data &data;
};

} /* end namespace AP */


#endif /* END _AP_SCANNER_HPP_ */
