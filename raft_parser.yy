%skeleton "lalr1.cc"
%require  "2.5"
%debug
%defines
%define   namespace           "Raft"
%define   parser_class_name   "Parser"

/* pre-declare classes that are needed for the parser here */
%code requires{
   namespace Raft {
      class Driver;
      class Scanner;
      class Data;
   }
   namespace Node {
      class NodeAbstract;
      class Source;
      class Declaring;
      class DeclaringList;
      class Filename;
   }
}

/* params for yylex */
%lex-param     { Scanner &scanner }
%parse-param   { Scanner &scanner }

%lex-param     { Driver  &driver  }
%parse-param   { Driver  &driver  }

%lex-param     { Data    &data    }
%parse-param   { Data    &data    }

%code{
   #include <iostream>
   #include <cstdlib>
   #include <fstream>
   #include <cstdint>
   #include <cinttypes>
   #include <cstring>

   /* include for all driver functions */
   #include "driver.hpp"
   #include "data.hpp"
   #include "common.hpp"
   #include "cpp_output_handler.hpp"
   
   /* nodes */
   #include "NodeAbstract.hpp"
   #include "Source.hpp"
   #include "Declaring.hpp"
   #include "DeclaringList.hpp"
   #include "Filename.hpp"

   /* define proper yylex */
   static int yylex(Raft::Parser::semantic_type *yylval,
                    Raft::Scanner               &scanner,
                    Raft::Driver                &driver,
                    Raft::Data                  &data );
}

