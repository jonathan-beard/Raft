%skeleton "lalr1.cc"
%require  "3.0"
%debug
%defines
%define   api.namespace       {Raft}
%define   parser_class_name   {Parser}

/* pre-declare classes that are needed for the parser here */
%code requires{
   namespace Raft {
      class Driver;
      class Scanner;
      class Data;
   }
   namespace Node {
      class NodeAbstract;
      class BooleanType;
      class Source;
      class Filename;
      class Initializer;
      class Type;
      class ObjectType;
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
      class AutomaticType;
      class VoidType;
      class ValueBase;
      class Bang;
      class Tilde;
      class Allocation;
      class Returns;
      class UnaryMinus;
      class UnaryPlus;
      class Super;
      class Nill;
      class This;
      class QualifiedName;
      class DelayedName;
      class StreamOption;
      class StreamPropertyList;
      class VariableStreams;
      class Referencing;
      class StreamReferencing;
      class VariableReferencing;
      class MethodReferencing;
      class ArgumentList;
      class StreamArgumentList;
      class MethodArgumentList;
      class ClassDeclaration;
      class Generic;
      class GenericTypeParam;
      class GenericClassParam;
      class GenericTypeMultiple;
      class GenericList;
      class Inherit;
      class Interface;
      class Body;
      class EmptyBody;
      class Visibility;
      class Public;
      class Private;
      class Protected;
      class Access;
      class ArrayAccess;
      class FieldAccess;
      class Parameter;
      class PlaceholderParameter;
      class FieldVarDecl;
      class StorageModifier;
      class Constant;
      class Static;
      class NonAtomic;
      class ClassInitializer;
      class EmptyClassInitializer;
      class ConstructorDeclaration;
      class StreamingMethodDeclaration;
      class Converge;
      class Fork;
      class EmptyStreamModifier;
      class MethodDeclaration;
      class EmptyTypeModifier;
      class MethodInherit;
      class MethodImplements;
      class MethodOverrides;
      class MethodNoInherit;
      class ClassInherit;
      class ClassExtends;
      class ClassNoInherit;
      class ClassImplements;
      class NoParameter;
      class Block;
      class EmptyBlock;
      class StreamEdges; class StreamInput;
      class NoStreamInput;
      class StreamOutput;
      class NoStreamOutput;
      class ParameterList;
      class NoParameterList;
      class SimpleParameter;
      class ArrayParameter;
      class SizedArrayParameter;
      class NoTypeModifier;
      class VariableDeclaration;
      class NoArgumentList;
      class InstantiationModifier;
      class System;
      class Final;
      class Abstract;
      class NoInstantiationModifier;
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
   #include <typeinfo>
   /* include for all driver functions */
   #include "driver.hpp"
   #include "data.hpp"
   #include "common.hpp"
   #include "cpp_output_handler.hpp"
   
   /* nodes */
   #include "NodeAbstract.hpp"
   #include "Source.hpp"
   #include "Declaration.hpp"
   #include "FieldVarDecl.hpp"
   #include "Filename.hpp"
   #include "BooleanType.hpp"
   #include "Initializer.hpp"
   #include "Value.tcc"
   #include "ValueBase.hpp"
   #include "Int8Type.hpp"
   #include "Int16Type.hpp"
   #include "Int32Type.hpp"
   #include "Int64Type.hpp"
   #include "UInt8Type.hpp"
   #include "UInt16Type.hpp"
   #include "UInt32Type.hpp"
   #include "UInt64Type.hpp"
   #include "Float32Type.hpp"
   #include "Float64Type.hpp"
   #include "Float96Type.hpp"
   #include "StringType.hpp"
   #include "ObjectType.hpp"
   #include "Type.hpp"
   #include "AutomaticType.hpp"
   #include "VoidType.hpp"
   #include "Bang.hpp"
   #include "Tilde.hpp"
   #include "Allocation.hpp"
   #include "New.hpp"
   #include "Returns.hpp"
   #include "UnaryPlus.hpp"
   #include "UnaryMinus.hpp"
   #include "Super.hpp"
   #include "Nill.hpp"
   #include "This.hpp"
   #include "QualifiedName.hpp"
   #include "DelayedName.hpp"
   #include "StreamOption.hpp"
   #include "StreamPropertyList.hpp"
   #include "VariableStreams.hpp"
   #include "Referencing.hpp"
   #include "VariableReferencing.hpp"
   #include "MethodReferencing.hpp"
   #include "StreamReferencing.hpp"
   #include "ArgumentList.hpp"
   #include "StreamArgumentList.hpp"
   #include "MethodArgumentList.hpp"
   #include "ClassDeclaration.hpp"
   #include "Generic.hpp"
   #include "GenericTypeParam.hpp"
   #include "GenericClassParam.hpp"
   #include "GenericTypeMultiple.hpp"
   #include "GenericList.hpp"
   #include "Inherit.hpp"
   #include "Interface.hpp"
   #include "Body.hpp"
   #include "EmptyBody.hpp"
   #include "Visibility.hpp"
   #include "Public.hpp"
   #include "Private.hpp"
   #include "Protected.hpp"
   #include "Access.hpp"
   #include "FieldAccess.hpp"
   #include "ArrayAccess.hpp"
   #include "Parameter.hpp"
   #include "PlaceholderParameter.hpp"
   #include "StorageModifier.hpp"
   #include "Constant.hpp"
   #include "NonAtomic.hpp"
   #include "Static.hpp"
   #include "ClassInitializer.hpp"
   #include "EmptyClassInitializer.hpp"
   #include "ConstructorDeclaration.hpp"
   #include "StreamingMethodDeclaration.hpp"
   #include "Converge.hpp"
   #include "Fork.hpp"
   #include "EmptyStreamModifier.hpp"
   #include "MethodDeclaration.hpp"
   #include "EmptyTypeModifier.hpp"
   #include "ClassInherit.hpp"
   #include "ClassNoInherit.hpp"
   #include "ClassExtends.hpp"
   #include "ClassImplements.hpp"
   #include "MethodInherit.hpp"
   #include "MethodNoInherit.hpp"
   #include "MethodOverrides.hpp"
   #include "MethodImplements.hpp"
   #include "NoParameter.hpp"
   #include "Block.hpp"
   #include "EmptyBlock.hpp"
   #include "StreamEdges.hpp"
   #include "StreamInput.hpp"
   #include "StreamOutput.hpp"
   #include "NoStreamInput.hpp"
   #include "NoStreamOutput.hpp"
   #include "ParameterList.hpp"
   #include "NoParameterList.hpp"
   #include "SimpleParameter.hpp"
   #include "ArrayParameter.hpp"
   #include "SizedArrayParameter.hpp"
   #include "VariableDeclaration.hpp"
   #include "NoTypeModifier.hpp"
   #include "NoArgumentList.hpp"
   #include "NoInstantiationModifier.hpp"
   #include "System.hpp"
   #include "Final.hpp"
   #include "Abstract.hpp"
   #include "InstantiationModifier.hpp"

   /* define proper yylex */
   static int yylex(Raft::Parser::semantic_type *yylval,
                    Raft::Scanner               &scanner,
                    Raft::Driver                &driver,
                    Raft::Data                  &data );

   

   using namespace Node;                    
}

/* token types */
%union{
   semantic_type() : sval( nullptr )
   {
      
   }

   /* mostly basic types */
   std::string          *sval;
   bool                 bval;
   uintmax_t            uint_val;
   long double          dval;
   char                 cval;
   /* begin node types */
   Node::NodeAbstract   *node;
   Node::ValueBase      *valnode;
   Node::Type           *typenode;
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
%token       DLBRACKET
%token       DRBRACKET
%token       DLCARROT
%token       DRCARROT
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
%token       STREAMS
%token       LAMBDA
%token       LAMBDAKERNEL
%token       ATPUBLIC
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
%token       THREEDOTS
%token       COMMA  
%token       BOOLEAN  
%token       CHAR
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
%token       FORK
%token       CONVERGE
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
%type    <node>    InterfaceDeclaration
%type    <node>    ClassDeclaration
%type    <node>    Generic
%type    <node>    GenericList
%type    <node>    GenericListA
%type    <node>    Inherit
%type    <node>    InstantModifier
%type    <node>    Body
%type    <typenode>    Type
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
%type    <node>    LocalVariableDeclarationOrStatement
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
%type    <typenode>    AutoType
%type    <typenode>    BoolType
%type    <typenode>    IntType
%type    <typenode>    FloatType
%type    <typenode>    StringType
%type    <typenode>    ObjectType
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
%type    <valnode>    Literal
%type    <valnode>    Number
%type    <valnode>    Boolean
%type    <node>    Block
%type    <node>    StreamInitializers
%type    <node>    StreamInitializer
%type    <node>    StreamInitializersB
%type    <node>    StreamingMethodConstructor
%type    <node>    StreamDeclarator
%type    <node>    StreamReturnDecl
%type    <node>    DelayedName
%type    <node>    StreamCall
%type    <node>    StreamCallPrefixA
%type    <node>    StreamModifiers
%type    <node>    StreamProperties
%type    <node>    StreamPropertyOptions
%type    <node>    StreamPropertyList
%type    <node>    StreamOption
%type    <node>    StorageModifierI

%%
CompilationUnit   :     END
                  |     T
                        {
                           Node::Source *s( nullptr );
                           s = new Node::Source();
                           assert( s != nullptr );
                           driver.set_root( s );
                           s->AdoptChildren( $1 );
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
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "Error" );
                        }
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
                           Node::Filename *f( nullptr );
                           f = new Node::Filename( *$3 );
                           assert( f != nullptr );
                           f->SetOrigin( data );
                           f->set_name( *$3 );
                           
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
                  ;

ClassDeclaration  :     InstantModifier CLASS IDENTIFIER Generic Inherit LBRACE Body RBRACE
                        {
                           NodeAbstract *cls( nullptr );
                           cls = new ClassDeclaration( *$3 );
                           assert( cls != nullptr );
                           delete( $3 );
                           
                           cls->AdoptChildren( $1 );
                           cls->AdoptChildren( $4 );
                           cls->AdoptChildren( $5 );
                           cls->AdoptChildren( $7 );

                           $$ = cls;
                        }
                  |     InstantModifier CLASS IDENTIFIER Generic Inherit LBRACE RBRACE
                        {
                           NodeAbstract *cls( nullptr );
                           cls = new ClassDeclaration( *$3 );
                           assert( cls != nullptr );
                           delete( $3 );

                           cls->AdoptChildren( $1 );
                           cls->AdoptChildren( $4 );
                           cls->AdoptChildren( $5 );

                           $$ = cls;
                        }
                  ;

Generic  :  LCARROT GenericList RCARROT
            { 
               NodeAbstract *gl = new GenericList();
               $$ = gl;
               $$->AdoptChildren( $2 );
            }

         |  {  
               NodeAbstract *gl = new GenericList();
               $$ = gl;
            }
         ;

GenericList :  GenericListA
               {
                  $$ = $1;
               }
            |  GenericList COMMA GenericListA
               {
                  $1->MakeSibling( $3 );
                  $$ = $1;
               }
            ;

GenericListA : CLASS IDENTIFIER
               {
                  NodeAbstract *cl( nullptr );
                  cl = new GenericClassParam( *$2 );
                  delete( $2 );
                  $$ = cl;
               }
            |  Type  IDENTIFIER  TypeModifier
               {
                  NodeAbstract *cl( nullptr );
                  cl = new GenericTypeParam( *$2 );
                  delete( $2 );
                  cl->AdoptChildren( $1 );
                  cl->AdoptChildren( $3 );
                  $$ = cl;
               }
            |  Type IDENTIFIER
               {
                  GenericTypeParam *cl = new GenericTypeParam( *$2 );
                  cl->AdoptChildren( $1 );
                  delete( $2 );
                  $$ = cl;
               }
            |  Type  Initializer
               {
                  NodeAbstract *cl( nullptr );
                  cl = new GenericTypeMultiple();
                  cl->AdoptChildren( $1 );
                  cl->AdoptChildren( $2 );
                  $$ = cl;
               }
            ;


Inherit           :     COLON EXTENDS IDENTIFIER
                        {
                           NodeAbstract *in( nullptr );
                           in = new ClassExtends( *$3 );
                           delete( $3 );
                           $$ = in;
                        }
                  |     COLON IMPLEMENTS IDENTIFIER 
                        {
                           NodeAbstract *in( nullptr );
                           in = new ClassImplements( *$3 );
                           delete( $3 );
                           $$ = in;
                        }
                  |
                        {
                           NodeAbstract *empty( nullptr );
                           empty = new ClassNoInherit();
                           $$ = empty;
                        }
                  ;

InterfaceDeclaration :  INTERFACE IDENTIFIER LBRACE Body RBRACE
                        {
                           NodeAbstract *interface( nullptr );
                           interface = new Interface( *$2 );
                           delete( $2 );
                           interface->AdoptChildren( $4 );
                           $$ = interface;
                        }
                     |  INTERFACE IDENTIFIER LBRACE RBRACE
                        {
                           NodeAbstract *interface( nullptr );
                           interface = new Interface( *$2 );
                           delete( $2 );
                           interface->AdoptChildren( new EmptyBody() );
                           $$ = interface;
                        }
                     ;

Body              :     Visibility
                        {
                           $$ = $1;
                        }
                  |     FieldDeclaration
                        {
                           $$ = $1;
                        }
                  |     Body Visibility
                        {
                           $1->MakeSibling( $2 );
                           $$ = $1;
                        }
                  |     Body FieldDeclaration
                        {
                           $1->MakeSibling( $2 );
                           $$ = $1;
                        }
                  ;


Visibility        :     ATPUBLIC
                        {
                           $$ = new Public();
                        }
                  |     ATPROTECTED
                        {
                           $$ = new Protected();
                        }
                  |     ATPRIVATE
                        {
                           $$ = new Private();
                        }
                  ;

FieldDeclaration  :     FieldVariableDeclaration
                        {
                           $$ = $1;
                        }
                  |     MethodDeclaration
                        {
                           $$ = $1;
                        }
                  |     ConstructorDeclaration
                        {
                           $$ = $1;
                        }
                  |     StreamingMethodConstructor
                        {
                           $$ = $1;
                        }
                  ;


FieldVariableDeclaration  : StorageModifier Type Initializer SEMI
                            {
                              $$ = new FieldVarDecl();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $3 );
                            }
                          | StorageModifier Type Initializer DeclareAndAssignArray SEMI
                            {
                              $$ = new FieldVarDecl();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $3 );
                              $$->AdoptChildren( $4 );
                            }
                          | Type Initializer SEMI
                            {
                              $$ = new FieldVarDecl();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $2 );
                            }
                          | Type Initializer DeclareAndAssignArray SEMI
                            {
                              $$ = new FieldVarDecl();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $3 );
                            }
                          ;

