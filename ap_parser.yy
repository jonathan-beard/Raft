%skeleton "lalr1.cc"
%require  "2.5"
%debug
%defines
%define   namespace           "AP"
%define   parser_class_name   "AP_Parser"

/* pre-declare classes that are needed for the parser here */
%code requires{

   namespace Node{
      class NodeAbstract;
   }

   namespace AP {
      class AP_Driver;
      class AP_Scanner;
      class AP_Data;
   }
}

/* params for yylex */
%lex-param     { AP_Scanner &scanner }
%parse-param   { AP_Scanner &scanner }

%lex-param     { AP_Driver  &driver  }
%parse-param   { AP_Driver  &driver  }

%lex-param     { AP_Data    &data    }
%parse-param   { AP_Data    &data    }

%code{
   #include <iostream>
   #include <cstdlib>
   #include <fstream>
   #include "NodeAbstract.hpp"


   /* include for all driver functions */
   #include "ap_driver.hpp"
   #include "ap_data.hpp"

   /* define proper yylex */
   static int yylex(AP::AP_Parser::semantic_type *yylval,
                    AP::AP_Scanner               &scanner,
                    AP::AP_Driver                &driver,
                    AP::AP_Data                  &data );
}

/* token types */
%union{
   std::string        *sval;
   long long int       lval;
   long double         dval;
   Node::NodeAbstract *node_val;
}

%token       END     0     "end of file"
%token       LBRACE  
%token       RBRACE  
%token       LBRACKET  
%token       RBRACKET  
%token       LPAREN  
%token       RPAREN  
%token       LCARROT  
%token       RCARROT  
%token       COLON  
%token       SEMI  
%token       AT  
%token       DEFINE  
%token       PORTS  
%token       CONFIGS  
%token       AUTOGEN  
%token       AUTO  
%token       FINAL  
%token       CLASS  
%token       SYSTEM 
%token       ABSTRACT  
%token       INTERFACE  
%token       OVERRIDES  
%token       IMPLEMENTS  
%token       EXTENDS  
%token       PUBLIC  
%token       PRIVATE  
%token       PROTECTED  
%token       RETURN  
%token       VOID  
%token       THIS  
%token       FOR  
%token       FOREACH  
%token       WHILE  
%token       IF  
%token       ELSE  
%token       NILL  
%token       NEW  
%token       INCREMENT  
%token       DECREMENT  
%token       QUESTION  
%token       FORWARDSLASH  
%token       MINUS  
%token       PLUS  
%token       OP_EQ  
%token       OP_NEQ  
%token       OP_LEQ  
%token       OP_GEQ  
%token       NOT  
%token       OP_LOR  
%token       OR  
%token       OP_LOAND  
%token       AND  
%token       ASS_MINUS  
%token       ASS_PLUS  
%token       EQUALS  
%token       OP_MUL  
%token       TILDE  
%token       PERIOD  
%token       HAT  
%token       COMMA  
%token       ALIGNOF  
%token       BOOLEAN  
%token       INT8T  
%token       INT16T  
%token       INT32T  
%token       INT64T  
%token       UINT8T  
%token       UINT16T  
%token       UINT32T  
%token       UINT64T  
%token       FLOAT32  
%token       FLOAT64  
%token       FLOAT96  
%token       VECTOR  
%token   <sval>    STRING  
%token   <lval>    INT_TOKEN
%token   <dval>    FLOAT_TOKEN
%token   <sval>    IDENTIFIER

%type    <NodeAbstract> TypeDeclaration
%type    <NodeAbstract> ClassDeclaration
%type    <NodeAbstract> Body

%%

CompilationUnit   :     END
                  |     TypeDeclarations
                  ;

TypeDeclarations  :     TypeDeclaration
                  |     TypeDeclarations TypeDeclaration
                  ;

TypeDeclaration   :     ClassDeclaration
                  ;

ClassDeclaration  :     DEFINE FINAL CLASS IDENTIFIER LBRACE Body RBRACE
                        {
                           std::cerr << *$4 << "\n";
                        }
                  |     DEFINE ABSTRACT CLASS IDENTIFIER LBRACE Body RBRACE
                        {
                           std::cerr << *$4 << "\n";
                        }
                  |     DEFINE CLASS IDENTIFIER LBRACE Body RBRACE
                        {
                           std::cerr << *$3 << "\n";
                        }
                  ;

Body              :     { std::cerr << "hit the body!!\n"; }
                  ;
%%

void 
AP::AP_Parser::error( const AP::AP_Parser::location_type &l,
                      const std::string &err_message )
{
   std::cerr << "Error: " << err_message << "\n";
}

/* include for access to scanner.yylex */
static int
yylex( AP::AP_Parser::semantic_type *yylval,
       AP::AP_Scanner               &scanner,
       AP::AP_Driver                &driver,
       AP::AP_Data                  &data )
{
   return( scanner.yylex( yylval ) );
}
