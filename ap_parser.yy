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
   bool                 bval;
   uintmax_t          uint_val;
   long double         dval;
}

%token       END     0     "end of file"
%token       AT
%token       DOLLAR
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
%token       CONST
%token       ALLOC
%token       NEW
%token       STATIC
%token       ATOMIC
%token       NONATOMIC
%token       STRUCT
%token       FREE
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
%token       BOOLEAN  
%token   <bval>   TRUE
%token   <bval>   FALSE
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
%token   <sval>    STR_TOKEN 
%token       POUND
%token       STRING  
%token   <uint_val>  INT_TOKEN
%token   <dval>    FLOAT_TOKEN
%token   <sval>    IDENTIFIER
%type    <sval>    InstantModifier
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
/* handle cpp file names for errors */
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
                  |     TemplateDeclaration
                  |     StructDeclaration InlineStructInitList
                  ;

ClassDeclaration  :     InstantModifier CLASS IDENTIFIER Generic Inherit LBRACE Body RBRACE
                        {

                        }
                  |     InstantModifier CLASS IDENTIFIER Generic Inherit LBRACE RBRACE
                  ;

Generic  :  LCARROT GenericList RCARROT
         |  
         ;

GenericList :  CLASS IDENTIFIER
            |  Type  IDENTIFIER  TypeModifier
            |  Type  Initializer
            |  GenericList COMMA CLASS IDENTIFIER
            |  GenericList COMMA Type IDENTIFIER TypeModifier 
            |  GenericList COMMA Type Initializer
            ;

StructDeclaration :  STRUCT IDENTIFIER Inherit LBRACE Body RBRACE
                  |  STRUCT IDENTIFIER Inherit LBRACE RBRACE
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

InterfaceDeclaration :  INTERFACE IDENTIFIER LBRACE Body RBRACE
                     |  INTERFACE IDENTIFIER LBRACE RBRACE
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
                  |     MethodDeclaration
                  |     ConstructorDeclaration
                  |     StructDeclaration InlineStructInitList
                  ;

InlineStructInitList   :  COLON MultiObjectInit SEMI
                       | 
                       ;

FieldVariableDeclaration  : StorageModifier Type TypeModifier Initializer SEMI
                          | StorageModifier Type TypeModifier Initializer DeclareAndAssignArray SEMI
                          | Type TypeModifier Initializer SEMI
                          | Type TypeModifier Initializer DeclareAndAssignArray SEMI
                          ;

StorageModifier : CONST
                | STATIC
                | STATIC ATOMIC
                | ATOMIC STATIC
                | NONATOMIC STATIC
                | STATIC NONATOMIC
                | ATOMIC
                | NONATOMIC
                ;


ConstructorDeclaration   : MethodDeclarator Block
                         | MethodDeclarator COLON ClassInitializers SEMI
                         | MethodDeclarator COLON ClassInitializers Block
                         ;

ClassInitializers        : IDENTIFIER LPAREN Expression RPAREN
                         | ClassInitializers COMMA IDENTIFIER LPAREN Expression RPAREN
                         ;

MethodDeclaration        
                         : Type TypeModifier MethodDeclarator MethodBody
                         | VOID TypeModifier MethodDeclarator MethodBody
                         | IMPLEMENTS Type TypeModifier MethodDeclarator MethodBody
                         | IMPLEMENTS VOID TypeModifier MethodDeclarator MethodBody
                         | OVERRIDES Type TypeModifier MethodDeclarator MethodBody
                         | OVERRIDES VOID TypeModifier MethodDeclarator MethodBody
                         ;

MethodBody  :  Block
            ;

MethodDeclarator         : IDENTIFIER LPAREN ParameterList RPAREN
                         | IDENTIFIER LPAREN RPAREN
                         ;

ParameterList            : Parameter
                         | ParameterList COMMA Parameter
                         ;

Parameter                : Type  DeclaratorName
                           { std::cerr << "Parameter\n"; }
                         ;

DeclaratorName           : IDENTIFIER
                           { std::cerr << "Declarator Name: " << *$1 << "\n"; }
                         | BoolInitializer 
                           { std::cerr << "Bool Initializer\n"; }
                         | ObjectInitializer
                           { std::cerr << "Object Initializer\n"; }
                         | NumberInitializer
                           { std::cerr << "Int Initializer\n"; }
                         | StrInitializer
                           { std::cerr << "String Initializer\n"; }
                         ;