StorageModifier  : StorageModifierI
                 {
                   $$ = $1;
                 }
                 | StorageModifier StorageModifierI
                 {
                   $1->MakeSibling( $2 );
                   $$ = $1;
                 }

StorageModifierI : CONST
                  {
                     $$ = new Constant();
                  }
                 | STATIC
                  {
                     $$ = new Static();
                  }
                 | NONATOMIC
                  {
                     $$ = new NonAtomic();
                  }
                ;


ConstructorDeclaration   : MethodDeclarator Block
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new ConstructorDeclaration();
                              cons->AdoptChildren( $1 );
                              cons->AdoptChildren( new EmptyClassInitializer() );
                              cons->AdoptChildren( $2 );
                              $$ = cons;  
                           }
                         | MethodDeclarator COLON ClassInitializers SEMI
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new ConstructorDeclaration();
                              cons->AdoptChildren( $1 );
                              cons->AdoptChildren( $3 );
                              cons->AdoptChildren( new EmptyBody() );
                              $$ = cons;  
                           }
                         | MethodDeclarator COLON ClassInitializers Block
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new ConstructorDeclaration();
                              cons->AdoptChildren( $1 );
                              cons->AdoptChildren( $3 );
                              cons->AdoptChildren( $4 );
                              $$ = cons;  
                           }
                         ;

