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
      class NoStorageModifier;
      class Constant;
      class Static;
      class NonAtomic;
      class Atomic;
      class Synchronized;
      class Unsynchronized;
      class ClassInitializer;
      class EmptyClassInitializer;
      class ConstructorDeclaration;
      class StreamingMethodDeclaration;
      class Converge;
      class Fork;
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
      class StreamEdges; 
      class StreamInput;
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
      class DynamicArray;
      class NoSizeParameter;
      class NoDynamicArray;
      class GenericInstantiationList;
      class NoGenericInstantiation;
      class GenericInstantiation;
      class Assignment;
      class Equals;
      class ArraySize;
      class Increment;
      class Decrement;
      class AssPlus;
      class AssMinus;
      class Plus;
      class Minus;
      class CondOp;
      class LOROp;
      class LANDOp;
      class OrOp;
      class HatOp;
      class AndOp;
      class EqualityOp;
      class EqualOp;
      class NotEqualOp;
      class GreaterThanOp;
      class LessThanOp;
      class LessEqualOp;
      class GreaterEqualOp;
      class MultOp;
      class DivOp;
      class ModOp;
      class LeftShiftOp;
      class RightShiftOp;
      class TypeCastExpression;
      class Free;
      class ModOp;
      class AllOthersInArray;
      class ArrayInitialization;
      class BoolArrayInitialization;
      class NumArrayInitialization;
      class StrArrayInitialization;
      class ArraySlice;
      class EmptyStatement;
      class Statement;
      class IfStatement;
      class WhileStatement;
      class ForStatement;
      class MapStatement;
      class LocalVarDecl;
      class MethodReturns;
      class NoMethodModifier;
      class Streams;
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
   #include "NoStorageModifier.hpp"
   #include "Constant.hpp"
   #include "NonAtomic.hpp"
   #include "Atomic.hpp"
   #include "Synchronized.hpp"
   #include "Unsynchronized.hpp"
   #include "Static.hpp"
   #include "ClassInitializer.hpp"
   #include "EmptyClassInitializer.hpp"
   #include "ConstructorDeclaration.hpp"
   #include "StreamingMethodDeclaration.hpp"
   #include "Converge.hpp"
   #include "Fork.hpp"
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
   #include "DynamicArray.hpp"
   #include "NoSizeParameter.hpp"
   #include "NoDynamicArray.hpp"
   #include "GenericInstantiationList.hpp"
   #include "NoGenericInstantiation.hpp"
   #include "GenericInstantiation.hpp"
   #include "Assignment.hpp"
   #include "Equals.hpp"
   #include "ArraySize.hpp"
   #include "Increment.hpp"
   #include "Decrement.hpp"
   #include "AssPlus.hpp"
   #include "AssMinus.hpp"
   #include "Plus.hpp"
   #include "Minus.hpp"
   #include  "CondOp.hpp"
   #include  "LOROp.hpp"
   #include  "LANDOp.hpp"
   #include  "OrOp.hpp"
   #include  "HatOp.hpp"
   #include  "AndOp.hpp"
   #include  "EqualityOp.hpp"
   #include  "EqualOp.hpp"
   #include  "NotEqualOp.hpp"
   #include  "GreaterThanOp.hpp"
   #include  "LessThanOp.hpp"
   #include  "LessEqualOp.hpp"
   #include  "GreaterEqualOp.hpp"
   #include  "MultOp.hpp"
   #include  "DivOp.hpp"
   #include  "ModOp.hpp"
   #include  "TypeCastExpression.hpp"
   #include  "LeftShiftOp.hpp"
   #include  "RightShiftOp.hpp"
   #include  "Free.hpp"
   #include  "ModOp.hpp"
   #include  "ArrayInitialization.hpp"
   #include  "BoolArrayInitialization.hpp"
   #include  "NumArrayInitialization.hpp"
   #include  "StrArrayInitialization.hpp"
   #include  "AllOthersInArray.hpp"
   #include  "ArraySlice.hpp"
   #include  "EmptyStatement.hpp"
   #include  "Statement.hpp"
   #include  "IfStatement.hpp"
   #include  "WhileStatement.hpp"
   #include  "ForStatement.hpp"
   #include  "MapStatement.hpp"
   #include  "LocalVarDecl.hpp"
   #include  "MethodReturns.hpp"
   #include  "NoMethodModifier.hpp"
   #include  "Streams.hpp"
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
%token       STREAM
%token       ATPUBLIC
%token       ATPRIVATE  
%token       ATPROTECTED 
%token       SIGNAL
%token       SENDSIGNAL
%token       FUNK
%token       EL
%token       RETURN  
%token       VOID  
%token       THIS  
%token       SUPER
%token       NEW
%token       FOR  
%token       FOREACH  
%token       WHILE  
%token       IF 
%token       ELSE  
%token       NILL  
%token       CONST
%token       STATIC
%token       ATOMIC
%token       NONATOMIC
%token       STRUCT
%token       VAR
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
%token       SYNCHRONIZED
%token       UNSYNCHRONIZED
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
%type    <node>    MethodBody
%type    <node>    MethodDeclarator
%type    <node>    ParameterList
%type    <node>    Parameter
%type    <node>    DeclaratorName
%type    <node>    LocalVariableDeclarationsAndStatements
%type    <node>    LocalVariableDeclarationOrStatement
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
%type    <node>    DelayedName
%type    <node>    StreamCall
%type    <node>    StorageModifierI
%type    <node>    GenericInstantiation
%type    <node>    SelectiveArrayInitializerNum 
%type    <node>    SelectiveArrayInitializerBool
%type    <node>    SelectiveArrayInitializerStr
%type    <node>    MultipleArrayInitBool
%type    <node>    MultipleArrayInitNum
%type    <node>    MultipleArrayInitStr
%type    <node>    ArraySlice
%type    <node>    ArrayAccessOptions
%type    <node>    Slice
%type    <node>    GenericRestrictions
%type    <node>    ClassList 
%type    <node>    MethodModifiers
%type    <node>    MethodModifier
%type    <node>    MethodInherits
%type    <node>    MethodReturns
%type    <node>    AllocationExpression
%token   RETURNTYPE
%token   FUNC

