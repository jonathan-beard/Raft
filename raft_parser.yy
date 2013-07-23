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
%type    <node>    Filename

%type    <node>    ClassDeclaration
%type    <node>    StructDeclaration
%type    <node>    TemplateDeclaration
%type    <node>    Generic
%type    <node>    GenericList
%type    <node>    Inherit
%type    <node>    InlineStructInitList
%type    <node>    InstantModifier
%type    <node>    Body
%type    <node>    Type
%type    <node>    TypeModifier
%type    <node>    Initializer
%type    <node>    Visibility
%type    <node>    FieldDeclaration
%type    <node>    FieldVariableDeclaration
%type    <node>    MethodDeclaration
%type    <node>    ConstructorDeclaration
%type    <node>    MultiObjectInit
%type    <node>    StorageModifier
%type    <node>    DeclareAndAssignArray
%type    <node>    ClassInitializers
%type    <node>    MethodBody
%type    <node>    MethodDeclarator
%type    <node>    ParameterList
%type    <node>    Parameter
%type    <node>    DeclaratorName
%type    <node>    LocalVariableDeclarationsAndStatements
%type    <node>    LocalVariableDeclarationsOrStatement
%type    <node>    LocalVariableDeclaration
%type    <node>    ArrayListNumber
%type    <node>    ArrayListLiteral
%type    <node>    LocalStorageModifier
%type    <node>    Statement
%type    <node>    EmptyStatement
%type    <node>    ExpressionStatement
%type    <node>    Expression
%type    <node>    SelectionStatementInit
%type    <node>    IterationStatement
%type    <node>    ForIterationStatement
%type    <node>    BasicFor
%type    <node>    ForStatement
%type    <node>    MapExpression
%type    <node>    InitFor
%type    <node>    ReturnStatement
%type    <node>    MultiBoolInit
%type    <node>    BoolInitializer
%type    <node>    ObjectInitializer
%type    <node>    MultiNumberInit
%type    <node>    NumberInitializer
%type    <node>    MultiStringInit
%type    <node>    StrInitializer
%type    <node>    AutoType
%type    <node>    BoolType
%type    <node>    IntType
%type    <node>    FloatType
%type    <node>    StringType
%type    <node>    ObjectType
%type    <node>    GenericInstantiationList
%type    <node>    AllowedGenericInstTypes
%type    <node>    ArraySize
%type    <node>    AssignmentExpression
%type    <node>    AssignmentOperator
%type    <node>    ConditionalExpression
%type    <node>    ConditionalOrExpression
%type    <node>    ConditionalAndExpression
%type    <node>    InclusiveOrExpression
%type    <node>    ExclusiveOrExpression
%type    <node>    AndExpression
%type    <node>    EqualityExpression
%type    <node>    RelationalExpression
%type    <node>    ShiftExpression
%type    <node>    AdditiveExpression
%type    <node>    MultiplicativeExpression
%type    <node>    CastExpression
%type    <node>    UnaryExpression
%type    <node>    PostfixExpression
%type    <node>    PrimaryExpression
%type    <node>    AllocationExpression
%type    <node>    DeAllocationExpression
%type    <node>    NotJustName
%type    <node>    ComplexPrimary
%type    <node>    ComplexPrimaryNoParenthesis
%type    <node>    Placeholder
%type    <node>    ArrayAccess
%type    <node>    FieldAccess
%type    <node>    MethodCall
%type    <node>    QualifiedName
%type    <node>    SpecialName
%type    <node>    ArgumentList
%type    <node>    ArithmeticUnaryOperator
%type    <node>    LogicalUnaryExpression
%type    <node>    LogicalUnaryOperator
%type    <node>    Literal
%type    <node>    Number
%type    <node>    Boolean
%type    <node>    AnonymousArrayAccess



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
                           $$ = $1;
                        }
                  |     TypeDeclaration
                        {
                           $$ = $1;
                        }
                  |     T  Filename
                        {
                           $1->MakeSibling( $2 );
                        }
                  |     T  TypeDeclaration
                        {
                           $1->MakeSibling( $2 );
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
                           Node::Filename *f( nullptr );
                           f = new Node::Filename( *$3 );
                           assert( f != nullptr );
                           f->SetOrigin( data );
                           $$ = f;
                           /* get rid of allocated string */
                           delete( $3 );
                        }
                  |     POUND   INT_TOKEN    STR_TOKEN   INT_TOKEN
                        {
                           Common::RemoveStringQuotes( *$3 );
                           data.get_cpp_handler().AddUpdate(
                                       $2 /* line # */,
                                       *$3 /* name */,
                                       $4 /* flags */ );
                           $$ = $3;
                           Node::Filename *f( nullptr );
                           f = new Node::Filename( *$3 );
                           assert( f != nullptr );
                           f->SetOrigin( data );
                           $$ = f;
                           /* get rid of allocated string */
                           delete( $3 );
                        }
                  ;