StreamingMethodConstructor :  StreamModifiers STREAMS StreamInitializer StreamDeclarator Block
                              {
                                 $$ = $4;
                                 $$->AdoptChildren( $1 );
                                 $$->AdoptChildren( $3 );
                                 $$->AdoptChildren( $5 );
                              }
                           ;

StreamModifiers            : FORK
                             {
                                 $$ = new Fork();
                             }
                           | CONVERGE
                             {
                                 $$ = new Converge();
                             }
                           |
                              {
                                 $$ = new EmptyStreamModifier();
                              }
                           ;

ClassInitializers        : IDENTIFIER LPAREN Expression RPAREN
                           {
                              $$ = new ClassInitializer( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( $3 );
                           }
                         | ClassInitializers COMMA IDENTIFIER LPAREN Expression RPAREN
                           {
                              NodeAbstract *node( new ClassInitializer( *$3 ) );
                              delete( $3 );
                              node->AdoptChildren( $5 );

                              $1 -> AdoptChildren( node );
                              $$ = $1;
                           }
                         ;

MethodDeclaration        : Type TypeModifier MethodDeclarator MethodBody
                           {
                              $$ = $3; /* decl */
                              $$->AdoptChildren( new MethodNoInherit() );
                              $$->AdoptChildren( $1 /* type */ );
                              $$->AdoptChildren( $2 /* modifier */ );
                              $$->AdoptChildren( $4 /* body */ );
                           }
                         | Type MethodDeclarator MethodBody
                           {
                              $$ = $2; /* decl */
                              $$->AdoptChildren( new MethodNoInherit() );
                              $$->AdoptChildren( $1 /* type */ );
                              $$->AdoptChildren( new EmptyTypeModifier() );
                              $$->AdoptChildren( $3 /* body */ );
                           }
                         | IMPLEMENTS Type TypeModifier MethodDeclarator MethodBody
                           {
                              $$ = $4; /* decl */
                              $$->AdoptChildren( new MethodImplements() );
                              $$->AdoptChildren( $2 /* type */ );
                              $$->AdoptChildren( $3 /* modifier */ );
                              $$->AdoptChildren( $5 /* body */ );
                           }
                         | OVERRIDES Type TypeModifier MethodDeclarator MethodBody
                           {
                              $$ = $4; /* decl */
                              $$->AdoptChildren( new MethodOverrides() );
                              $$->AdoptChildren( $2 /* type */ );
                              $$->AdoptChildren( $3 /* modifier */ );
                              $$->AdoptChildren( $5 /* body */ );
                           }
                         ;

MethodBody  :  Block
               {
                  $$ = $1;
               }
            ;

StreamDeclarator  :  IDENTIFIER StreamInitializer
                     {
                        $$ = new StreamingMethodDeclaration( *$1 );
                        delete( $1 );
                        NodeAbstract *temp = new StreamInput();
                        temp->AdoptChildren( $2 );
                        $$->AdoptChildren( temp );
                     }
                  |  IDENTIFIER DLBRACKET DRBRACKET
                     {
                        $$ = new StreamingMethodDeclaration( *$1 );
                        delete( $1 );
                        NodeAbstract *temp = new NoStreamInput();
                        $$->AdoptChildren( temp );
                     }
                  ;


MethodDeclarator         : IDENTIFIER LPAREN ParameterList RPAREN
                           {
                              $$ = new MethodDeclaration( *$1 );
                              delete( $1 );
                              NodeAbstract *temp = new ParameterList();
                              temp->AdoptChildren( $3 );
                              $$->AdoptChildren( temp );
                           }
                         | IDENTIFIER LPAREN RPAREN
                           {
                              $$ = new MethodDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( new NoParameterList() );
                           }
                         ;

ParameterList            : Parameter
                           {
                              $$ = $1;
                           }
                         | ParameterList COMMA Parameter
                           {
                              $1->MakeSibling( $3 );
                              $$ = $1;
                           }  
                         ;

Parameter                : Type  DeclaratorName
                           {
                              $$ = new SimpleParameter();
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $1 );
                           }

                         | Type  DeclaratorName LBRACKET RBRACKET
                           {
                              $$ = new ArrayParameter();
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $1 );
                           }
                         | Type  DeclaratorName LBRACKET ArraySize RBRACKET
                           {
                              $$ = new SizedArrayParameter();
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $4 );
                           }
                         ;

DeclaratorName           : IDENTIFIER
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                           }
                         | BoolInitializer 
                           {
                              $$ = $1;
                           }
                         | ObjectInitializer
                           {
                              $$ = $1;
                           }
                         | NumberInitializer
                           {
                              $$ = $1;
                           }
                         | StrInitializer
                           {
                              $$ = $1;
                           }
                         ;

Block : LBRACE   RBRACE
        {
            $$ = new EmptyBlock();
        }
      |  LBRACE   LocalVariableDeclarationsAndStatements RBRACE
         {
            $$ = new Block();
            $$->AdoptChildren( $2 );
         }
      ;


LocalVariableDeclarationsAndStatements 
   : LocalVariableDeclarationOrStatement
     {   
       $$ = $1;
     }
   | LocalVariableDeclarationsAndStatements LocalVariableDeclarationOrStatement
      {
         $1->MakeSibling( $2 );
         $$ = $1;
      }
   ;

LocalVariableDeclarationOrStatement    :  LocalVariableDeclaration
                                          {
                                           $$ = $1;
                                          }
                                       |  Statement
                                          {
                                           $$ = $1;
                                          }
                                       ;

LocalVariableDeclaration   :  LocalStorageModifier Type Initializer SEMI
                              {
                                 NodeAbstract *var( nullptr );
                                 var = new NodeAbstract();
                                 assert( var != nullptr );
                                 var->set_name( "VarDecl" );

                                 $1->MakeSibling( $2 );
                                 $1->MakeSibling( $3 );

                                 var->AdoptChildren( $1 );

                                 $$ = var;
                              }
                           |  LocalStorageModifier Type Initializer DeclareAndAssignArray SEMI
                              {
                                 NodeAbstract *var( nullptr );
                                 var = new NodeAbstract();
                                 assert( var != nullptr );
                                 var->set_name( "VarDecl" );

                                 $1->MakeSibling( $2 );
                                 $1->MakeSibling( $3 );
                                 $1->MakeSibling( $4 );

                                 var->AdoptChildren( $1 );

                                 $$ = var;
                              }
                           |  Type Initializer SEMI
                              {
                                 NodeAbstract *var( nullptr );
                                 var = new NodeAbstract();
                                 assert( var != nullptr );
                                 
                                 var->set_name( "VarDecl" );
                                 $1->MakeSibling( $2 );
                                 var->AdoptChildren( $1 );
                                 $$ = var;
                              }
                           |  Type Initializer DeclareAndAssignArray SEMI
                              {
                                 NodeAbstract *var( nullptr );
                                 var = new NodeAbstract();
                                 assert( var != nullptr );
                                 
                                 var->set_name( "VarDecl" );
                                 $1->MakeSibling( $2 );
                                 $1->MakeSibling( $3 );
                                 var->AdoptChildren( $1 );
                                 $$ = var;
                              }
                           ;

