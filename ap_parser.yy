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
%token       ATPUBLIC
%token       ATPORTS  
%token       ATPRIVATE  
%token       ATPROTECTED  
%token       RETURN  
%token       VOID  
%token       THIS  
%token       SUPER
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
%token       OP_NE  
%token       OP_LE  
%token       OP_GE  
%token       BANG
%token       PERCENT
%token       OP_LOR  
%token       OR  
%token       OP_LAND  
%token       AND  
%token       ASS_MINUS  
%token       ASS_PLUS  
%token       EQUALS  
%token       ASTERICK  
%token       TILDE  
%token       PERIOD  
%token       HAT  
%token       COMMA  
%token       ALIGNOF  
%token       INSTANCEOF
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
%token   <sval>    STR_TOKEN 
%token       POUND
%token       STRING  
%token   <uint_val>  INT_TOKEN
%token   <dval>    FLOAT_TOKEN
%token   <sval>    IDENTIFIER
%type    <sval>   InstantModifier
%type    <sval>   TemplateDeclaration
%type    <sval>   ObjectType
%type    <sval>   Type
%type    <sval>   TypeModifier
%%


CompilationUnit   :     END
                  |     T
                  ;

T                 :     Filename
                  |     TypeDeclaration
                  |     T  Filename
                  |     T  TypeDeclaration
                  |     error
                  ;

Filename          :     POUND    INT_TOKEN   STR_TOKEN
                        {
                           AP_Common::RemoveStringQuotes( *$3 );
                           data.get_cpp_handler().AddUpdate( 
                                       $2    /* line # */,
                                       *$3 /* name   */  );
                           delete( $3 );
                        }
                  |     POUND   INT_TOKEN    STR_TOKEN   INT_TOKEN
                        {
                           AP_Common::RemoveStringQuotes( *$3 );
                           data.get_cpp_handler().AddUpdate(
                                       $2 /* line # */,
                                       *$3 /* name */,
                                       $4 /* flags */ );
                           delete( $3 );
                        }
                  ;

TypeDeclaration   :     ClassDeclaration
                  |     InterfaceDeclaration
                  ;

ClassDeclaration  :     InstantModifier CLASS IDENTIFIER Inherit LBRACE Body RBRACE
                        {
                           /*
                           std::cerr << "Modifier: " << *$2 << "\n";
                           std::cerr << *$4 << "\n";
                           delete( $2 );
                           delete( $4 );
                           */
                        }
                  ;

Inherit           :     COLON EXTENDS IDENTIFIER
                        {
                        }
                  |     COLON IMPLEMENTS IDENTIFIER 
                        {

                        }
                  |
                        {

                        }
                  ;

InterfaceDeclaration :  INTERFACE IDENTIFIER LBRACE Body RBRACE SEMI
                     ;

Body              :     Visibility
                  |     FieldDeclaration
                  |     Body Visibility
                  |     Body FieldDeclaration
                  ;

Visibility        :     ATPUBLIC
                  |     ATPROTECTED
                  |     ATPRIVATE
                  |     ATPORTS
                  ;

FieldDeclaration  :     FieldVariableDeclaration
                        { std::cerr << "FieldVariableDeclaration\n"; }
                  |     MethodDeclaration
                        { std::cerr << "MethodDeclaration\n"; }
                  |     ConstructorDeclaration
                        { std::cerr << "ConstructorDeclaration\n"; }
                  ;

FieldVariableDeclaration  :     Type TypeModifier FieldVariableDeclaration SEMI
                          ;

ConstructorDeclaration   : MethodDeclarator Block
                         ;

MethodDeclaration        : Type TypeModifier MethodDeclarator MethodBody
                         { std::cerr << "Here: \n"; }
                         ;

MethodBody  :  Block
            ;

MethodDeclarator         : Identifier LPAREN ParameterList RPAREN
                         | Identifier LPAREN RPAREN
                         ;

ParameterList            : Parameter
                         | ParameterList Parameter
                         ;

Parameter                : Type TypeModifier DeclaratorName
                         ;

DeclaratorName           : IDENTIFIER
                         ;

