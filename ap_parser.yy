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
   }
}

/* params for yylex */
%lex-param     { AP_Scanner &scanner }
%parse-param   { AP_Scanner &scanner }

%lex-param     { AP_Driver  &driver  }
%parse-param   { AP_Driver  &driver  }


%code{
   #include <iostream>
   #include <cstdlib>
   #include <fstream>

   /* include for all driver functions */
   #include "ap_driver.hpp"
   
   /* define proper yylex */
   static int yylex(AP::AP_Parser::semantic_type *yylval,
                    AP::AP_Scanner               &scanner,
                    AP::AP_Driver                &driver);
}

/* token types */
%union{
   std::string *sval;
}

%token             END     0     "end of file"
%token   <sval>    LEFTBRACE  
%token   <sval>    RIGHTBRACE  
%token   <sval>    LEFTBRACKET  
%token   <sval>    RIGHTBRACKET  
%token   <sval>    LPAREN  
%token   <sval>    RPAREN  
%token   <sval>    LCARROT  
%token   <sval>    RCARROT  
%token   <sval>    COLON  
%token   <sval>    SEMI  
%token   <sval>    AT  
%token   <sval>    DEFINE  
%token   <sval>    PORTS  
%token   <sval>    CONFIGS  
%token   <sval>    AUTOGEN  
%token   <sval>    AUTO  
%token   <sval>    FINAL  
%token   <sval>    CLASS  
%token   <sval>    SYSTEM 
%token   <sval>    ABSTRACT  
%token   <sval>    INTERFACE  
%token   <sval>    OVERRIDES  
%token   <sval>    IMPLEMENTS  
%token   <sval>    EXTENDS  
%token   <sval>    PUBLIC  
%token   <sval>    PRIVATE  
%token   <sval>    PROTECTED  
%token   <sval>    RETURN  
%token   <sval>    VOID  
%token   <sval>    THIS  
%token   <sval>    FOR  
%token   <sval>    FOREACH  
%token   <sval>    WHILE  
%token   <sval>    IF  
%token   <sval>    ELSE  
%token   <sval>    NILL  
%token   <sval>    NEW  
%token   <sval>    INCREMENT  
%token   <sval>    DECREMENT  
%token   <sval>    QUESTION  
%token   <sval>    FORWARDSLASH  
%token   <sval>    MINUS  
%token   <sval>    PLUS  
%token   <sval>    OP_EQ  
%token   <sval>    OP_NEQ  
%token   <sval>    OP_LEQ  
%token   <sval>    OP_GEQ  
%token   <sval>    NOT  
%token   <sval>    OP_LOR  
%token   <sval>    OR  
%token   <sval>    OP_LOAND  
%token   <sval>    AND  
%token   <sval>    ASS_MINUS  
%token   <sval>    ASS_PLUS  
%token   <sval>    EQUALS  
%token   <sval>    OP_MUL  
%token   <sval>    TILDE  
%token   <sval>    PERIOD  
%token   <sval>    HAT  
%token   <sval>    COMMA  
%token   <sval>    ALIGNOF  
%token   <sval>    BOOLEAN  
%token   <sval>    INT8T  
%token   <sval>    INT16T  
%token   <sval>    INT32T  
%token   <sval>    INT64T  
%token   <sval>    UINT8T  
%token   <sval>    UINT16T  
%token   <sval>    UINT32T  
%token   <sval>    UINT64T  
%token   <sval>    FLOAT32  
%token   <sval>    FLOAT64  
%token   <sval>    FLOAT96  
%token   <sval>    VECTOR  
%token   <sval>    STRING  
%token   <sval>    INT_TOKEN
%token   <sval>    FLOAT_TOKEN
%token   <sval>    IDENTIFIER


%%

S        :     END
         |     T  END
         ;

T        :    T
         |    LEFTBRACE  
         |    RIGHTBRACE  
         |    LEFTBRACKET  
         |    RIGHTBRACKET  
         |    LPAREN  
         |    RPAREN  
         |    LCARROT  
         |    RCARROT  
         |    COLON  
         |    SEMI  
         |    AT  
         |    DEFINE  
         |    PORTS  
         |    CONFIGS  
         |    AUTOGEN  
         |    AUTO  
         |    FINAL  
         |    CLASS  
         |    SYSTEM 
         |    ABSTRACT  
         |    INTERFACE  
         |    OVERRIDES  
         |    IMPLEMENTS  
         |    EXTENDS  
         |    PUBLIC  
         |    PRIVATE  
         |    PROTECTED  
         |    RETURN  
         |    VOID  
         |    THIS  
         |    FOR  
         |    FOREACH  
         |    WHILE  
         |    IF  
         |    ELSE  
         |    NILL  
         |    NEW  
         |    VOID  
         |    INCREMENT  
         |    DECREMENT  
         |    QUESTION  
         |    FORWARDSLASH  
         |    MINUS  
         |    PLUS  
         |    OP_EQ  
         |    OP_NEQ  
         |    OP_LEQ  
         |    OP_GEQ  
         |    NOT  
         |    OP_LOR  
         |    OR  
         |    OP_LOAND  
         |    AND  
         |    ASS_MINUS  
         |    ASS_PLUS  
         |    EQUALS  
         |    OP_MUL  
         |    TILDE  
         |    PERIOD  
         |    HAT  
         |    COMMA  
         |    ALIGNOF  
         |    BOOLEAN  
         |    INT8T  
         |    INT16T  
         |    INT32T  
         |    INT64T  
         |    UINT8T  
         |    UINT16T  
         |    UINT32T  
         |    UINT64T  
         |    FLOAT32  
         |    FLOAT64  
         |    FLOAT96  
         |    VECTOR  
         |    STRING  
         |    INT_TOKEN
         |    FLOAT_TOKEN
         |    IDENTIFIER
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
       AP::AP_Driver                &driver )
{
   return( scanner.yylex( yylval ) );
}