DeclareAndAssignArray      :  EQUALS LBRACE ArrayListNumber  RBRACE
                              {
                                 NodeAbstract *decl( nullptr );
                                 decl = new NodeAbstract();
                                 assert( decl != nullptr );

                                 decl->set_name( "DeclareAndAssignArrNum" );
                                 
                                 decl->AdoptChildren( $3 );

                                 $$ = decl;
                              }
                           |  EQUALS LBRACE ArrayListLiteral RBRACE
                              {
                                 NodeAbstract *decl( nullptr );
                                 decl = new NodeAbstract();
                                 assert( decl != nullptr );

                                 decl->set_name( "DeclareAndAssignArrLit" );
                                 
                                 decl->AdoptChildren( $3 );

                                 $$ = decl;
                              }
                           ;

ArrayListNumber   : LBRACKET ArraySize RBRACKET EQUALS Number
                     {
                        NodeAbstract *arr( nullptr );
                        arr = new NodeAbstract();
                        assert( arr != nullptr );
                        
                        arr->set_name("Assign");

                        $2->MakeSibling( $5 );
                        arr->AdoptChildren( $2 );
                        $$ = arr;
                     }
                  | ArrayListNumber COMMA LBRACKET ArraySize RBRACKET EQUALS Number
                     {
                        NodeAbstract *arr( nullptr );
                        arr = new NodeAbstract();
                        assert( arr != nullptr );
                        
                        arr->set_name("Assign");

                        $4->MakeSibling( $7 );
                        arr->AdoptChildren( $4 );

                        $1->MakeSibling( arr );

                        $$ = $1;
                     }
                  ;

ArrayListLiteral  :  LBRACKET ArraySize RBRACKET EQUALS Literal
                     {
                        NodeAbstract *arr( nullptr );
                        arr = new NodeAbstract();
                        assert( arr != nullptr );
                        
                        arr->set_name("Assign");

                        $2->MakeSibling( $5 );
                        arr->AdoptChildren( $2 );
                        $$ = arr;
                     }
                  |  ArrayListLiteral COMMA LBRACKET ArraySize RBRACKET EQUALS Literal
                     {
                        NodeAbstract *arr( nullptr );
                        arr = new NodeAbstract();
                        assert( arr != nullptr );
                        
                        arr->set_name("Assign");

                        $4->MakeSibling( $7 );
                        arr->AdoptChildren( $4 );

                        $1->MakeSibling( arr );

                        $$ = $1;
                     }
                  ;

LocalStorageModifier : CONST
                        {
                           NodeAbstract *mod( nullptr );
                           mod = new NodeAbstract();
                           assert( mod != nullptr );

                           mod->set_name("Const" );
                           $$ = mod;
                        }
                     | ATOMIC
                        {
                           NodeAbstract *mod( nullptr );
                           mod = new NodeAbstract();
                           assert( mod != nullptr );

                           mod->set_name("Atomic" );
                           $$ = mod;
                        }
                     |  NONATOMIC
                        {
                           NodeAbstract *mod( nullptr );
                           mod = new NodeAbstract();
                           assert( mod != nullptr );

                           mod->set_name("NonAtomic" );
                           $$ = mod;
                        }
                     ;


Statement   :  EmptyStatement
               {
                  $$ = $1;
               }
            |  ExpressionStatement
               {
                  $$ = $1;
               }
            |  SelectionStatementInit
               {
                  $$ = $1;
               }
            |  IterationStatement
               {
                  $$ = $1;
               }
            |  ReturnStatement
               {
                  $$ = $1;
               }
            |  Block
               {
                  $$ = $1;
               }
            ;

EmptyStatement :  SEMI
                  {
                     NodeAbstract *semi( nullptr );
                     semi = new NodeAbstract();
                     assert( semi != nullptr );

                     semi->set_name( "EmptyStatement" );

                     $$ = semi;
                  }
               ;

ExpressionStatement  :  Expression
                        {
                           $$ = $1;
                        }
                     ;

Expression  :  AssignmentExpression
               {
                  $$ = $1;
               }
            |  MapExpression
               {
                  $$ = $1;   
               }
            ;

SelectionStatementInit  :  
                        IF LPAREN Expression RPAREN Statement ELSE Statement
                        {
                           NodeAbstract *con( nullptr );
                           con = new NodeAbstract();
                           assert( con != nullptr );
                           con->set_name( "IfElseConditional" );
                           
                           /* first will be cond, then true then false */
                           $3->MakeSibling( $5 ); 
                           $3->MakeSibling( $7 );
                           con->AdoptChildren( $3 );

                           $$ = con;
                        }
                    |   IF LPAREN Expression RPAREN Statement
                        {
                           NodeAbstract *con( nullptr );
                           con = new NodeAbstract();
                           assert( con != nullptr );
                           con->set_name( "IfConditional" );
                           
                           $3->MakeSibling( $5 );

                           con->AdoptChildren( $3 );

                           $$ = con;
                        }
                    ;

IterationStatement   :  WHILE LPAREN Expression RPAREN Statement
                        {
                           NodeAbstract *wh( nullptr );
                           wh = new NodeAbstract();
                           assert( wh != nullptr );

                           wh->set_name( "WhileStatement" );

                           $3->MakeSibling( $5 );

                           wh->AdoptChildren( $3 );

                           $$ = wh;
                        }
                     |  ForIterationStatement
                        {
                           $$ = $1;
                        }
                     ;

ForIterationStatement : BasicFor
                        {
                           $$ = $1;
                        }
                      ;

BasicFor :  FOR LPAREN InitFor RelationalExpression SEMI AssignmentExpression RPAREN ForStatement
            {
               NodeAbstract *f( nullptr );
               f = new NodeAbstract();
               assert( f != nullptr );

               f->set_name( "BasicFor" );

               $3->MakeSibling( $4 );
               $3->MakeSibling( $6 );
               $3->MakeSibling( $8 );

               f->AdoptChildren( $3 );
               $$ = f;
            }
         ;

ForStatement   :  LBRACE Statement RBRACE
                  {
                     NodeAbstract *st( nullptr );
                     st = new NodeAbstract();
                     assert( st != nullptr );

                     st->set_name( "ForStatement" );

                     st->AdoptChildren( $2 );

                     $$ = st;
                  }
               |  SEMI
                  {
                     NodeAbstract *st( nullptr );
                     st = new NodeAbstract();
                     assert( st != nullptr );

                     st->set_name( "EmptyForStatement" );
                     $$ = st;
                  }
               |  LBRACE RBRACE
                  {
                     NodeAbstract *st( nullptr );
                     st = new NodeAbstract();
                     assert( st != nullptr );

                     st->set_name( "EmptyForStatement" );
                     $$ = st;
                  }
               ;

MapExpression   :    Expression AT FORWARDSLASH Expression
                     {
                        NodeAbstract *map( nullptr );
                        map = new NodeAbstract();
                        assert( map != nullptr );
                        
                        map->set_name( "MapExpression" );

                        $1->MakeSibling( $4 );
                        map->AdoptChildren( $1 );

                        $$ = map;
                     }
                ;

InitFor  :  LocalVariableDeclaration
            {
               $$ = new NodeAbstract();
               $$->set_name( "InitFor" );
               $$->AdoptChildren( $1 );
            }
         ;