TypeDeclaration   :     ClassDeclaration
                        {
                           $$ = $1;
                        }
                  |     InterfaceDeclaration
                        {
                           $$ = $1;
                        }
                  |     StructDeclaration InlineStructInitList
                        {
                           $$ = $1;
                        }
                  ;

ClassDeclaration  :     InstantModifier CLASS IDENTIFIER Generic Inherit LBRACE Body RBRACE
                        {
                           $$ = new Node::NodeAbstract();
                           $$.set_name(*$3);
                           delete( $3 );
                        }
                  |     InstantModifier CLASS IDENTIFIER Generic Inherit LBRACE RBRACE
                        {
                           $$ = new Node::NodeAbstract();
                           $$.set_name( *$3 );
                           delete( $3 );
                        }
                  ;

Generic  :  LCARROT GenericList RCARROT
            { 
               $$ = $2;
            }
         |  {  $$ = nullptr; }
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
                          {
                              $$ = nullptr;
                          }
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
                        {
                           $$ = nullptr; 
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
                        {
                           $$ = nullptr;
                        }
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
                           {
                              $$ = $1;
                           }
                       |   MultiplicativeExpression   ASTERICK CastExpression
                           {
                              //TODO start here 
                           }
                       |   MultiplicativeExpression   FORWARDSLASH   CastExpression
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "MultiplicativeExpression" );
                              $1->MakeSibling
                           }
                       |   MultiplicativeExpression   PERCENT   CastExpression
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "MultiplicativeExpression" );
                           }
                       ;

CastExpression :  UnaryExpression
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "CastExpression" );
                     $$->AdoptChildren( $1 );
                  }
               |  LPAREN   Type  RPAREN   CastExpression
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "CastExpression" );
                     $2->MakeSibling( $4 );
                     $$->AdoptChildren( $2 );
                  }
               |  LPAREN   Expression  RPAREN   LogicalUnaryExpression
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "CastExpression" );
                     $2->MakeSibling( $4 );
                     $$->AdoptChildren( $2 );
                  }
               ;

UnaryExpression   :  LogicalUnaryExpression
                     {
                        $$ = new NodeAbstract();
                        $$->set_name( "UnaryExpression" );
                        $$->AdoptChildren( $1 );
                     }
                  |  ArithmeticUnaryOperator CastExpression
                     {
                        $$ = new NodeAbstract();
                        $$->set_name( "UnaryExpression" );
                        $1->MakeSibling( $2 );
                        $$->AdoptChildren( $1 );
                     }
                  ;

PostfixExpression :  PrimaryExpression
                     {
                        $$ = $1;
                     }
                  ;

PrimaryExpression :  QualifiedName
                     {
                        $$ = new NodeAbstract();
                        $$->set_name( "PrimaryExpression" );
                        $$->AdoptChildren( $1 );
                     }
                  |  NotJustName
                     {
                        $$ = new NodeAbstract();
                        $$->set_name( "PrimaryExpression" );
                        $$->AdoptChildren( $1 );
                     }
                  ;