Block : LBRACE   RBRACE
         { std::cerr << "EmptyBlock\n"; }
      |  LBRACE   LocalVariableDeclarationsAndStatements RBRACE
         { std::cerr << "NonEmptyBlock\n"; }
      ;


LocalVariableDeclarationsAndStatements 
   : LocalVariableDeclarationOrStatement
      { std::cerr << "LocalVariableDeclarationOrStatemnet\n"; }
   | LocalVariableDeclarationsAndStatements LocalVariableDeclarationOrStatement
      { std::cerr << "LongerOneLocalVariableDeclarationOrStatemnet\n"; }
   ;

LocalVariableDeclarationOrStatement    :  LocalVariableDeclaration
                                          { std::cerr << "LocalVariableDeclaration\n"; }
                                       |  Statement
                                          { std::cerr << "Statement\n"; }
                                       |  StructDeclaration
                                          { std::cerr << "StructDeclaration\n"; }
                                       ;

LocalVariableDeclaration   :  LocalStorageModifier Type Initializer SEMI
                           |  LocalStorageModifier Type Initializer DeclareAndAssignArray SEMI
                           |  Type Initializer SEMI
                           |  Type Initializer DeclareAndAssignArray SEMI
                           ;

DeclareAndAssignArray      :  EQUALS LBRACE ArrayListNumber  RBRACE
                           |  EQUALS LBRACE ArrayListLiteral RBRACE
                           ;

ArrayListNumber   : LBRACKET ArraySize RBRACKET EQUALS Number
                  | ArrayListNumber COMMA LBRACKET ArraySize RBRACKET EQUALS Number
                  ;

ArrayListLiteral  : LBRACKET ArraySize RBRACKET EQUALS Literal
                  | ArrayListLiteral COMMA LBRACKET ArraySize RBRACKET EQUALS Literal
                  ;

LocalStorageModifier : CONST
                     | ATOMIC
                     | NONATOMIC
                     ;


Statement   :  EmptyStatement
               { std::cerr << "EmptyStatement\n"; }
            |  ExpressionStatement
               { std::cerr << "ExpressionStatement\n"; }
            |  SelectionStatementInit
               { std::cerr << "SelectionStatementInit\n"; }
            |  IterationStatement
               { std::cerr << "IterationStatement\n"; }
            |  ReturnStatement
               { std::cerr << "ReturnStatement\n"; }
            |  Block
               { std::cerr << "Block\n"; }
            ;

EmptyStatement :  SEMI
               { std::cerr << "SEMI\n"; }
               ;

ExpressionStatement  :  Expression
                        { std::cerr << "Expression\n"; }
                     ;

Expression  :  AssignmentExpression
               { std::cerr << "AssignmentExpression\n"; }
            |  MapExpression
               { std::cerr << "Hit MapExpression\n"; }
            ;


SelectionStatementInit  :  
                        IF LPAREN Expression RPAREN Statement ELSE Statement
                    |   IF LPAREN Expression RPAREN Statement
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

MapExpression   :  Expression AT FORWARDSLASH Expression
                  { std::cerr << "MapExpression\n"; }
                ;

InitFor  : LocalVariableDeclaration
         ;

ReturnStatement   :  RETURN Expression SEMI
                  |  RETURN SEMI
                  ;


Initializer :  MultiBoolInit
            |  MultiNumberInit
            |  MultiStringInit
            |  MultiObjectInit
            ;


MultiBoolInit            : MultiBoolInit  COMMA BoolInitializer
                         | BoolInitializer
                         ;

BoolInitializer          : IDENTIFIER TypeModifier LPAREN Boolean RPAREN
                         | IDENTIFIER TypeModifier LPAREN LogicalUnaryExpression RPAREN
                         | IDENTIFIER LPAREN LogicalUnaryExpression RPAREN
                         | IDENTIFIER LPAREN Boolean RPAREN
                         ;


MultiObjectInit          : MultiObjectInit COMMA ObjectInitializer
                         | ObjectInitializer
                         ;

ObjectInitializer        : IDENTIFIER TypeModifier LPAREN ArgumentList RPAREN
                         | IDENTIFIER TypeModifier LPAREN RPAREN
                         ;

MultiNumberInit          : MultiNumberInit COMMA NumberInitializer
                         | NumberInitializer
                         ;