ReturnStatement   :  RETURN SEMI
                     {
                        NodeAbstract *ret( nullptr );
                        ret = new NodeAbstract();
                        assert( ret != nullptr );

                        ret->set_name( "Return" );
                        $$ = ret;
                     }
                  |  RETURN LPAREN Expression RPAREN SEMI
                     {
                        NodeAbstract *ret( nullptr );
                        ret = new NodeAbstract();
                        assert( ret != nullptr );

                        ret->set_name( "Return" );
                        assert( $3 != nullptr );
                        ret->AdoptChildren( $3 );
                        
                        $$ = ret;
                     }
                  ;


StreamInitializer: DLBRACKET StreamInitializers DRBRACKET
                     {  
                        NodeAbstract *node( nullptr );
                        node = new NodeAbstract();
                        assert( node != nullptr );
                        node->set_name( "ReturnStreamInitializer" );
                        
                        node->AdoptChildren( $2 );
                        $$ = node;
                     }  
                  ;

StreamInitializers   :  VOID  
                     {
                        NodeAbstract *v( nullptr );
                        v = new NodeAbstract();
                        assert( v != nullptr );
                        v->set_name("NoStream");
                        $$ = v;
                     }
                     |  StreamInitializersB
                     {
                        $$ = $1;
                     }
                  ;

StreamInitializersB  : StreamReturnDecl
                     {
                        $$ = $1;
                     }
                     | StreamInitializers COMMA THREEDOTS
                     {
                        NodeAbstract *varargs( nullptr );
                        varargs = new NodeAbstract();
                        varargs->set_name( "ThreeDots" );
                        varargs->AdoptChildren( $1 );
                        $$ = varargs;
                     }
                     |  StreamInitializers COMMA StreamReturnDecl
                     {
                        $$->MakeSibling( $3 );
                     }
                     ;


StreamReturnDecl : Type TypeModifier IDENTIFIER
                   {
                     $$ = new NodeAbstract();
                     $$->set_name( *$3 );
                     $$->AdoptChildren( $1 );
                     $$->AdoptChildren( $2 );
                     delete( $3 );
                   }
                 | Type IDENTIFIER
                   {
                     $$ = new NodeAbstract();
                     $$->set_name( *$2 );
                     delete( $2 );
                   }
                 | Type IDENTIFIER LBRACKET RBRACKET
                   {
                     $$ = new NodeAbstract();
                     $$->set_name( *$2 );
                     delete( $2 );
                     $$->AdoptChildren( $1 );
                   }
                 | Type IDENTIFIER LBRACKET ArraySize RBRACKET
                   {
                     $$ = new NodeAbstract();
                     $$->set_name( *$2 );
                     delete( $2 );
                     $$->AdoptChildren( $1 );
                     $$->AdoptChildren( $4 );
                   }
                 ;

Initializer :  MultiBoolInit
               {
                  $$ = $1;
               }
            |  MultiNumberInit
               {
                  NodeAbstract *ini( nullptr );
                  ini = new NodeAbstract();
                  assert( ini != nullptr );

                  ini->set_name( "NumberInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            |  MultiStringInit
               {
                  NodeAbstract *ini( nullptr );
                  ini = new NodeAbstract();
                  assert( ini != nullptr );
                  
                  ini->set_name( "StringInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            |  MultiObjectInit
               {
                  NodeAbstract *ini( nullptr );
                  ini = new NodeAbstract();
                  assert( ini != nullptr );

                  ini->set_name( "ObjectInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            ;


MultiBoolInit            : MultiBoolInit  COMMA BoolInitializer
                           {
                              $1->MakeSibling( $3 );
                              $$ = $1;
                           }
                         | BoolInitializer
                           {
                              $$ = $1;
                           }
                         ;

BoolInitializer          : IDENTIFIER TypeModifier LPAREN Boolean RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $4 );
                           }
                         | IDENTIFIER LPAREN Boolean RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( new NoTypeModifier() );
                              $$->AdoptChildren( $3 );
                           }
                       | IDENTIFIER TypeModifier LPAREN LogicalUnaryExpression RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $4 );
                           }
                         
                       | IDENTIFIER LPAREN LogicalUnaryExpression RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( new NoTypeModifier() );
                              $$->AdoptChildren( $3 );
                           }
                         ;

MultiObjectInit          : MultiObjectInit COMMA ObjectInitializer
                           {
                              $1->MakeSibling( $3 );
                              $$ = $1;
                           }
                         | ObjectInitializer
                           {
                              $$ = $1;
                           }
                         ;

ObjectInitializer        : IDENTIFIER TypeModifier LPAREN ArgumentList RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $4 );
                           }
                         | IDENTIFIER LPAREN ArgumentList RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( new NoTypeModifier() );
                              $$->AdoptChildren( $3 );
                           }
                         ;

MultiNumberInit          : MultiNumberInit COMMA NumberInitializer
                           {
                              $1->MakeSibling( $3 );
                              $$ = $1;
                           }
                         | NumberInitializer
                           {
                              $$ = $1;
                           }
                         ;

NumberInitializer        : IDENTIFIER TypeModifier LPAREN Expression RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $4 );
                           }
                         | IDENTIFIER LPAREN Expression RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( new NoTypeModifier() );
                              $$->AdoptChildren( $3 );
                           }
                         ;

MultiStringInit          : MultiStringInit COMMA StrInitializer
                           {
                              $1->MakeSibling( $3 );
                              $$ = $1;
                           }
                         | StrInitializer
                           {
                              $$ = $1;
                           }
                         ;

StrInitializer           : IDENTIFIER  TypeModifier LPAREN Literal RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $4 );
                           }
                         | IDENTIFIER LPAREN Literal RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( new NoTypeModifier() );
                              $$->AdoptChildren( $3 );
                           }
                         ;

InstantModifier   :     FINAL SYSTEM
                        {
                           $$ = new Final();
                           $$->MakeSibling( new System() );
                        }
                  |     FINAL
                        {
                           $$ = new Final();
                        }
                  |     ABSTRACT
                        {
                           $$ = new Abstract();
                        }
                  |     
                        {
                           $$ = new NoInstantiationModifier();
                        }
                  ;



Type  :  BoolType
         {
            $$ = $1;
         }
      |  IntType
         {
            $$ = $1;
         }
      |  FloatType
         {
            $$ = $1;
         }
      |  StringType
         {
            $$ = $1;
         }
      |  ObjectType
         {
            $$ = $1;
         }
      |  AutoType
         {
            $$ = $1;
         }
      |  VOID
         {
            $$ = new VoidType();
         }
      ;

AutoType          :     AUTO
                        {
                           $$ = new Node::AutomaticType();
                        }
                  ;

BoolType          :     BOOLEAN
                        { 
                           $$ = new BooleanType();
                        }
                  ;


IntType           :     INT8T
                        { 
                           $$ = new Int8Type();
                        }
                  |     INT16T
                        { 
                           $$ = new Int16Type();
                        }
                  |     INT32T
                        {
                           $$ = new Int32Type();
                        }
                  |     INT64T
                        { 
                           $$ = new Int64Type();
                        }
                  |     UINT8T
                        { 
                           $$ = new UInt8Type();
                        }
                  |     UINT16T
                        { 
                           $$ = new UInt16Type();
                        }
                  |     UINT32T
                        {
                           $$ = new UInt32Type();
                        }
                  |     UINT64T
                        { 
                           $$ = new UInt64Type();
                        }
                        ;
FloatType         :     FLOAT32
                        { 
                           $$ = new Float32Type();
                        }
                  |     FLOAT64
                        { 
                           $$ = new Float64Type();
                        }
                  |     FLOAT96
                        { 
                           $$ = new Float96Type();
                        }
                  ;