/* token types */
%union{
   semantic_type() : sval( nullptr ){}

   /* mostly basic types */
   std::string          *sval;
   bool                 bval;
   uintmax_t            uint_val;
   long double          dval;
   /* begin node types */
   Node::NodeAbstract   *node;



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
%token       POUND
%token       STRING  
%token   <bval>      TRUE
%token   <bval>      FALSE
%token   <sval>      STR_TOKEN 
%token   <uint_val>  INT_TOKEN
%token   <dval>      FLOAT_TOKEN
%token   <sval>      IDENTIFIER

/* begin types */
%type    <node>    TypeDeclaration
%type    <node>    T
%type    <sval>    Filename
%%


CompilationUnit   :     END
                  |     T
                        {
                           Node::Source *s( nullptr );
                           s = new Node::Source();
                           assert( s != nullptr );
                           driver.set_root( s );
                           s->AdoptChildren( $1 );
                           std::cerr << "Really called this\n"; 
                        }
                  ;

T                 :     Filename
                        {
                           Node::Filename *f( nullptr );
                           f = new Node::Filename( *$1 );
                           assert( f != nullptr );
                           f->SetOrigin( data );
                           $$ = f;
                           /* get rid of allocated string */
                           delete( $1 );
                        }
                  |     TypeDeclaration
                        {
                           Node::Declaring *d( nullptr );
                           d = new Node::Declaring();
                           assert( d != nullptr );
                           d->SetOrigin( data );
                           $$->MakeSibling( d );
                           std::cerr << "HERE\n";
                        }
                  |     T  Filename
                        {
                           Node::Filename *f( nullptr );
                           f = new Node::Filename( *$2 );
                           assert( f != nullptr );
                           f->SetOrigin( data );
                           $1->MakeSibling( f );
                           delete( $2 );
                        }
                  |     T  TypeDeclaration
                        {
                           Node::Declaring *d( nullptr );
                           d = new Node::Declaring();
                           d->SetOrigin( data );
                           assert( d != nullptr );
                           $1->MakeSibling( d );
                        }
                  |     error
                  ;
/* handle cpp file names for errors */
Filename          :     POUND    INT_TOKEN   STR_TOKEN
                        {
                           Common::RemoveStringQuotes( *$3 );
                           data.get_cpp_handler().AddUpdate( 
                                       $2    /* line # */,
                                       *$3 /* name   */  );
                           $$ = $3;
                        }
                  |     POUND   INT_TOKEN    STR_TOKEN   INT_TOKEN
                        {
                           Common::RemoveStringQuotes( *$3 );
                           data.get_cpp_handler().AddUpdate(
                                       $2 /* line # */,
                                       *$3 /* name */,
                                       $4 /* flags */ );
                           $$ = $3;
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
                         ;

DeclaratorName           : IDENTIFIER
                         | BoolInitializer 
                         | ObjectInitializer
                         | NumberInitializer
                         | StrInitializer
                         ;

Block : LBRACE   RBRACE
      |  LBRACE   LocalVariableDeclarationsAndStatements RBRACE
      ;


LocalVariableDeclarationsAndStatements 
   : LocalVariableDeclarationOrStatement
   | LocalVariableDeclarationsAndStatements LocalVariableDeclarationOrStatement
   ;

LocalVariableDeclarationOrStatement    :  LocalVariableDeclaration
                                       |  Statement
                                       |  StructDeclaration
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
            |  MapExpression
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
                  |     FINAL
                  |     ABSTRACT
                  |
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
                  |     INT_TOKEN
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
                     | ALLOC Type LBRACKET Expression RBRACKET
                     | ALLOC Type LPAREN  RPAREN
                     | NEW Type LPAREN ArgumentList RPAREN
                     | NEW Type LPAREN RPAREN
                     | NEW Type LBRACKET Expression RBRACKET
                     ;


DeAllocationExpression : FREE LPAREN IDENTIFIER RPAREN
                       ;


NotJustName :  SpecialName
            |  AllocationExpression
            |  DeAllocationExpression
            |  ComplexPrimary
            ;

ComplexPrimary :  LPAREN Expression RPAREN
               |  ComplexPrimaryNoParenthesis
               ;

ComplexPrimaryNoParenthesis : Literal
                            | Number
                            | FieldAccess
                            | MethodCall
                            | AnonymousArrayAccess
                            | ArrayAccess
                            | Placeholder
                            ;
Placeholder  : POUND
             ;

ArrayAccess :  NotJustName LBRACKET ArraySize RBRACKET
            |  QualifiedName LBRACKET  ArraySize RBRACKET
            ;

FieldAccess :  NotJustName PERIOD IDENTIFIER
            ;

MethodCall : QualifiedName LPAREN ArgumentList RPAREN
           | QualifiedName LPAREN  RPAREN
           | SpecialName PERIOD QualifiedName LPAREN ArgumentList RPAREN
           | SpecialName PERIOD QualifiedName LPAREN RPAREN
           ;

QualifiedName  : IDENTIFIER
               | QualifiedName PERIOD IDENTIFIER
               ;


SpecialName     : NILL
                | THIS
                | SUPER
                ;


ArgumentList   :  Expression
               | ArgumentList COMMA Expression
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

Literal  :  STR_TOKEN
         ;

Number   :  INT_TOKEN
         |  FLOAT_TOKEN
         ;

Boolean  :  TRUE
         |  FALSE
         ;


AnonymousArrayAccess :  DOLLAR
                     |  DOLLAR LBRACKET   Number   RBRACKET
                     ;
                        
%%

void 
Raft::Parser::error( const Raft::Parser::location_type &l,
                     const std::string &err_message )
{
   std::string str( data.get_cpp_handler().PeekHead() );
   const bool is_included_file( data.get_cpp_handler().IsHeadIncludedFile() );
   data.get_rf_errorstream() << "Parser error, in file with " << 
   str << " with input \"" 
      << data.get_rf_parsestream().str() << "\"";
   if( is_included_file )
   {
      std::string str_included( data.get_cpp_handler().PeekBelowHead() );
      data.get_rf_errorstream() << ",\n" <<
      "in included from file with " << str_included << ".\n";
   }
   else
   {
      data.get_rf_errorstream() << ".\n";
   }
   data.get_rf_errorstream() << "Error is somewhere in the line:\n" <<
   data.get_cpp_handler().GetHeadCurrentLine() << "\n\n";
   data.reset_rf_parsestream();
}

/* include for access to scanner.yylex */
static int
yylex( Raft::Parser::semantic_type *yylval,
       Raft::Scanner               &scanner,
       Raft::Driver                &driver,
       Raft::Data                  &data )
{
   return( scanner.yylex( yylval ) );
}