NumberInitializer        : IDENTIFIER TypeModifier LPAREN Expression RPAREN
                         | IDENTIFIER LPAREN Expression RPAREN
                         ;

MultiStringInit          : MultiStringInit COMMA StrInitializer
                         | StrInitializer
                         ;

StrInitializer           : IDENTIFIER  TypeModifier LPAREN STR_TOKEN RPAREN
                         | IDENTIFIER LPAREN STR_TOKEN RPAREN
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

Type  :  BoolType
      |  IntType
      |  FloatType
      |  StringType
      |  ObjectType
      |  AutoType
      ;

AutoType          :     AUTO
                  ;

BoolType          :     BOOLEAN
                        { 
                        }
                  ;
IntType           :     INT8T
                        { 
                        }
                  |     INT16T
                        { 
                        }
                  |     INT32T
                        {
                        }
                  |     INT64T
                        { 
                        }
                  |     UINT8T
                        { 
                        }
                  |     UINT16T
                        { 
                        }
                  |     UINT32T
                        { 
                        }
                  |     UINT64T
                        { 
                        }
                        ;
FloatType         :     FLOAT32
                        { 
                        }
                  |     FLOAT64
                        { 
                        }
                  |     FLOAT96
                        { 
                        }
                  ;

StringType        :     STRING
                  ;

ObjectType        :     IDENTIFIER
                        {
                        }
                  ;

TypeModifier      :     LBRACKET ArraySize RBRACKET
                  |     LBRACKET RBRACKET /* dynamic array */
                  |     LCARROT GenericInstantiationList RCARROT LBRACKET ArraySize RBRACKET
                  |     LCARROT GenericInstantiationList RCARROT
                  |     LCARROT GenericInstantiationList RCARROT LBRACKET RBRACKET
                  |
                  ;

GenericInstantiationList : IDENTIFIER EQUALS AllowedGenericInstTypes
                         | GenericInstantiationList COMMA AllowedGenericInstTypes EQUALS
                         ;

AllowedGenericInstTypes : IDENTIFIER
                        | Literal
                        | Number
                        | Boolean
                        ;

ArraySize         :     ArraySize COMMA INT_TOKEN
                        { std::cerr << "ArraySizeMultiple\n"; }
                  |     INT_TOKEN
                        { std::cerr << "ArraySizeSingle\n"; }
                  ;



AssignmentExpression :  ConditionalExpression
                        { std::cerr << "ConditionalExpression\n"; }
                     |  UnaryExpression AssignmentOperator
                        { std::cerr << "UnaryAssignmentExpression\n"; }
                     |  UnaryExpression INCREMENT
                        { std::cerr << "UnaryIncrementExpression\n"; }
                     |  UnaryExpression DECREMENT
                        { std::cerr << "UnaryDecrementExpression\n"; }
                     ;

AssignmentOperator   :  EQUALS
                        { std::cerr << "Equals\n"; }
                     |  ASS_PLUS
                        { std::cerr << "AssPlus\n"; }
                     |  ASS_MINUS
                        { std::cerr << "AssMinus\n"; }
                     ;

ConditionalExpression   :  ConditionalOrExpression
                           { std::cerr << "ConditionalExpression-> ConditionalOrExpression\n"; }
       |  ConditionalOrExpression QUESTION Expression COLON ConditionalExpression
         { std::cerr << "ConditionalExpression->TerniaryConditional\n"; }
       ;

ConditionalOrExpression :  ConditionalAndExpression
                           { std::cerr << "ConditionalOrExpression -> ConditionalAndExpression\n"; }
                        |  ConditionalOrExpression OP_LOR ConditionalAndExpression
                           { std::cerr << "ConditionalOrExpression -> LOR \n"; }
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



AllocationExpression : ALLOC Type LPAREN   ArgumentList   RPAREN
                       { std::cerr << "Allocation With Arguments\n"; }
                     | ALLOC Type LBRACKET Expression RBRACKET
                       { std::cerr << "allocation With Expression\n"; }
                     | ALLOC Type LPAREN  RPAREN
                       { std::cerr << "Allocation With No Arguments\n"; }
                     | NEW Type LPAREN ArgumentList RPAREN
                     | NEW Type LPAREN RPAREN
                     | NEW Type LBRACKET Expression RBRACKET
                     ;