StringType        :     STRING
                        {
                           $$ = new StringType();
                        }
                  ;

ObjectType        :     QualifiedName
                        {
                           $$ = new ObjectType( "ObjectType" );
                           $$->AdoptChildren( $1 );
                        }
                  ;

TypeModifier      :     LBRACKET ArraySize RBRACKET
                        {
                           $$ = new NoGenericInstantiation();
                           NodeAbstract *n( new DynamicArray() );
                           n->AdoptChildren( $2 );
                           $$->MakeSibling( n );
                        }
                  |     LBRACKET RBRACKET /* dynamic array */
                        {
                           $$ = new NoGenericInstantiation();
                           NodeAbstract *n( new DynamicArray() );
                           n->AdoptChildren( new NoSizeParameter() );
                           $$->MakeSibling( n );
                        }
                  |     LCARROT GenericInstantiationList RCARROT LBRACKET ArraySize RBRACKET
                        {
                           $$ = new GenericInstantiationList();
                           NodeAbstract *n( new DynamicArray() );
                           n->AdoptChildren( $5 );
                           $$ -> AdoptChildren( n );
                        }
                  |     LCARROT GenericInstantiationList RCARROT
                        {  
                           $$ = new GenericInstantiationList();
                           NodeAbstract *n( new NoDynamicArray() );
                           n->AdoptChildren( new NoSizeParameter() );
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( n );
                        }     
                  |     LCARROT GenericInstantiationList RCARROT LBRACKET RBRACKET
                        {
                           //TODO come back here
                           $$ = new GenericInstantiationList();
                        }
                  ;

GenericInstantiationList : IDENTIFIER EQUALS AllowedGenericInstTypes
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "GenericInstantiation" );
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              NodeAbstract *eq( nullptr );
                              eq = new NodeAbstract();
                              assert( eq != nullptr );
                              eq->set_name( "=" );
                              eq->AdoptChildren( id );
                              eq->AdoptChildren( $3 );
                              $$->AdoptChildren( eq );
                           }
                         | GenericInstantiationList COMMA IDENTIFIER EQUALS AllowedGenericInstTypes
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "GenericInstantiationList" );
                              
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              
                              id->set_name( *$3 );
                              delete( $3 );

                              NodeAbstract *eq( nullptr );
                              eq = new NodeAbstract();
                              assert( eq != nullptr );
                              eq->set_name( "=" );

                              eq->AdoptChildren( id );
                              eq->AdoptChildren( $5 );

                              $1->MakeSibling( eq );
                              $$->AdoptChildren( $1 );
                           }
                         ;

AllowedGenericInstTypes : QualifiedName
                          {
                              /** 
                               * qn allows instantiations like
                               * a.b to reference fields within
                               * other classes
                               */
                              $$ = $1;
                          }
                        | Literal
                          {
                              $$ = $1;
                          }
                        | Number
                          {
                              $$ = $1;
                          }
                        | Boolean
                          {
                              $$ = $1;
                          }
                        ;

ArraySize         :     ArraySize COMMA INT_TOKEN
                        {
                           NodeAbstract *size( nullptr );
                           size = new NodeAbstract();
                           assert( size != nullptr );
                           std::stringstream ss;
                           ss << $3;
                           size->set_name( ss.str() );
                           $1->MakeSibling( size );
                           $$ = $1;
                        }
                  |     INT_TOKEN
                        {
                           NodeAbstract *size( nullptr );
                           size = new NodeAbstract();
                           assert( size != nullptr );
                           std::stringstream ss;
                           ss << $1;
                           size->set_name( ss.str() );
                           $$ = size;
                        }
                  ;



AssignmentExpression :  ConditionalExpression
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "AssignmentExpression - Cond" );
                           $$->AdoptChildren( $1 );
                        }
                     |  UnaryExpression AssignmentOperator
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "AssignmentExpression - Op" );
                           $2->MakeSibling( $1 );
                           $$->AdoptChildren( $2 );
                        }
                     |  UnaryExpression INCREMENT
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "Increment" );
                           $$->AdoptChildren( $1 );
                        }
                     |  UnaryExpression DECREMENT
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "Decrement" );
                           $$->AdoptChildren( $1 );
                        }
                     ;

AssignmentOperator   :  EQUALS
                        {
                           NodeAbstract *equals( nullptr );
                           equals = new NodeAbstract();
                           assert( equals != nullptr );
                           equals->set_name( "Ass_equals" );
                           $$ = equals;
                        }
                     |  ASS_PLUS
                        {
                           NodeAbstract *plus( nullptr );
                           plus = new NodeAbstract();
                           assert( plus != nullptr );
                           plus->set_name( "Ass_plus" );
                           $$ = plus;
                        }
                     |  ASS_MINUS
                        {
                           NodeAbstract *minus( nullptr );
                           minus = new NodeAbstract();
                           assert( minus != nullptr );
                           minus->set_name( "Ass_minus" );
                           $$ = minus;
                        }
                     ;

ConditionalExpression   :  ConditionalOrExpression
                           {
                              $$ = $1;
                           }
       |  ConditionalOrExpression QUESTION Expression COLON Expression
          {
            $1->AdoptChildren( $3 );
            $1->AdoptChildren( $5 );
            $$ = $1;
          }
       ;

ConditionalOrExpression :  ConditionalAndExpression
                           {
                              $$ = $1;
                           }
                        |  ConditionalOrExpression OP_LOR ConditionalAndExpression
                           {
                              NodeAbstract *lor( nullptr );
                              lor = new NodeAbstract();
                              assert( lor != nullptr );
                              lor->set_name( "OP_LOR" );
                              lor->AdoptChildren( $1 );
                              lor->AdoptChildren( $3 );
                              $$ = lor;
                           }
                        ;

ConditionalAndExpression   :  InclusiveOrExpression
                              {
                                 $$ = $1;
                              }
                          |  ConditionalAndExpression OP_LAND InclusiveOrExpression
                           {  
                              NodeAbstract *land( nullptr );
                              land = new NodeAbstract();
                              assert( land != nullptr );
                              land->set_name( "OP_LAND" );
                              land->AdoptChildren( $1 );
                              land->AdoptChildren( $3 );
                              $$ = land;
                           }  
                          ;

InclusiveOrExpression   :  ExclusiveOrExpression
                           {
                              $$ = $1;
                           }
                        |  InclusiveOrExpression OR ExclusiveOrExpression
                           {  
                              NodeAbstract *node( nullptr );
                              node = new NodeAbstract();
                              assert( node != nullptr );
                              node->set_name( "OR" );
                              node->AdoptChildren( $1 );
                              node->AdoptChildren( $3 );
                              $$ = node;
                           }  
                        ;

ExclusiveOrExpression   :  AndExpression
                           {
                              $$ = $1;
                           }
                        |  ExclusiveOrExpression HAT AndExpression
                           {  
                              NodeAbstract *hat( nullptr );
                              hat = new NodeAbstract();
                              assert( hat != nullptr );
                              hat->set_name( "^" );
                              hat->AdoptChildren( $1 );
                              hat->AdoptChildren( $3 );
                              $$ = hat;
                           }  
                        ;

AndExpression           :  EqualityExpression
                           {
                              $$ = $1;
                           }
                        |  AndExpression  AND   EqualityExpression
                           {
                              NodeAbstract *node( nullptr );
                              node = new NodeAbstract();
                              assert( node != nullptr );
                              node->set_name( "AND" );
                              node->AdoptChildren( $1 );
                              node->AdoptChildren( $3 );
                              $$ = node;
                           }
                        ;

