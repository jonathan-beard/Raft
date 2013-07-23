/**
 * Scanner.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:41 2013
 */
#ifndef _SCANNER_HPP_
#define _SCANNER_HPP_  1

#if ! defined( yyFlexLexerOnce )
#include <FlexLexer.h>
#endif

#undef YY_DECL
#define YY_DECL int Raft::Scanner::yylex()

#include "raft_parser.tab.hh"
#include "data.hpp"


namespace Raft{

/**
 * Scanner - scanner class that'll be instantiated to 
 * produce a flex scanner.
 */
class Scanner : public yyFlexLexer{
public:
   /**
    * Scanner - default constructor
    * @param   in - std::istream ptr
    * @param   d - Data reference
    */
   Scanner( std::istream *in, Data &d ) : yyFlexLexer( in ),
                                          yylval( nullptr ),
                                          data( d ){};
   /**
    * yylex - this is the one that'll actually be called by Bison
    * @param   lval - Raft::Parser::semantic_type ptr
    * @return int
    */
   int yylex( Raft::Parser::semantic_type *lval )
   {
      yylval = lval;
      return( yylex() );
   }
private:
   int yylex();
   /* this is the ptr for returning from the scanner */
   Raft::Parser::semantic_type *yylval;
   /* Data reference for scanner, used for errors, etc */
   Data &data;
};

} /* end namespace Raft */


#endif /* END _SCANNER_HPP_ */
