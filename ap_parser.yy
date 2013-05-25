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
   Node::VectorType   *vector_val;
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

%type    <node_val>  TypeDeclaration
%type    <node_val>  ClassDeclaration
%type    <node_val>  InterfaceDeclaration
%type    <node_val>  Body
%type    <sval>      InstantModifier
%type    <node_val>  TemplateDeclaration
%type    <node_val>  Declaration
%type    <sval>      ObjectType
%type    <node_val>  Type
%type    <vector_val>   TypeModifier

%%

CompilationUnit   :     END
                  |     TypeDeclarations
                  ;

TypeDeclarations  :     TypeDeclaration
                  |     TypeDeclarations TypeDeclaration
                  ;

TypeDeclaration   :     ClassDeclaration
                  |     InterfaceDeclaration
                  ;

ClassDeclaration  :     DEFINE InstantModifier CLASS IDENTIFIER LBRACE Body RBRACE SEMI
                        {
                           std::cerr << "Modifier: " << *$2 << "\n";
                           std::cerr << *$4 << "\n";
                           delete( $2 );
                           delete( $4 );
                        }
                  ;

InterfaceDeclaration :  DEFINE INTERFACE IDENTIFIER LBRACE Body RBRACE SEMI

Body              :     { std::cerr << "hit the body!!\n"; }
                  ;

InstantModifier   :     FINAL SYSTEM
                        {
                           $$ = new std::string("finalsystem");
                        }
                  |     FINAL
                        {
                           $$ = new std::string("final");
                        }
                  |     ABSTRACT
                        {
                           $$ = new std::string("abstract");
                        }
                  |
                        {
                           $$ = new std::string("none");
                        }
                  ;

TemplateDeclaration  :  LCARROT Declarations  RCARROT
                        {

                        }
                     ;
Declarations      :     Type TypeModifier IDENTIFIER Initializer SEMI
                  ;


Type              :     BOOLEAN
                  |     INT8T
                  |     INT16T
                  |     INT32T
                  |     INT64T
                  |     UINT8T
                  |     UINT16T
                  |     UINT32T
                  |     UINT64T
                  |     FLOAT32
                  |     FLOAT64
                  |     FLOAT96
                  |     STRING
                  |     ObjectType
                  ;

TypeModifier      :     VECTOR LCARROT INT_TOKEN RCARROT
                        {
                           $$ = new VectorType( $3 );
                        }
                  |
                  ;

ObjectType        :     IDENTIFIER
                        {
                           $$ = $1;
                        }
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