%%
CompilationUnit   :     END
                  |     T
                        {
                           Node::Source *s( nullptr );
                           s = new Node::Source();
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
                           delete( $3 );

                           cls->AdoptChildren( $1 );
                           cls->AdoptChildren( $4 );
                           cls->AdoptChildren( $5 );

                           $$ = cls;
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

GenericListA : CLASS IDENTIFIER GenericRestrictions
               {
                  NodeAbstract *cl( nullptr );
                  cl = new GenericClassParam( *$2 );
                  delete( $2 );
                  $$ = cl;
               }
            |  Type  IDENTIFIER  TypeModifier GenericRestrictions
               {
                  NodeAbstract *cl( nullptr );
                  cl = new GenericTypeParam( *$2 );
                  delete( $2 );
                  cl->AdoptChildren( $1 );
                  cl->AdoptChildren( $3 );
                  $$ = cl;
               }
            ;

GenericRestrictions : EXTENDS Type
                    {
                      $$ = new NodeAbstract();
                      $$->AdoptChildren( $2 );
                    }
                    | IMPLEMENTS QualifiedName
                    {
                      $$ = new NodeAbstract();
                      $$->AdoptChildren( $2 );
                    }
                    | EL LBRACE ClassList RBRACE 
                    {
                      $$ = new NodeAbstract();
                      $$->AdoptChildren( $3 );
                    }
                    |
                    {
                      $$ = new NodeAbstract();
                    }
                    ;



ClassList         : Type
                  {
                     $$ = $1;
                  }
                  | ClassList COMMA Type
                  {
                     $$ = $1;
                     $$->MakeSibling( $3 );
                  }
                  ;

Inherit           :     COLON EXTENDS Type
                        {
                           $$ = new ClassExtends( );
                           $$->AdoptChildren( $3 );
                        }
                  |     COLON IMPLEMENTS ObjectType
                        {
                           $$ = new ClassImplements();
                           $$->AdoptChildren( $3 );
                        }
                  |
                        {
                           $$ = new ClassNoInherit();
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
                  ;


FieldVariableDeclaration  : 
                              VAR StorageModifier Type Initializer SEMI
                              {
                                $$ = new FieldVarDecl();
                                $$->AdoptChildren( $2 );
                                $$->AdoptChildren( $3 );
                                $$->AdoptChildren( $4 );
                              }
                           |  CONST StorageModifier Type Initializer SEMI
                              {
                                //TODO
                                $$ = new FieldVarDecl();
                                $$->AdoptChildren( $2 );
                                $$->AdoptChildren( $3 );
                                $$->AdoptChildren( $4 );
                              }
                           | VAR  Type Initializer SEMI
                              {
                                $$ = new FieldVarDecl();
                                $$->AdoptChildren( $2 );
                                $$->AdoptChildren( $3 );
                              }
                           |  CONST  Type Initializer SEMI
                              {
                                $$ = new FieldVarDecl();
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
                 ;

StorageModifierI : STATIC
                  {
                     $$ = new Static();
                  }
                 | NONATOMIC
                  {
                     $$ = new NonAtomic();
                  }
                 | ATOMIC
                  {
                     $$ = new Atomic();
                  }
                 | SYNCHRONIZED
                  {
                     $$ = new Synchronized();
                  }
                 | UNSYNCHRONIZED
                  {
                     $$ = new Unsynchronized();
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
                         ;


MethodDeclaration        : MethodModifiers MethodDeclarator  MethodReturns MethodBody
                           {
                              $$ = $2;
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                              $$->AdoptChildren( $4 );
                           }
                         ;

MethodReturns          : RETURNTYPE LPAREN    ParameterList RPAREN
                         {
                           $$ = new NodeAbstract(  );
                         }
                       | RETURNTYPE DLBRACKET ParameterList DRBRACKET
                         {
                           $$ = new NodeAbstract(  );
                         }
                       ;


MethodModifiers : 
                  MethodModifier StorageModifier MethodInherits
                  {
                     $1->AdoptChildren( $2 );
                     $1->AdoptChildren( $3 );
                     $$ = $1;
                  }
                | MethodModifier MethodInherits
                  {
                     $1->AdoptChildren( $2 );
                     $$ = $1;
                  }
                | MethodModifier
                  {
                     $$ = $1;
                  }
                ;

MethodModifier  : FUNC
                  {
                     $$ = new NodeAbstract();
                     $$->set_name( "Func" );
                  }
                | STREAM
                  {
                     $$ = new Streams();
                  }
                ;

                

MethodInherits :  IMPLEMENTS
                  {
                     $$ = new MethodImplements();
                  }
                | OVERRIDES
                  {
                     $$ = new MethodOverrides();
                  }
                | ABSTRACT
                  {
                     $$ = new NodeAbstract( );
                     $$->set_name( "Abstract" );
                  }
                ;


MethodBody  :  Block
               {
                  $$ = $1;
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
                         | IDENTIFIER DLBRACKET ParameterList DRBRACKET
                           {
                              $$ = new StreamingMethodDeclaration( *$1 );
                              delete( $1 );
                              auto *temp( new StreamInput() );
                              temp->AdoptChildren( $3 );
                              $$->AdoptChildren( temp );
                           }
                         | IDENTIFIER LPAREN ParameterList RPAREN DLBRACKET ParameterList DRBRACKET
                           {
                              $$ = new StreamingMethodDeclaration( *$1 );
                              delete( $1 );
                              auto *param( new ParameterList() );
                              auto *strem( new StreamInput() );
                              param->AdoptChildren( $3 );
                              strem->AdoptChildren( $6 );
                              $$->AdoptChildren( param );
                              $$->AdoptChildren( strem );
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
                         | Type
                           {
                              $$ = new SimpleParameter();
                           }
                         ;

DeclaratorName           : IDENTIFIER TypeModifier
                           {
                              $$ = new VariableDeclaration( *$1 );
                              $$->AdoptChildren( $2 );
                              delete( $1 );
                           }
                         |BoolInitializer 
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

LocalVariableDeclarationOrStatement    :  FieldVariableDeclaration
                                          {
                                           $$ = $1;
                                          }
                                       |  Statement
                                          {
                                           $$ = $1;
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
                     $$ = new EmptyStatement();
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
                           $$ = new IfStatement();
                           /** conditional **/
                           $$->AdoptChildren( $3 );
                           /** true **/
                           $$->AdoptChildren( $5 );
                           /** false **/
                           $$->AdoptChildren( $7 );

                        }
                    |   IF LPAREN Expression RPAREN Statement
                        {
                           $$ = new IfStatement();
                           /** conditional **/
                           $$->AdoptChildren( $3 );
                           /** true **/
                           $$->AdoptChildren( $5 );
                           /** false **/
                           $$->AdoptChildren( new EmptyStatement() );
                        }
                    |   SIGNAL LPAREN QualifiedName RPAREN Statement
                        {
                           //FIXME
                           $$ = new NodeAbstract();
                        }
                    |   SENDSIGNAL LPAREN QualifiedName RPAREN Statement
                        {
                           //FIXME
                           $$ = new NodeAbstract();
                        }
                    ;

IterationStatement   :  WHILE LPAREN Expression RPAREN Statement
                        {
                           $$ = new WhileStatement();
                           $$->AdoptChildren( $3 );
                           $$->AdoptChildren( $5 );
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
               $$ = new ForStatement();
               /** init for loop **/
               $$->AdoptChildren( $3 );
               /** conditional **/
               $$->AdoptChildren( $4 );
               /** increment **/
               $$->AdoptChildren( $6 );
               /** block **/
               $$->AdoptChildren( $8 );
            }
         ;

ForStatement   :  LBRACE Statement RBRACE
                  {
                     $$ = $2;
                  }
               |  SEMI
                  {
                     $$ = new EmptyStatement();
                  }
               |  LBRACE RBRACE
                  {
                     $$ = new EmptyStatement();
                  }
               ;

MapExpression   :    Expression AT FORWARDSLASH Expression
                     {
                        $$ = new MapStatement();
                        $$->AdoptChildren( $1 );
                        $$->AdoptChildren( $4 );
                     }
                ;

InitFor  :  FieldVariableDeclaration
            {
               $$ = $1;
            }
         ;

ReturnStatement   :  RETURN SEMI
                     {
                        //TODO
                        NodeAbstract *ret( nullptr );
                        ret = new NodeAbstract();

                        ret->set_name( "Return" );
                        $$ = ret;
                     }
                  |  RETURN LPAREN Expression RPAREN SEMI
                     {
                        NodeAbstract *ret( nullptr );
                        ret = new NodeAbstract();

                        ret->set_name( "Return" );
                        ret->AdoptChildren( $3 );
                        
                        $$ = ret;
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

                  ini->set_name( "NumberInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            |  MultiStringInit
               {
                  NodeAbstract *ini( nullptr );
                  ini = new NodeAbstract();
                  
                  ini->set_name( "StringInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            |  MultiObjectInit
               {
                  NodeAbstract *ini( nullptr );
                  ini = new NodeAbstract();

                  ini->set_name( "ObjectInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            ;


MultipleArrayInitBool : SelectiveArrayInitializerBool
                        {
                           $$ = $1;
                        }
                      | MultipleArrayInitBool COMMA SelectiveArrayInitializerBool
                        {
                           $$ = $1;
                           $1->MakeSibling( $3 );
                        }
                      ;
MultipleArrayInitNum : SelectiveArrayInitializerNum
                        {
                           $$ = $1;
                        }
                      | MultipleArrayInitNum COMMA SelectiveArrayInitializerNum
                        {
                           $$ = $1;
                           $1->MakeSibling( $3 );
                        }
                      ;
MultipleArrayInitStr : SelectiveArrayInitializerStr
                        {
                           $$ = $1;
                        }
                      | MultipleArrayInitStr COMMA SelectiveArrayInitializerStr
                        {
                           $$ = $1;
                           $1->MakeSibling( $3 );
                        }
                      ;

Slice             : INT_TOKEN THREEDOTS INT_TOKEN
                    {
                      $$ = new ArraySlice( $1, $3 );
                    }
                   ;



ArrayAccessOptions  : INT_TOKEN
                      {
                          $$ = new ArraySize( $1 );
                      }
                      | Slice
                      {
                          $$ = $1;
                      }
                    ;

ArraySlice          : ArraySlice COMMA ArrayAccessOptions
                      {
                        $$ = $1;
                        $$->AdoptChildren( $3 );
                      }
                    | ArrayAccessOptions
                      {
                        $$ = $1;
                      }
                    ;


SelectiveArrayInitializerBool : LBRACKET ArraySlice RBRACKET EQUALS Boolean 
                              {
                                 $$ = new BoolArrayInitialization();
                                 $$->AdoptChildren( $2 );
                                 $$->AdoptChildren( $5 );
                              }
                              | LBRACKET THREEDOTS RBRACKET EQUALS Boolean
                              {
                                 $$ = new BoolArrayInitialization();
                                 $$->AdoptChildren( 
                                    new AllOthersInArray() );
                                 $$->AdoptChildren( $5 );
                              }
                              ;
SelectiveArrayInitializerNum : LBRACKET ArraySlice RBRACKET EQUALS Number
                              {
                                 $$ = new NumArrayInitialization();
                                 $$->AdoptChildren( $2 );
                                 $$->AdoptChildren( $5 );
                              }
                              | LBRACKET THREEDOTS RBRACKET EQUALS Number
                              {
                                 $$ = new NumArrayInitialization();
                                 $$->AdoptChildren( 
                                    new AllOthersInArray() );
                                 $$->AdoptChildren( $5 );
                              }
                              ;
SelectiveArrayInitializerStr : LBRACKET ArraySlice RBRACKET EQUALS Literal
                              {
                                 $$ = new StrArrayInitialization();
                                 $$->AdoptChildren( $2 );
                                 $$->AdoptChildren( $5 );
                              }
                              | LBRACKET THREEDOTS RBRACKET EQUALS Literal
                              {
                                 $$ = new StrArrayInitialization();
                                 $$->AdoptChildren( 
                                    new AllOthersInArray() );
                                 $$->AdoptChildren( $5 );
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
                       | IDENTIFIER TypeModifier LPAREN LogicalUnaryExpression RPAREN
                           {
                              $$ = new VariableDeclaration( *$1 );
                              delete( $1 );
                              $$->AdoptChildren( $2 );
                              $$->AdoptChildren( $4 );
                           }
                         
                       | IDENTIFIER TypeModifier LPAREN MultipleArrayInitBool RPAREN
                        {
                           $$ = new NodeAbstract();
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
                         | IDENTIFIER TypeModifier LPAREN MultipleArrayInitNum RPAREN
                           {
                              $$ = new NodeAbstract();
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
                         | IDENTIFIER TypeModifier LPAREN MultipleArrayInitStr RPAREN
                           {
                           $$ = new NodeAbstract();
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
                  |     QualifiedName LCARROT GenericInstantiation RCARROT
                        {
                           $$ = new ObjectType( "ObjectType" );
                           $$->AdoptChildren( $1 );
                           $$->AdoptChildren( $3 );
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
                           $$ = new GenericInstantiationList();
                           NodeAbstract *n( new DynamicArray() );
                           n->AdoptChildren( new NoSizeParameter() );
                           $$ -> AdoptChildren( n );
                        }
                  |
                        {
                              $$ = new EmptyTypeModifier();
                        }
                  ;

GenericInstantiationList : GenericInstantiation
                           {
                              $$ = $1;
                           }
                      | GenericInstantiationList COMMA GenericInstantiation
                           {
                              $$ = $1;
                              $$->MakeSibling( $3 );
                           }
                         ;

GenericInstantiation : IDENTIFIER EQUALS AllowedGenericInstTypes
                     {
                        $$ = new GenericInstantiation();
                        $$->set_name( *$1 );
                        delete( $1 );
                        NodeAbstract *eq( new Equals() );
                        
                        eq->AdoptChildren( $3 );
                        $$->AdoptChildren( eq );
                     }
                     ;
AllowedGenericInstTypes : Literal
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
                        | Type
                           {
                              $$ = $1;
                           }
                        ;

ArraySize         :     ArraySize COMMA INT_TOKEN
                        {
                           $$->AdoptChildren( new ArraySize( $3 ) );
                        }
                  |     INT_TOKEN
                        {
                           $$ = new ArraySize( $1 );  
                        }
                  ;



AssignmentExpression :  ConditionalExpression
                        {
                           $$ = $1;
                        }
                     |  UnaryExpression AssignmentOperator
                        {
                           $$ = $2;
                           $$->AdoptChildren( $1 );
                        }
                     |  UnaryExpression INCREMENT
                        {
                           $$ = new Increment();
                           $$->AdoptChildren( $1 );
                        }
                     |  UnaryExpression DECREMENT
                        {
                           $$ = new Decrement();
                           $$->AdoptChildren( $1 );
                        }
                     ;

AssignmentOperator   :  EQUALS
                        {
                           $$ = new Equals();
                        }
                     |  ASS_PLUS
                        {
                           $$ = new AssPlus();
                        }
                     |  ASS_MINUS
                        {
                           $$ = new AssMinus();
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
                              $$ = new LOROp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        ;

ConditionalAndExpression   :  InclusiveOrExpression
                              {
                                 $$ = $1;
                              }
                          |  ConditionalAndExpression OP_LAND InclusiveOrExpression
                           {  
                              $$ = new LANDOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }  
                          ;

InclusiveOrExpression   :  ExclusiveOrExpression
                           {
                              $$ = $1;
                           }
                        |  InclusiveOrExpression OR ExclusiveOrExpression
                           {  
                              $$ = new OrOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }  
                        ;

ExclusiveOrExpression   :  AndExpression
                           {
                              $$ = $1;
                           }
                        |  ExclusiveOrExpression HAT AndExpression
                           {  
                              $$ = new HatOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }  
                        ;

AndExpression           :  EqualityExpression
                           {
                              $$ = $1;
                           }
                        |  AndExpression  AND   EqualityExpression
                           {
                              $$ = new AndOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        ;

EqualityExpression      :  RelationalExpression
                           {
                              $$ = $1;
                           }
                        |  EqualityExpression   OP_EQ RelationalExpression
                           {  
                              $$ = new EqualOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }  
                        |  EqualityExpression   OP_NE RelationalExpression
                           {  
                              $$ = new NotEqualOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }  
                        ;

RelationalExpression    :  ShiftExpression
                           {
                              $$ = $1;
                           }
                        |  RelationalExpression RCARROT ShiftExpression
                           {
                              $$ = new GreaterThanOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        |  RelationalExpression LCARROT ShiftExpression
                           {
                              $$ = new LessThanOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        |  RelationalExpression OP_LE ShiftExpression
                           {
                              $$ = new LessEqualOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        |  RelationalExpression OP_GE ShiftExpression
                           {
                              $$ = new GreaterEqualOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        ;

ShiftExpression         :  AdditiveExpression
                           {
                              $$ = $1;
                           }
                        ;

AdditiveExpression      :  MultiplicativeExpression
                           {
                              $$ = $1;
                           }
                        |  AdditiveExpression   PLUS MultiplicativeExpression
                           {
                              $$ = new Plus();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        |  AdditiveExpression   MINUS MultiplicativeExpression
                           {
                              $$ = new Minus();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        ;

MultiplicativeExpression   :  CastExpression
                           {
                              $$ = $1;
                           }
                    |   MultiplicativeExpression   ASTERICK CastExpression
                           {
                              $$ = new MultOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
              |   MultiplicativeExpression   FORWARDSLASH   CastExpression
                           {
                              $$ = new DivOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                       |   MultiplicativeExpression   PERCENT   CastExpression
                           {
                              $$ = new ModOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        | MultiplicativeExpression DLCARROT CastExpression
                           {
                              $$ = new LeftShiftOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                        | MultiplicativeExpression DRCARROT CastExpression
                           {
                              $$ = new RightShiftOp();
                              $$->AdoptChildren( $1 );
                              $$->AdoptChildren( $3 );
                           }
                       ;

CastExpression :  UnaryExpression
                  {
                     $$ = $1;
                  }
               |  LPAREN   Type  RPAREN   CastExpression
                  {
                     $$ = new TypeCastExpression();
                     $$->AdoptChildren( $2 );
                     $$->AdoptChildren( $4 );
                  }
               |  LPAREN   Expression  RPAREN   LogicalUnaryExpression
                  {
                     $$ = new CastExpression();
                     /** eval left first **/
                     $$->AdoptChildren( $2 );
                     /** then right **/
                     $$->AdoptChildren( $4 );
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


NotJustName :  SpecialName
               {
                  $$ = $1;
               }
            |  ComplexPrimary
               {
                  $$ = $1;
               }
            |  AllocationExpression
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

ArrayAccess :  NotJustName LBRACKET ArraySlice RBRACKET
               {
                  $$ = new ArrayAccess();
                  $$->AdoptChildren( $1 );
                  $$->AdoptChildren( $3 );
               }
            |  QualifiedName LBRACKET  ArraySlice RBRACKET
               {
                  $$ = new ArrayAccess();
                  $$->AdoptChildren( $1 );
                  $$->AdoptChildren( $3 );
               }
            |  DelayedName LBRACKET ArraySlice RBRACKET
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


StreamCall :QualifiedName DLBRACKET ArgumentList DRBRACKET
            {
               $$ = new StreamReferencing();
               $$->AdoptChildren( $1 );
               ArgumentList *al = new StreamArgumentList();
               al->AdoptChildren( $3 );
               $$->AdoptChildren( al );
            }
           | QualifiedName DLBRACKET DRBRACKET
            {
               $$ = new StreamReferencing();
               $$->AdoptChildren( $1 );
               ArgumentList *al = new StreamArgumentList();
               $$->AdoptChildren( al );
            }
           ;

AllocationExpression :  NEW Type TypeModifier LPAREN ArgumentList RPAREN
                        {
                           $$ = new New();
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( $3 );
                           $$->AdoptChildren( $5 );
                        }
                     |  NEW Type TypeModifier LPAREN RPAREN
                        {
                           $$ = new New();
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( $3 );
                        }
                     ;


DelayedName    :  DOLLAR
                  {
                     $$ = new DelayedName();
                  }
               ;

QualifiedName  :  IDENTIFIER
                  {
                     $$ = new QualifiedName( *$1 );
                     delete( $1 );
                  }
               |  QualifiedName PERIOD IDENTIFIER
                  {
                     QualifiedName *qn = new QualifiedName( *$3 );
                     delete( $3 );
                     $1->MakeSibling( qn );
                     $$ = $1;
                  }
               |  IDENTIFIER
                  {
                     //TODO
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
               $$ = value;
               delete( $1 );
            }
         ;

Number   :  INT_TOKEN
            {
               ValueBase *value = new Value<uintmax_t>( $1 );
               $$ = value;
            }
         |  FLOAT_TOKEN
            {
               ValueBase *value = new Value<long double>( $1 );
               $$ = value;
            }
         ;

Boolean  :  TRUE
            {
               ValueBase *value = new Value<bool>( true );
               $$ = value;
            }
         |  FALSE
            {
               ValueBase *value = new Value<bool>( false );
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
   str << "\n"; 
   
   if( is_included_file )
   {
      std::string str_included( data.get_cpp_handler().PeekBelowHead() );
      data.get_rf_errorstream() << ",\n" <<
      "in included from file with " << str_included << "\n";
   }
   data.get_rf_errorstream() << "somewhere in the line:" << "\n" <<
   data.get_cpp_handler().GetHeadCurrentLine() << "\n";
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