DeAllocationExpression : FREE LPAREN IDENTIFIER RPAREN
                        { std::cerr << "DeAllocation For: " << *$3 << "\n"; }
                       ;


NotJustName :  SpecialName
               { std::cerr << "Special Name\n"; }
            |  AllocationExpression
               { std::cerr << "AllocationExpression\n"; }
            |  DeAllocationExpression
               { std::cerr << "DeAllocationExpression\n"; }
            |  ComplexPrimary
               { std::cerr << "ComplexPrimaryExpression\n"; }
            ;

ComplexPrimary :  LPAREN Expression RPAREN
                  { std::cerr << "ComplexPrimaryOne\n"; }
               |  ComplexPrimaryNoParenthesis
                  { std::cerr << "ComplexPrimaryNoParenthesis\n"; }
               ;

ComplexPrimaryNoParenthesis : Literal
                              { std::cerr << "Literal\n"; }
                            | Number
                              { std::cerr << "Number\n"; }
                            | FieldAccess
                              { std::cerr << "FieldAccess\n"; }
                            | MethodCall
                              { std::cerr << "MethodCall\n"; }
                            | AnonymousArrayAccess
                              { 
                                 std::cerr << "AnonymousArrayAccesss\n"; 
                              }
                            | ArrayAccess
                              {
                                 std::cerr << "ArrayAccess\n"; 
                              }
                            | Placeholder
                              {
                                 std::cerr << "Placeholder\n";
                              }
                            ;
Placeholder  : POUND
             ;

ArrayAccess :  NotJustName LBRACKET ArraySize RBRACKET
            |  QualifiedName LBRACKET  ArraySize RBRACKET
            ;

FieldAccess :  NotJustName PERIOD IDENTIFIER
               { std::cerr << "NotJustNmae . " << *$3 << "\n"; }
            ;

MethodCall : QualifiedName LPAREN ArgumentList RPAREN
             { std::cerr << "MethodReference - Arg\n"; }
           | QualifiedName LPAREN  RPAREN
             { std::cerr << "MethodReference - NoArg\n"; }
           | SpecialName PERIOD QualifiedName LPAREN ArgumentList RPAREN
             { std::cerr << "MethodCall -> SpecialName.Qual( args )\n"; }
           | SpecialName PERIOD QualifiedName LPAREN RPAREN
             { std::cerr << "MethodCall -> SpecialName.Qual( NO args )\n"; }
           ;

QualifiedName  : IDENTIFIER
                 { 
                     std::cerr << "Identifier: " << *$1 << "\n";
                 }
               | QualifiedName PERIOD IDENTIFIER
                 {
                     std::cerr << "Qualified Name . " << *$3 << "\n"; 
                 }
               ;


SpecialName     : NILL
                  { std::cerr << "NILL\n"; }
                | THIS
                  { std::cerr << "THIS\n"; }
                | SUPER
                  { std::cerr << "SUPER\n"; }
                ;


ArgumentList   :  Expression
                  { std::cerr << "ArgumentList->Expression\n"; }
               | ArgumentList COMMA Expression
                  { std::cerr << "More than one argument, ArgumentList\n"; }
               ;



ArithmeticUnaryOperator :  PLUS
                           { std::cerr << "plus\n"; }
                        |  MINUS
                           { std::cerr << "minus\n"; }
                        ;

LogicalUnaryExpression  :  PostfixExpression
                           { std::cerr << "PostFixExpression\n"; }
                        |  LogicalUnaryOperator UnaryExpression
                           { std::cerr << "LogicalUnaryOperator + UnaryExpression\n"; }
                        ;

LogicalUnaryOperator :  BANG
                        { std::cerr << "BANG\n"; }
                     |  TILDE
                        { std::cerr << "TILDE\n"; }
                     ;

Literal  :  STR_TOKEN
            { std::cerr << "STRING: \n" << *$1 << "\n"; }
         ;

Number   :  INT_TOKEN
            { std::cerr << "INT_TOKEN: " << $1 << "\n"; }
         |  FLOAT_TOKEN
            { std::cerr << "FLOAT_TOKEN: " << $1 << "\n"; }
         ;

Boolean  :  TRUE
            { std::cerr << "Boolean TRUE\n"; }
         |  FALSE
            { std::cerr << "Boolean FALSE\n"; }
         ;


AnonymousArrayAccess :  DOLLAR
                     |  DOLLAR LBRACKET   Number   RBRACKET
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
