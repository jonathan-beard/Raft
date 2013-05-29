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
      class VectorType;
      class Type;
      class TypeModifier;
      class Int8Type;
      class Int16Type;
      class Int32Type;
      class Int64Type;
      class UInt8Type;
      class UInt16Type;
      class UInt32Type;
      class UInt64Type;
      class Float32Type;
      class Float64Type;
      class Float96Type;
      class StringType;
      class ObjectType;
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
   #include <cstdint>
   #include <cinttypes>
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
   uintmax_t          uint_val;
   intmax_t           int_val;
   long double         dval;
   Node::NodeAbstract *node_val;
   Node::VectorType   *vector_mod;
   Node::Int8Type     *int8_type;
   Node::Int16Type    *int16_type;
   Node::Int32Type    *int32_type;
   Node::Int64Type    *int64_type;
   Node::UInt8Type    *uint8_type;
   Node::UInt16Type   *uint16_type;
   Node::UInt32Type   *uint32_type;
   Node::UInt64Type   *uint64_type;
   Node::Float32Type  *float32_type;
   Node::Float64Type  *float64_type;
   Node::Float96Type  *float96_type;
   Node::StringType   *string_type;
   Node::ObjectType   *object_type;
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
                        {
                           Declaration *d( nullptr );
                           d = new Declaration( $1 /* type */,
                                                $3 /* name */,
                                                $4 /* initializer */ );
                           assert( d != nullptr );
                           TypeModifier *m( $2 /* modifier */ );
                           if( m != nullptr ) d->set_modifier( m );
                           $$ = d;
                        }
                  ;


Type              :     BOOLEAN
                        { $$ = new BooleanType();       }
                  |     INT8T
                        { $$ = new Int8Type();          }
                  |     INT16T
                        { $$ = new Int16Type();         }
                  |     INT32T
                        { $$ = new Int32Type();         }
                  |     INT64T
                        { $$ = new Int64Type();         }
                  |     UINT8T
                        { $$ = new UnsignedInt8Type();  }
                  |     UINT16T
                        { $$ = new UnsignedInt16Type(); }
                  |     UINT32T
                        { $$ = new UnsignedInt32Type(); }
                  |     UINT64T
                        { $$ = new UnsignedInt64Type(); }
                  |     FLOAT32
                        { $$ = new FloatType32();       }
                  |     FLOAT64
                        { $$ = new FloatType64();       }
                  |     FLOAT96
                        { $$ = new FloatType96();       }
                  |     STRING
                        { $$ = new StringType();        }
                  |     ObjectType
                        {
                           assert( $1 != nullptr );
                           $$ = $1;
                        }
                  ;

TypeModifier      :     VECTOR LCARROT INT_TOKEN RCARROT
                        {
                           $$ = new VectorType( $3 );
                        }
                  |     {  $$ = nullptr ; }
                  ;

ObjectType        :     IDENTIFIER
                        {
                           $$ = $1;
                        }
                  ;

Initializer       :     LPAREN 
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