EqualityExpression      :  RelationalExpression
                           {
                              $$ = $1;
                           }
                        |  EqualityExpression   OP_EQ RelationalExpression
                           {  
                              NodeAbstract *eq( nullptr );
                              eq = new NodeAbstract();
                              assert( eq != nullptr );
                              eq->set_name( "EqualityExpression ==" );
                              eq->AdoptChildren( $1 );
                              eq->AdoptChildren( $3 );
                              $$ = eq;
                           }  
                        |  EqualityExpression   OP_NE RelationalExpression
                           {  
                              NodeAbstract *ne( nullptr );
                              ne = new NodeAbstract();
                              assert( ne != nullptr );
                              ne->set_name( "EqualityExpression !=" );
                              ne->AdoptChildren( $1 );
                              ne->AdoptChildren( $3 );
                              $$ = ne;
                           }  
                        ;

RelationalExpression    :  ShiftExpression
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "RelationalExpression" );
                              $$->AdoptChildren( $1 );
                           }
                        |  RelationalExpression RCARROT ShiftExpression
                           {
                              NodeAbstract *carrot( nullptr );
                              carrot = new NodeAbstract();
                              assert( carrot != nullptr );
                              carrot->set_name( "RelationalExpression - >" );
                              carrot->AdoptChildren( $1 );
                              carrot->AdoptChildren( $3 );
                              $$ = carrot;
                           }
                        |  RelationalExpression LCARROT ShiftExpression
                           {
                              NodeAbstract *carrot( nullptr );
                              carrot = new NodeAbstract();
                              assert( carrot != nullptr );
                              carrot->set_name( "RelationalExpression - <" );
                              carrot->AdoptChildren( $1 );
                              carrot->AdoptChildren( $3 );
                              $$ = carrot;
                           }
                        |  RelationalExpression OP_LE ShiftExpression
                           {
                              NodeAbstract *le( nullptr );
                              le = new NodeAbstract();
                              assert( le != nullptr );
                              le->set_name( "RelationalExpression - <=" );
                              le->AdoptChildren( $1 );
                              le->AdoptChildren( $3 );
                              $$ = le;
                           }
                        |  RelationalExpression OP_GE ShiftExpression
                           {
                              NodeAbstract *ge( nullptr );
                              ge = new NodeAbstract();
                              assert( ge != nullptr );
                              ge->set_name( "RelationalExpression - >=" );
                              ge->AdoptChildren( $1 );
                              ge->AdoptChildren( $3 );
                              $$ = ge;
                           }
                        ;

ShiftExpression         :  AdditiveExpression
                           {
                              $$ = new NodeAbstract();
                              $$->set_name( "ShiftExpression" );
                              $$->AdoptChildren( $1 );
                           }
                        ;

AdditiveExpression      :  MultiplicativeExpression
                           {
                              $$ = $1;
                           }
                        |  AdditiveExpression   PLUS MultiplicativeExpression
                           {
                              NodeAbstract *plus( nullptr );
                              plus = new NodeAbstract();
                              assert( plus != nullptr );
                              plus->set_name( "AdditiveExpression - '-'" );
                              plus->AdoptChildren( $1 );
                              plus->AdoptChildren( $3 );
                              $$ = plus;
                           }
                        |  AdditiveExpression   MINUS MultiplicativeExpression
                           {
                              NodeAbstract *minus( nullptr );
                              minus = new NodeAbstract();
                              assert( minus != nullptr );
                              minus->set_name( "AdditiveExpression - '-'" );
                              minus->AdoptChildren( $1 );
                              minus->AdoptChildren( $3 );
                              $$ = minus;
                           }
                        ;

MultiplicativeExpression   :  CastExpression
                           {
                              $$ = $1;
                           }
                    |   MultiplicativeExpression   ASTERICK CastExpression
                           {
                              NodeAbstract *ast( nullptr );
                              ast = new NodeAbstract();
                              assert( ast != nullptr );
                              ast->set_name( "MultiplicativeExpression - *" );
                              ast->AdoptChildren( $1 );
                              ast->AdoptChildren( $3 );
                              $$ = ast;
                           }
              |   MultiplicativeExpression   FORWARDSLASH   CastExpression
                           {
                              NodeAbstract *slash( nullptr );
                              slash = new NodeAbstract();
                              assert( slash != nullptr );
                         slash->set_name( "MultiplicativeExpression - /" );
                              slash->AdoptChildren( $1 );
                              slash->AdoptChildren( $3 );
                              $$ = slash;
                           }
                       |   MultiplicativeExpression   PERCENT   CastExpression
                           {
                              NodeAbstract *percent( nullptr );
                              percent = new NodeAbstract();
                              assert( percent != nullptr );
                              percent->set_name( "MultiplicativeExpression - %" );
                              percent->AdoptChildren( $1 );
                              percent->AdoptChildren( $3 );
                              $$ = percent;
                           }
                        | MultiplicativeExpression DLCARROT CastExpression
                        | MultiplicativeExpression DRCARROT CastExpression
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
                        $$ = $1;
                     }
                  |  ArithmeticUnaryOperator CastExpression
                     {
                        $$ = $1;
                        $$->AdoptChildren( $2 );
                     }
                  ;

PostfixExpression :  PrimaryExpression
                     {
                        $$ = $1;
                     }
                  ;

PrimaryExpression :  QualifiedName
                     {
                        $$ = $1;
                     }
                  |  NotJustName
                     {
                        $$ = $1; 
                     }
                  |  DelayedName
                     {
                        $$ = $1;
                     }
                  ;



AllocationExpression :  ALLOC Type LPAREN   ArgumentList   RPAREN
                        {
                           $$ = new Allocation();
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( $4 );
                        }
                     |  ALLOC Type LBRACKET Expression RBRACKET
                        {
                           $$ = new Allocation();
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( $4 );
                        }
                     |  ALLOC Type LPAREN  RPAREN
                        {
                           $$ = new Allocation();
                           $$->AdoptChildren( $2 );
                        }
                     |  NEW Type LPAREN ArgumentList RPAREN
                        {
                           $$ = new New();
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( $4 );
                        }
                     |  NEW Type LPAREN RPAREN
                        {
                           $$ = new New();
                           $$->AdoptChildren( $2 );
                        }
                     |  NEW Type LBRACKET Expression RBRACKET
                        {
                           $$ = new New();
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( $4 );
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
                     $$ = $2;
                  }
               |  ComplexPrimaryNoParenthesis
                  {
                     $$ = $1;
                  }
               ;

ComplexPrimaryNoParenthesis : Literal
                              {
                                 $$ = $1;
                              }
                            | Number
                              {
                                 $$ = $1;
                              }
                            | FieldAccess
                              {
                                 $$ = $1;
                              }
                            | MethodCall
                              {
                                 $$ = $1;
                              }
                            | StreamCall
                              {
                                 $$ = $1;
                              }
                            | ArrayAccess
                              {
                                 $$ = $1;
                              }
                            | Placeholder
                              {
                                 $$ = $1;
                              }
                            ;
Placeholder  : POUND
               {
                  $$ = new PlaceholderParameter();
               }
             ;

ArrayAccess :  NotJustName LBRACKET ArraySize RBRACKET
               {
                  $$ = new ArrayAccess();
                  $$->AdoptChildren( $1 );
                  $$->AdoptChildren( $3 );
               }
            |  QualifiedName LBRACKET  ArraySize RBRACKET
               {
                  $$ = new ArrayAccess();
                  $$->AdoptChildren( $1 );
                  $$->AdoptChildren( $3 );
               }
            |  DelayedName LBRACKET ArraySize RBRACKET
               {
                  $$ = new ArrayAccess();
                  $$->AdoptChildren( $1 );
                  $$->AdoptChildren( $3 );
               }
            ;