AllocationExpression :  ALLOC Type LPAREN   ArgumentList   RPAREN
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "AllocationExpression" );
                           $2->MakeSibling( $4 );
                           $$->AdoptChildren( $2 );
                        }
                     |  ALLOC Type LBRACKET Expression RBRACKET
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "AllocationExpression" );
                           $2->MakeSibling( $4 );
                           $$->AdoptChildren( $2 );
                        }
                     |  ALLOC Type LPAREN  RPAREN
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "AllocationExpression" );
                           $$->AdoptChildren( $2 );
                        }
                     |  NEW Type LPAREN ArgumentList RPAREN
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "NewExpression" );
                           $2->MakeSibling( $4 );
                           $$->AdoptChildren( $2 );
                        }
                     |  NEW Type LPAREN RPAREN
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "NewExpression" );
                           $$->AdoptChildren( $2 );
                        }
                     |  NEW Type LBRACKET Expression RBRACKET
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "NewExpression" );
                           $2->MakeSibling( $4 );
                           $$->AdoptChildren( $2 );
                        }
                     ;


DeAllocationExpression : FREE LPAREN IDENTIFIER RPAREN
                         {
                           $$ = new NodeAbstract();
                           std::stringstream ss;
                           ss << "DeAllocationExpression - " << *$3;
                           $$->set_name( ss.str() );
                           delete( $3 );
                         }
                       ;


NotJustName :  SpecialName
               {
                  $$ = $1;
               }
            |  AllocationExpression
               {
                  $$ = $1;
               }
            |  DeAllocationExpression
               {
                  $$ = $1;
               }
            |  ComplexPrimary
               {
                  $$ = $1;
               }
            ;

ComplexPrimary :  LPAREN Expression RPAREN
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "ComplexPrimary" );
                     $$->AdoptChildren( $2 );
                  }
               |  ComplexPrimaryNoParenthesis
                  {
                     $$ = $1;
                  }
               ;

ComplexPrimaryNoParenthesis : Literal
                              {
                                 $$ = new NodeAbstract();
                                 $$->set_name( "ComplexPrimaryNoParenthesis" );
                                 $$->AdoptChildren( $1 );
                              }
                            | Number
                              {
                                 $$ = new NodeAbstract();
                                 $$->set_name( "ComplexPrimaryNoParenthesis" );
                                 $$->AdoptChildren( $1 );
                              }
                            | FieldAccess
                              {
                                 $$ = new NodeAbstract();
                                 $$->set_name( "ComplexPrimaryNoParenthesis" );
                                 $$->AdoptChildren( $1 );
                              }
                            | MethodCall
                              {
                                 $$ = new NodeAbstract();
                                 $$->set_name( "ComplexPrimaryNoParenthesis" );
                                 $$->AdoptChildren( $1 );
                              }
                            | AnonymousArrayAccess
                              {
                                 $$ = new NodeAbstract();
                                 $$->set_name( "ComplexPrimaryNoParenthesis" );
                                 $$->AdoptChildren( $1 );
                              }
                            | ArrayAccess
                              {
                                 $$ = new NodeAbstract();
                                 $$->set_name( "ComplexPrimaryNoParenthesis" );
                                 $$->AdoptChildren( $1 );
                              }
                            | Placeholder
                              {
                                 $$ = new NodeAbstract();
                                 $$->set_name( "ComplexPrimaryNoParenthesis" );
                                 $$->AdoptChildren( $1 );
                              }
                            ;
Placeholder  : POUND
               {
                  $$ = new NodeAbstract();
                  $$->set_name( "Placeholder" );
               }
             ;