Block                    : LBRACE   LocalVariableDeclarationsAndStatements RBRACE
                         | LBRACE   RBRACE
                         ;

LocalVariableDeclarationsAndStatements 
   : LocalVariableDeclarationOrStatement
   | LocalVariableDeclarationsAndStatements LocalVariableDeclarationOrStatement
   ;

LocalVariableDeclarationOrStatement    :  LocalVariableDeclarationStatement
                                       |  Statement
                                       ;

LocalVariableDeclarationStatement      :  LocalDeclaration SEMI
                   |  LocalDeclaration AssignmentOperator AssignmentExpression SEMI
                   |  ClassDeclaration
                                     ;

LocalDeclaration        :     TypeName  LocalVariableDeclarators
                        ;

LocalVariableDeclarators   :  LocalVariableDeclaratorName
                      |  LocalVariableDeclarators COMMA LocalVariableDeclaratorName
                           ;

LocalVariableDeclaratorName   : Identifier
                              ;

Statement   :  EmptyStatement
            |  ExpressionStatement
            |  SelectionStatementInit
            |  IterationStatement
            |  ReturnStatement
            |  Block
            ;

EmptyStatement :  SEMI
               ;

ExpressionStatement  :  Expression
                     ;

Expression  :  AssignmentExpression
            ;


Identifier  :  IDENTIFIER
            ;

SelectionStatementInit  :  
                   IF LPAREN Expression RPAREN Statement SelectionStatementContinue
                   ;

SelectionStatementContinue :  ELSE Statement
                           |
                           ;

IterationStatement   :  WHILE LPAREN Expression RPAREN Statement
                     |  ForIterationStatement
                     ;

ForIterationStatement : BasicFor
                      ;

BasicFor :  FOR LPAREN InitFor RelationalExpression SEMI AssignmentExpression RPAREN ForStatement
         ;

ForStatement   :  LBRACE Statement RBRACE
               |  SEMI
               |  LBRACE RBRACE
               ;

InitFor  :  LocalVariableDeclarationStatement
         ;

ReturnStatement   :  RETURN Expression SEMI
                  |  RETURN SEMI
                  ;

FieldVariableDeclaration : MultiIntInit
                         | MultiStringInit
                         | MultiFloatInit
                         ;

MultiIntInit             : MultiIntInit COMMA IntInitializer
                         | IntInitializer
                         ;

IntInitializer           : IDENTIFIER LPAREN INT_TOKEN RPAREN
                         ;

MultiStringInit          : MultiStringInit COMMA StrInitializer
                         | StrInitializer
                         ;

StrInitializer           : IDENTIFIER  LPAREN   STR_TOKEN RPAREN
                         ;

MultiFloatInit          : MultiFloatInit COMMA FltInitializer
                        | FltInitializer
                        ;

FltInitializer          :  IDENTIFIER  LPAREN   FLOAT_TOKEN RPAREN                 
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

TemplateDeclaration  :  LCARROT STRING  RCARROT
                        {

                        }
                     ;

TypeName :  Type
         |  Identifier
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
                           $$ = $1;
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

ObjectType        :     Identifier
                        {
                        }
                  ;

AssignmentExpression :  ConditionalExpression
                     |  UnaryExpression AssignmentOperator
                     |  UnaryExpression INCREMENT
                     |  UnaryExpression DECREMENT
                     ;

AssignmentOperator   :  EQUALS
                     |  ASS_PLUS
                     |  ASS_MINUS
                     ;

ConditionalExpression   :  ConditionalOrExpression
       |  ConditionalOrExpression QUESTION Expression COLON ConditionalExpression
       ;

ConditionalOrExpression :  ConditionalAndExpression
                        |  ConditionalOrExpression OP_LOR ConditionalAndExpression
                        ;

ConditionalAndExpression   :  InclusiveOrExpression
                          |  ConditionalAndExpression OP_LAND InclusiveOrExpression
                          ;

InclusiveOrExpression   :  ExclusiveOrExpression
                        |  InclusiveOrExpression OR ExclusiveOrExpression
                        ;