FieldAccess :  NotJustName PERIOD IDENTIFIER
               {
                  $$ = new FieldAccess( *$3 );
                  delete( $3 );
                  $$->AdoptChildren( $1 );
               }
            ;

MethodCall : QualifiedName LPAREN ArgumentList RPAREN
             {
               $$ = new MethodReferencing();
               ArgumentList *al = new MethodArgumentList();
               al->AdoptChildren( $3 );
               $$->AdoptChildren( $1 );
               $$->AdoptChildren( al );
             }
           | QualifiedName LPAREN  RPAREN
             {
               $$ = new MethodReferencing();
               ArgumentList *al = new MethodArgumentList();
               $$->AdoptChildren( $1 );
               $$->AdoptChildren( al );
             }
           | SpecialName PERIOD QualifiedName LPAREN ArgumentList RPAREN
             {
               $$ = new MethodReferencing();
               $1->MakeSibling( $3 );
               ArgumentList *al = new MethodArgumentList();
               al->AdoptChildren( $5 );
               $$->AdoptChildren( $1 );
               $$->AdoptChildren( al );
             }
           | SpecialName PERIOD QualifiedName LPAREN RPAREN
             {
               $$ = new MethodReferencing();
               $1->MakeSibling( $3 );
               ArgumentList *al = new MethodArgumentList();
               $$->AdoptChildren( $1 );
               $$->AdoptChildren( al );
             }
           ;


StreamCall :StreamCallPrefixA DLBRACKET ArgumentList DRBRACKET
            {
               $$ = new StreamReferencing();
               $$->AdoptChildren( $1 );
               ArgumentList *al = new StreamArgumentList();
               al->AdoptChildren( $3 );
               $$->AdoptChildren( al );
            }
           | StreamCallPrefixA DLBRACKET DRBRACKET
            {
               $$ = new StreamReferencing();
               $$->AdoptChildren( $1 );
               ArgumentList *al = new StreamArgumentList();
               $$->AdoptChildren( al );
            }
     | SpecialName PERIOD QualifiedName DLBRACKET ArgumentList DRBRACKET
            {
               $$ = new StreamReferencing();
               assert( $$ != nullptr );
               $1->MakeSibling( $3 );
               ArgumentList *al = new StreamArgumentList();
               assert( al != nullptr );
               al->AdoptChildren( $5 );
               al->AdoptChildren( $1 );
               $$->MakeSibling( al );
            }
           | SpecialName PERIOD QualifiedName DLBRACKET DRBRACKET
            {
               $$ = new StreamReferencing();
               assert( $$ != nullptr );
               ArgumentList *al = new StreamArgumentList();
               $1->MakeSibling( $3 );
               $$->AdoptChildren( $1 );
               $$->AdoptChildren( al );
            }
           ;

StreamCallPrefixA : StreamProperties QualifiedName StreamProperties
                    {
                       $$ = new StreamReferencing();
                       assert( $$ != nullptr );
                       $$->AdoptChildren( $1 );
                       $$->AdoptChildren( $2 );
                       $$->AdoptChildren( $3 );
                    }
                  | QualifiedName StreamProperties
                    {
                       $$ = new StreamReferencing();
                       assert( $$ != nullptr );
                       $$->AdoptChildren( $1 );
                       $$->AdoptChildren( $2 );
                    }
                  | StreamProperties QualifiedName
                    {
                       $$ = new StreamReferencing();
                       assert( $$ != nullptr );
                       $$->AdoptChildren( $1 );
                       $$->AdoptChildren( $2 );
                    }
                  | QualifiedName
                    {
                        $$ = new StreamReferencing();
                        assert( $$ != nullptr );
                        $$->AdoptChildren( $1 );
                    }
                  ;

StreamProperties   : LCARROT StreamPropertyOptions RCARROT
                     {
                        StreamPropertyList *vs( nullptr );
                        vs = new StreamPropertyList();
                        assert( vs != nullptr );
                        vs->AdoptChildren( $2 );
                        $$ = vs;
                     }
                  ;

StreamPropertyOptions :  THREEDOTS
                         {
                           VariableStreams *vs = new 
                                          VariableStreams();
                           assert( vs != nullptr );
                           $$ = vs;
                         }
                      |  StreamPropertyList
                         {
                           $$ = $1;
                         }
                      |  THREEDOTS COMMA StreamPropertyList
                         {
                           VariableStreams *vs = new 
                                          VariableStreams();
                           assert( vs != nullptr );
                           vs->MakeSibling( $3 );
                           $$ = vs;
                         }
                      ;

StreamPropertyList   : StreamOption
                       {
                           $$ = $1;
                       }
                     | StreamPropertyList COMMA StreamOption
                       {
                           $1->MakeSibling( $3 );
                           $$ = $1;
                       }
                     ;

StreamOption         :  QualifiedName  EQUALS Literal
                        {
                           $$ = new StreamOption();
                           $$->AdoptChildren( $1 );
                           $$->AdoptChildren( $3 );
                        }
                     |  QualifiedName  EQUALS Number
                        {
                           $$ = new StreamOption();
                           $$->AdoptChildren( $1 );
                           $$->AdoptChildren( $3 );
                        }
                     |  QualifiedName  EQUALS Boolean
                        {
                           $$ = new StreamOption();
                           $$->AdoptChildren( $1 );
                           $$->AdoptChildren( $3 );
                        }
                     ;

DelayedName    :  DOLLAR
                  {
                     $$ = new DelayedName();
                     assert( $$ != nullptr );
                  }
               ;

QualifiedName  :  IDENTIFIER
                  {
                     $$ = new QualifiedName( *$1 );
                     assert( $$ != nullptr );
                     delete( $1 );
                  }
               |  QualifiedName PERIOD IDENTIFIER
                  {
                     QualifiedName *qn = new QualifiedName( *$3 );
                     assert( qn != nullptr );
                     delete( $3 );
                     $1->MakeSibling( qn );
                     $$ = $1;
                  }
               ;


SpecialName     : NILL
                  {
                     $$ = new Nill();
                  }
                | THIS
                  {
                     $$ = new This();
                  }
                | SUPER
                  {
                     $$ = new Super();
                  }
                ;


ArgumentList   :  Expression
                  {
                     $$ = $1;
                  }
               |  ArgumentList COMMA Expression
                  {
                     $1->MakeSibling( $3 );
                     $$ = $1;
                  }   
               ;



ArithmeticUnaryOperator :  PLUS
                           {
                              $$ = new UnaryPlus();
                           }
                        |  MINUS
                           {
                              $$ = new UnaryMinus();
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
                           $$ = new Bang();
                        }
                     |  TILDE
                        {
                           $$ = new Tilde();
                        }
                     ;

Literal  :  STR_TOKEN
            {
               ValueBase *value = new Value<std::string>( *$1 );
               assert( value != nullptr );
               $$ = value;
               delete( $1 );
            }
         ;

Number   :  INT_TOKEN
            {
               ValueBase *value = new Value<uintmax_t>( $1 );
               assert( value != nullptr );
               $$ = value;
            }
         |  FLOAT_TOKEN
            {
               ValueBase *value = new Value<long double>( $1 );
               assert( value != nullptr );
               $$ = value;
            }
         ;

Boolean  :  TRUE
            {
               ValueBase *value = new Value<bool>( true );
               assert( value != nullptr );
               $$ = value;
            }
         |  FALSE
            {
               ValueBase *value = new Value<bool>( false );
               assert( value != nullptr );
               $$ = value;
            }
         ;
                        
%%

void 
Raft::Parser::error( const std::string &err_message )
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
