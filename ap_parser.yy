%skeleton "lalr1.cc"
%require  "2.5"
%debug
%defines
%define   namespace           "AP"
%define   parser_class_name   "AP_Parser"

/* pre-declare classes that are needed for the parser here */
%code requires{
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
   #include <cstring>

   /* include for all driver functions */
   #include "ap_driver.hpp"
   #include "ap_data.hpp"
   #include "ap_common.hpp"
   #include "ap_cpp_output_handler.hpp"

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
   long double         dval;
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
%token   <sval>    STRTOKEN 
%token       POUND
%token   <sval>    STRING  
%token   <uint_val>  INT_TOKEN
%token   <dval>    FLOAT_TOKEN
%token   <sval>    IDENTIFIER

%type    <sval>   TypeDeclaration
%type    <sval>   ClassDeclaration
%type    <sval>   InterfaceDeclaration
%type    <sval>   Body
%type    <sval>   InstantModifier
%type    <sval>   TemplateDeclaration
%type    <sval>   ObjectType
%type    <sval>   Type
%type    <sval>   TypeModifier
%type    <sval>   Filename
%%

CompilationUnit   :     END
                  |     Filenames
                  |     error
                  ;

Filenames         :     Filename
                  |     Filenames Filename
                  ;

Filename          :     POUND    INT_TOKEN   STRING
                        {
                           AP_Common::RemoveStringQuotes( *$3 );
                           data.get_cpp_handler().AddUpdate( 
                                       $2    /* line # */,
                                       *$3 /* name   */  );
                           delete( $3 );
                        }
                  |     POUND   INT_TOKEN    STRING   INT_TOKEN
                        {
                           AP_Common::RemoveStringQuotes( *$3 );
                           data.get_cpp_handler().AddUpdate(
                                       $2 /* line # */,
                                       *$3 /* name */,
                                       $4 /* flags */ );
                           delete( $3 );
                        }
                  ;



TypeDeclarations  :     TypeDeclaration
                  |     TypeDeclarations TypeDeclaration
                  ;

TypeDeclaration   :     ClassDeclaration
                  |     InterfaceDeclaration
                  ;

ClassDeclaration  :     InstantModifier CLASS IDENTIFIER LBRACE Body RBRACE SEMI
                        {
                           /*
                           std::cerr << "Modifier: " << *$2 << "\n";
                           std::cerr << *$4 << "\n";
                           delete( $2 );
                           delete( $4 );
                           */
                        }
                  ;

InterfaceDeclaration :  INTERFACE IDENTIFIER LBRACE Body RBRACE SEMI

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
                        }
                  ;


Type              :     BOOLEAN
                        { 
                           $$ = new std::string( "Boolean" );       
                        }
                  |     INT8T
                        { 
                           $$ = new std::string("INT8T");           
                        }
                  |     INT16T
                        { 
                           $$ = new std::string("INT16T");          
                        }
                  |     INT32T
                        { 
                           $$ = new std::string("INT32T");          
                        }
                  |     INT64T
                        { 
                           $$ = new std::string("INT64T");          
                        }
                  |     UINT8T
                        { 
                           $$ = new std::string("UINT8T");          
                        }
                  |     UINT16T
                        { 
                           $$ = new std::string("UINT16T"); 
                        }
                  |     UINT32T
                        { 
                           $$ = new std::string("UInt32T"); 
                        }
                  |     UINT64T
                        { 
                           $$ = new std::string("UINT64T"); 
                        }
                  |     FLOAT32
                        { 
                           $$ = new std::string("Float32");       
                        }
                  |     FLOAT64
                        { 
                           $$ = new std::string("Float32");
                        }
                  |     FLOAT96
                        { 
                           $$ = new std::string("Float96");       
                        }
                  |     STRING
                        { 
                           $$ = new std::string("String");
                        }
                  |     ObjectType
                        {
                           $$ = new std::string("ObjectType");
                        }
                  ;

TypeModifier      :     VECTOR LCARROT INT_TOKEN RCARROT
                        {
                           $$ = new std::string("VectorModifier");
                        }
                  |     {  
                           $$ = nullptr ; 
                        }
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
   std::string str( data.get_cpp_handler().PeekHead() );
   //const bool is_included_file( data.get_cpp_handler().IsHeadIncludedFile() );

   data.get_ap_errorstream() << "Parser error, " << str << " with input \"" 
      << data.get_ap_parsestream().str() << "\"\n";
   data.reset_ap_parsestream();
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