ExclusiveOrExpression   :  AndExpression
                        |  ExclusiveOrExpression HAT AndExpression
                        ;

AndExpression           :  EqualityExpression
                        |  AndExpression  AND   EqualityExpression
                        ;

EqualityExpression      :  RelationalExpression
                        |  EqualityExpression   OP_EQ RelationalExpression
                        |  EqualityExpression   OP_NE RelationalExpression
                        ;

RelationalExpression    :  ShiftExpression
                        |  RelationalExpression RCARROT ShiftExpression
                        |  RelationalExpression LCARROT ShiftExpression
                        |  RelationalExpression OP_LE ShiftExpression
                        |  RelationalExpression OP_GE ShiftExpression
                        |  RelationalExpression INSTANCEOF  Type
                        ;

ShiftExpression         :  AdditiveExpression
                        ;

AdditiveExpression      :  MultiplicativeExpression
                        |  AdditiveExpression   PLUS MultiplicativeExpression
                        |  AdditiveExpression   MINUS MultiplicativeExpression
                        ;

MultiplicativeExpression   :  CastExpression
                       |  MultiplicativeExpression   ASTERICK CastExpression
                       |  MultiplicativeExpression   FORWARDSLASH   CastExpression
                       |  MultiplicativeExpression   PERCENT   CastExpression
                       ;

CastExpression :  UnaryExpression
               |  LPAREN   Type  RPAREN   CastExpression
               |  LPAREN   Expression  RPAREN   LogicalUnaryExpression
               ;

UnaryExpression   :  LogicalUnaryExpression
                  |  ArithmeticUnaryOperator CastExpression
                  ;

PostfixExpression :  PrimaryExpression
                  ;

PrimaryExpression :  QualifiedName
                  |  NotJustName
                  ;



AllocationExpression : NEW TypeName LPAREN   ArgumentList   RPAREN
                     | NEW TypeName LPAREN RPAREN
                     ;

QualifiedName  : Identifier
               | QualifiedName PERIOD Identifier
               ;

NotJustName :  SpecialName
            |  AllocationExpression
            |  ComplexPrimary
            ;

ComplexPrimary :  LPAREN Expression RPAREN
               |  ComplexPrimaryNoParenthesis
               ;

ComplexPrimaryNoParenthesis : Literal
                            | Number
                            | FieldAccess
/*                            | MethodCall*/
                            ;

FieldAccess :  NotJustName PERIOD Identifier
            ;

MethodCall : MethodReference LPAREN ArgumentList RPAREN
           ;

MethodReference : ComplexPrimaryNoParenthesis
                | QualifiedName
                | SpecialName
                ;

ArgumentList   :  Expression
               | ArgumentList COMMA Expression
               ;

SpecialName : NILL
            | THIS
            | SUPER
            ;



ArithmeticUnaryOperator :  PLUS
                        |  MINUS
                        ;

LogicalUnaryExpression  :  PostfixExpression
                        |  LogicalUnaryOperator UnaryExpression
                        ;

LogicalUnaryOperator :  BANG
                     |  TILDE
                     ;

Literal  :  STRING
         ;

Number   :  INT_TOKEN
         |  FLOAT_TOKEN
         ;



%%

void 
AP::AP_Parser::error( const AP::AP_Parser::location_type &l,
                      const std::string &err_message )
{
   std::string str( data.get_cpp_handler().PeekHead() );
   const bool is_included_file( data.get_cpp_handler().IsHeadIncludedFile() );
   std::cerr << "Location: " << l << "\n";
   data.get_ap_errorstream() << "Parser error, in file with " << 
   str << " with input \"" 
      << data.get_ap_parsestream().str() << "\"";
   if( is_included_file )
   {
      std::string str_included( data.get_cpp_handler().PeekBelowHead() );
      data.get_ap_errorstream() << ",\n" <<
      "in included from file with " << str_included << ".\n";
   }
   else
   {
      data.get_ap_errorstream() << ".\n";
   }
   data.get_ap_errorstream() << "Error is somewhere in the line:\n" <<
   data.get_cpp_handler().GetHeadCurrentLine() << "\n\n";
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