ArrayAccess :  NotJustName LBRACKET ArraySize RBRACKET
               {
                  $$ = new NodeAbstract();
                  $$->set_name( "ArrayAccess" );
                  $$->MakeSibling( $1 );
                  $$->MakeSibling( $3 );
               }
            |  QualifiedName LBRACKET  ArraySize RBRACKET
               {
                  $$ = new NodeAbstract();
                  $$->set_name( "ArrayAccess" );
                  $$->MakeSibling( $1 );
                  $$->MakeSibling( $3 );
               }
            ;

FieldAccess :  NotJustName PERIOD IDENTIFIER
               {
                  $$ = new NodeAbstract();
                  $$->set_name( "FieldAccess" );
                  $$->MakeSibling( $1 );
                  NodeAbstract *field_name( nullptr );
                  field_name = new NodeAbstract( *$3 );
                  assert( field_name != nullptr );
                  delete( $3 );
                  $$->MakeSibling( field_name );
               }
            ;

MethodCall : QualifiedName LPAREN ArgumentList RPAREN
             {
               $$ = new NodeAbstract();
               $$->set_name( "MethodCall" );
               $$->MakeSibling( $1 );
               $$->MakeSibling( $3 );
             }
           | QualifiedName LPAREN  RPAREN
             {
               $$ = new NodeAbstract();
               $$->set_name( "MethodCall" );
               $$->MakeSibling( $1 );
             }
           | SpecialName PERIOD QualifiedName LPAREN ArgumentList RPAREN
             {
               $$ = new NodeAbstract();
               $$->set_name( "MethodCall" );
               $$->MakeSibling( $1 );
               $$->MakeSibling( $3 );
               $$->MakeSibling( $5 );
             }
           | SpecialName PERIOD QualifiedName LPAREN RPAREN
             {
               $$ = new NodeAbstract();
               $$->set_name( "MethodCall" );
               $$->MakeSibling( $1 );
               $$->MakeSibling( $3 );
             }
           ;

QualifiedName  :  IDENTIFIER
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( *$1 );
                     delete( $1 );
                  }
               |  QualifiedName PERIOD IDENTIFIER
                  {
                     NodeAbstract *node( nullptr );
                     node = new NodeAbstract( *$3 );
                     assert( node != nullptr );
                     $$->MakeSibling( node );
                     delete( $3 );
                  }
               ;


SpecialName     : NILL
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "Nill" );
                  }
                | THIS
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "This" );
                  }
                | SUPER
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "Super" );
                  }
                ;


ArgumentList   :  Expression
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "ArgumentList" );
                     $$->AdoptChildren( $1 );
                  }
               |  ArgumentList COMMA Expression
                  {
                     $1->AdoptChildren( $3 );
                  }   
               ;



ArithmeticUnaryOperator :  PLUS
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "Plus" );
                           }
                        |  MINUS
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "Minus" );
                           }
                        ;

LogicalUnaryExpression  :  PostfixExpression
                           {
                              $$ = $1; 
                           }
                        |  LogicalUnaryOperator UnaryExpression
                           {
                              $1->AdoptChildren( $2 );
                              $$ = $1;
                           }
                        ;

LogicalUnaryOperator :  BANG
                        {
                           $$ = new NodeAbstract();
                           $$->set_name("Tilde");
                        }
                     |  TILDE
                        {
                           $$ = new NodeAbstract();
                           $$->set_name("Tilde");
                        }
                     ;

Literal  :  STR_TOKEN
            {
               $$ = new NodeAbstract();
               $$->set_name( *$1 ); 
               delete( $1 );
            }
         ;

Number   :  INT_TOKEN
            {
               $$ = new NodeAbstract();
               std::stringstream ss;
               ss << $1;
               $$->set_name( ss.str() ); 
            }
         |  FLOAT_TOKEN
            {
               $$ = new NodeAbstract();
               std::stringstream ss;
               ss << $1;
               $$->set_name( ss.str() ); 
            }
         ;

Boolean  :  TRUE
            {
               $$ = new NodeAbstract();
               $$->set_name( "True" );
            }
         |  FALSE
            {
               $$ = new NodeAbstract();
               $$->set_name( "False" );
            }
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
