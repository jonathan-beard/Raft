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
      class Declaring;
      class DeclaringList;
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
      class VariableName;
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
   #include "VariableName.hpp"
   #include "Source.hpp"
   #include "Declaring.hpp"
   #include "DeclaringList.hpp"
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
                           in = new NodeAbstract();
                           assert( in != nullptr );
                           std::stringstream ss;
                           ss << "Inherits from: " << *$3;
                           in->set_name( ss.str() );
                           delete( $3 );
                           $$ = in;
                        }
                  |     COLON IMPLEMENTS IDENTIFIER 
                        {
                           NodeAbstract *in( nullptr );
                           in = new NodeAbstract();
                           assert( in != nullptr );
                           std::stringstream ss;
                           ss << "Implements: " << *$3;
                           in->set_name( ss.str() );
                           delete( $3 );
                           $$ = in;
                        }
                  |
                        {
                           NodeAbstract *empty( nullptr );
                           empty = new NodeAbstract();
                           assert( empty != nullptr );
                           empty->set_name( "No Inherit" );
                           $$ = empty;
                        }
                  ;

InterfaceDeclaration :  INTERFACE IDENTIFIER LBRACE Body RBRACE
                        {
                           NodeAbstract *interface( nullptr );
                           interface = new NodeAbstract();
                           assert( interface != nullptr );
                           interface->set_name( "Interface Delcaration" );

                           NodeAbstract *name( nullptr );
                           name = new NodeAbstract();
                           name->set_name( *$2 );
                           delete( $2 );

                           name->MakeSibling( $4 );

                           interface->AdoptChildren( name );

                           $$ = interface;
                        }
                     |  INTERFACE IDENTIFIER LBRACE RBRACE
                        {
                           NodeAbstract *interface( nullptr );
                           interface = new NodeAbstract();
                           assert( interface != nullptr );
                           interface->set_name( "Interface Delcaration" );

                           NodeAbstract *name( nullptr );
                           name = new NodeAbstract();
                           name->set_name( *$2 );
                           delete( $2 );

                           interface->AdoptChildren( name );

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
                           std::cerr << "AtPublic Decl\n";
                           $$ = new NodeAbstract();
                           $$->set_name( "public" );
                        }
                  |     ATPROTECTED
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "protected" );
                        }
                  |     ATPRIVATE
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "private" );
                        }
                  ;

FieldDeclaration  :     FieldVariableDeclaration
                        {
                           std::cerr << "FieldVar Decl\n";
                           $$ = new NodeAbstract();
                           $$->set_name("FieldVariableDeclaration");
                           $$->AdoptChildren( $1 );
                        }
                  |     MethodDeclaration
                        {
                           $$ = new NodeAbstract();
                           $$->set_name("MethodDeclaration");
                           $$->AdoptChildren( $1 );
                        }
                  |     ConstructorDeclaration
                        {
                           $$ = new NodeAbstract();
                           $$->set_name("ConstructorDeclaration");
                           $$->AdoptChildren( $1 );
                        }
                  |     StreamingMethodConstructor
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "StreamingMethodDeclaration" );
                           $$->AdoptChildren( $1 );
                        }
                  ;


FieldVariableDeclaration  : StorageModifier Type Initializer SEMI
                            {
                              NodeAbstract *fieldvar( nullptr );
                              fieldvar = new NodeAbstract();
                              assert( fieldvar != nullptr );

                              fieldvar->set_name( "FieldVariableDeclaration" );

                              $1->MakeSibling( $2 );
                              $1->MakeSibling( $3 );

                              fieldvar->AdoptChildren( $1 );
                              $$ = fieldvar;
                            }
                          | StorageModifier Type Initializer DeclareAndAssignArray SEMI
                            {
                             NodeAbstract *fieldvar( nullptr );
                             fieldvar = new NodeAbstract();
                             assert( fieldvar != nullptr );

                             fieldvar->set_name( "FieldVariableDeclaration" );

                             $1->MakeSibling( $2 );
                             $1->MakeSibling( $3 );
                             $1->MakeSibling( $4 );

                             fieldvar->AdoptChildren( $1 );
                             $$ = fieldvar;
                            }
                          | Type Initializer SEMI
                            {
                             std::cerr << "TypeInitSemi\n";
                             NodeAbstract *fieldvar( nullptr );
                             fieldvar = new NodeAbstract();
                             assert( fieldvar != nullptr );

                             fieldvar->set_name( "FieldVariableDeclaration" );

                             $1->MakeSibling( $2 );

                             fieldvar->AdoptChildren( $1 );
                             $$ = fieldvar;
                            }
                          | Type Initializer DeclareAndAssignArray SEMI
                            {
                              NodeAbstract *fieldvar( nullptr );
                              fieldvar = new NodeAbstract();
                              assert( fieldvar != nullptr );

                              fieldvar->set_name( "FieldVariableDeclaration" );
                              
                              $1->MakeSibling( $2 );
                              $1->MakeSibling( $3 );

                              fieldvar->AdoptChildren( $1 );

                              $$ = fieldvar;
                            }
                          ;

StorageModifier : CONST
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("const");
                     $$ = sm;
                  }
                | STATIC
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("static");
                     $$ = sm;
                  }
                | STATIC ATOMIC
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("static atomic");
                     $$ = sm;
                  }
                | ATOMIC STATIC
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("atomic static");
                     $$ = sm;
                  }
                | NONATOMIC STATIC
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("nonatomic static");
                     $$ = sm;
                  }
                | STATIC NONATOMIC
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("static nonatomic");
                     $$ = sm;
                  }
                | ATOMIC
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("atomic");
                     $$ = sm;
                  }
                | NONATOMIC
                  {
                     NodeAbstract *sm( nullptr );
                     sm = new NodeAbstract();
                     assert( sm != nullptr );

                     sm->set_name("nonatomic");
                     $$ = sm;
                  }
                ;


ConstructorDeclaration   : MethodDeclarator Block
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new NodeAbstract();
                              assert( cons != nullptr );

                              cons->set_name( "ConstructorDeclaration" );
                              $1->MakeSibling( $2 );
                              cons->AdoptChildren( $1 );
                              $$ = cons;  
                           }
                         | MethodDeclarator COLON ClassInitializers SEMI
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new NodeAbstract();
                              assert( cons != nullptr );

                              cons->set_name( "ConstructorDeclaration" );
                              $1->MakeSibling( $3 );
                              cons->AdoptChildren( $1 );
                              $$ = cons;
                           }
                         | MethodDeclarator COLON ClassInitializers Block
                           {
                              NodeAbstract *cons( nullptr );
                              cons = new NodeAbstract();
                              assert( cons != nullptr );

                              cons->set_name( "ConstructorDeclaration" );
                              $1->MakeSibling( $3 );
                              $1->MakeSibling( $4 );
                              cons->AdoptChildren( $1 );
                              $$ = cons;
                           }
                         ;

StreamingMethodConstructor :  StreamModifiers STREAMS StreamInitializer StreamDeclarator Block
                              {
                                 NodeAbstract *cons( nullptr );
                                 cons = new NodeAbstract();
                                 assert( cons != nullptr );

                                 cons->set_name( "StreamingConstructorDeclaration" );
                                 $3->MakeSibling( $4 );
                                 $3->MakeSibling( $5 );
                                 cons->AdoptChildren( $3 );
                                 $$ = cons;  
                              }
                           ;

StreamModifiers            : FORK
                             {
                                 NodeAbstract *fork( nullptr );
                                 fork = new NodeAbstract();
                                 assert( fork != nullptr );
                                 fork->set_name( "Fork" );
                                 $$ = fork;
                             }
                           | CONVERGE
                             {
                                 NodeAbstract *converge( nullptr );
                                 converge = new NodeAbstract();
                                 assert( converge != nullptr );
                                 converge->set_name( "Converge" );
                                 $$ = converge;
                             }
                           |
                              {
                                 NodeAbstract *nomods( nullptr );
                                 nomods = new NodeAbstract();
                                 assert( nomods != nullptr );
                                 nomods->set_name( "NoStreamModifiers" );
                                 $$ = nomods;
                              }
                           ;

ClassInitializers        : IDENTIFIER LPAREN Expression RPAREN
                           {
                              NodeAbstract *ini(nullptr);
                              ini = new NodeAbstract();
                              assert( ini != nullptr );

                              ini->set_name( "ClassInitializer" );

                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              id->MakeSibling( $3 );

                              ini->AdoptChildren( id );

                              $$ = ini;
                           }
                         | ClassInitializers COMMA IDENTIFIER LPAREN Expression RPAREN
                           {
                              NodeAbstract *ini(nullptr);
                              ini = new NodeAbstract();
                              assert( ini != nullptr );

                              ini->set_name( "ClassInitializer" );

                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$3 );
                              delete( $3 );

                              id->MakeSibling( $5 );

                              ini->AdoptChildren( id );
                              
                              $1->MakeSibling( ini );

                              $$ = $1;
                           }
                         ;

MethodDeclaration        : Type TypeModifier MethodDeclarator MethodBody
                           {
                              NodeAbstract *method( nullptr );
                              method = new NodeAbstract();
                              assert( method != nullptr );
                              method->set_name( "MethodDeclaration" );

                              $1->MakeSibling( $2 );
                              $1->MakeSibling( $3 );
                              $1->MakeSibling( $4 );

                              method->AdoptChildren( $1 );

                              $$ = method;
                           }
                         | Type MethodDeclarator MethodBody
                           {
                              NodeAbstract *method( nullptr );
                              method = new NodeAbstract();
                              assert( method != nullptr );
                              method->set_name( "MethodDeclaration" );
                              $$ = method;
                              
                              $1->MakeSibling( $2 );
                              $1->MakeSibling( $3 );
                              method->AdoptChildren( $1 );

                           }
                         | IMPLEMENTS Type TypeModifier MethodDeclarator MethodBody
                           {
                              NodeAbstract *method( nullptr );
                              method = new NodeAbstract();
                              assert( method != nullptr );
                              method->set_name( "MethodDeclaration" );
   
                              NodeAbstract *impl( nullptr );
                              impl = new NodeAbstract();
                              assert( impl != nullptr );

                              impl->set_name( "implements" );
   
                              impl->MakeSibling( $2 );
                              impl->MakeSibling( $3 );
                              impl->MakeSibling( $4 );
                              impl->MakeSibling( $5 );

                              method->AdoptChildren( impl );

                              $$ = method;
                           }
                         | OVERRIDES Type TypeModifier MethodDeclarator MethodBody
                           {
                              NodeAbstract *method( nullptr );
                              method = new NodeAbstract();
                              assert( method != nullptr );
                              method->set_name( "MethodDeclaration" );
   
                              NodeAbstract *over( nullptr );
                              over = new NodeAbstract();
                              assert( over != nullptr );

                              over->set_name( "overrides" );
   
                              over->MakeSibling( $2 );
                              over->MakeSibling( $3 );
                              over->MakeSibling( $4 );
                              over->MakeSibling( $5 );

                              method->AdoptChildren( over );

                              $$ = method;
                           }
                         ;

MethodBody  :  Block
               {
                  NodeAbstract *method( nullptr );
                  method = new NodeAbstract();
                  assert( method != nullptr );

                  method->set_name( "MethodBody" );

                  method->AdoptChildren( $1 );

                  $$ = method;
               }
            ;

StreamDeclarator  :  IDENTIFIER StreamInitializer
                     {
                        NodeAbstract *streamdecl( nullptr );
                        streamdecl = new NodeAbstract();
                        assert( streamdecl != nullptr );
                        streamdecl->set_name( "StreamDecl" );
   
                        NodeAbstract *id( nullptr );
                        id = new NodeAbstract();
                        assert( id != nullptr );
                        assert( $1 != nullptr );
                        id->set_name( *$1 );
                        delete( $1 );
                       

                        assert( $2 != nullptr );
                        id->MakeSibling( $2 );

                        streamdecl->AdoptChildren( id );

                        $$ = streamdecl;
                     }
                  |  IDENTIFIER DLBRACKET DRBRACKET
                     {
                        NodeAbstract *streamdecl( nullptr );
                        streamdecl = new NodeAbstract();
                        assert( streamdecl != nullptr );
                        streamdecl->set_name( "StreamDecl" );

                        NodeAbstract *id( nullptr );
                        id = new NodeAbstract();
                        assert( id != nullptr );
                        assert( $1 != nullptr );
                        id->set_name( *$1 );
                        delete( $1 );
                        
                        NodeAbstract *empty( nullptr );
                        empty = new NodeAbstract();
                        empty->set_name( "EmptyInitializerList" );
                        
                        id->MakeSibling( empty );
                        streamdecl->AdoptChildren( id );

                        $$ = streamdecl;
                     }
                  ;


MethodDeclarator         : IDENTIFIER LPAREN ParameterList RPAREN
                           {
                              NodeAbstract *methodd( nullptr );
                              methodd = new NodeAbstract();
                              assert( methodd != nullptr );
                              methodd->set_name( "MethodDecl" );

                              methodd->AdoptChildren( $3 );
                              $$ = methodd;
                           }
                         | IDENTIFIER LPAREN RPAREN
                           {
                              NodeAbstract *methodd( nullptr );
                              methodd = new NodeAbstract();
                              assert( methodd != nullptr );
                              methodd->set_name( "MethodDecl" );
                              
                              NodeAbstract *noparams( nullptr );
                              noparams = new NodeAbstract();
                              assert( noparams != nullptr );

                              methodd->AdoptChildren( noparams );
                              $$ = methodd;
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
                              NodeAbstract *param( nullptr );
                              param = new NodeAbstract();
                              assert( param != nullptr );

                              param->MakeSibling( $1 );
                              param->MakeSibling( $2 );
                              $$ = param;
                           }

                         | Type  DeclaratorName LBRACKET RBRACKET
                           {
                              NodeAbstract *param_arr( nullptr );
                              param_arr = new NodeAbstract();
                              assert( param_arr != nullptr );
                              param_arr->set_name( "ParamArray" );
                              param_arr->AdoptChildren( $1 );
                              param_arr->AdoptChildren( $2 );
                              $$ = param_arr;
                           }
                         | Type  DeclaratorName LBRACKET ArraySize RBRACKET
                           {
                              NodeAbstract *param_arr( nullptr );
                              param_arr = new NodeAbstract();
                              assert( param_arr != nullptr );
                              param_arr->set_name( "ParamArray" );
                              param_arr->AdoptChildren( $1 );
                              param_arr->AdoptChildren( $2 );
                              param_arr->AdoptChildren( $4 );
                              $$ = param_arr;
                           }
                         ;

DeclaratorName           : IDENTIFIER
                           {
                              std::cerr << "DeclNameID: " << *$1 << "\n";
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );

                              id->set_name( *$1 );
                              delete( $1 );
                              
                              $$ = id ;
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
          NodeAbstract *empty( nullptr );
          empty = new NodeAbstract();
          assert( empty != nullptr );
          empty->set_name( "EmptyBlock" );
          $$ = empty;
        }
      |  LBRACE   LocalVariableDeclarationsAndStatements RBRACE
         {
            NodeAbstract *block( nullptr );
            block = new NodeAbstract();
            assert( block != nullptr );

            block->set_name( "Block" );
            block->AdoptChildren( $2 );
            $$ = block;
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
                  std::cerr << "SelectionStatementInit\n";
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
                           std::cerr << "Expression\n";
                           $$ = $1;
                        }
                     ;

Expression  :  AssignmentExpression
               {
                  std::cerr << "AssignmentExpression\n";
                  $$ = $1;
               }
            |  MapExpression
               {
                  std::cerr << "MapExpression\n";
                  $$ = $1;   
               }
            ;

SelectionStatementInit  :  
                        IF LPAREN Expression RPAREN Statement ELSE Statement
                        {
                           std::cerr << "Here2\n";
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
                           std::cerr << "Here1\n";
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
                  std::cerr << "MultiBoolInit\n";
                  $$ = $1;
               }
            |  MultiNumberInit
               {
                  std::cerr << "MultiNumInit\n";
                  NodeAbstract *ini( nullptr );
                  ini = new NodeAbstract();
                  assert( ini != nullptr );

                  ini->set_name( "NumberInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            |  MultiStringInit
               {
                  std::cerr << "MultiStringInit\n";
                  NodeAbstract *ini( nullptr );
                  ini = new NodeAbstract();
                  assert( ini != nullptr );
                  
                  ini->set_name( "StringInitializers" );

                  ini->AdoptChildren( $1 );

                  $$ = ini;
               }
            |  MultiObjectInit
               {
                  std::cerr << "MultiObjectInit\n";
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
                              std::cerr << "MulitBoolInitializer\n";
                              $$ = $1;
                           }
                         ;

BoolInitializer          : IDENTIFIER TypeModifier LPAREN Boolean RPAREN
                           {
                              VariableName *v( new VariableName( *$1 ) );
                              assert( v != nullptr );
                              delete( $1 );

                              BooleanType *id( nullptr );
                              id = new BooleanType();
                              assert( id != nullptr );
                              id->set_name( "BoolDeclaration" );
                              
                              

                              id->AdoptChildren( v );
                              id->AdoptChildren( $2 );
                              id->AdoptChildren( $4 );
                              $$ = id;
                           }
                         | IDENTIFIER LPAREN Boolean RPAREN
                           {
                              VariableName *v( new VariableName( *$1 ) );
                              assert( v != nullptr );
                              delete( $1 );

                              BooleanType *id( nullptr );
                              id = new BooleanType();
                              assert( id != nullptr );
                              id->set_name( "BoolDeclaration" );
                               

                              id->AdoptChildren( v );
                              id->AdoptChildren( $3 );
                              $$ = id;
                           }
                       | IDENTIFIER TypeModifier LPAREN LogicalUnaryExpression RPAREN
                           {
                              VariableName *v( new VariableName( *$1 ) );
                              assert( v != nullptr );
                              delete( $1 );

                              BooleanType *id( nullptr );
                              id = new BooleanType();
                              assert( id != nullptr );
                              id->set_name( "BoolDeclaration" );
                               
                              id->AdoptChildren( v );
                              id->AdoptChildren( $4 );
                              $$ = id;
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
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              $$ = new NodeAbstract();
                              $$->set_name("ObjectInitializer");
                              
                              id->MakeSibling( $2 );
                              id->MakeSibling( $4 );

                              $$->AdoptChildren( id );
                           }
                         | IDENTIFIER TypeModifier LPAREN RPAREN
                           {
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              $$ = new NodeAbstract();
                              $$->set_name( "ObjectInitializer" );

                              id->MakeSibling( $2 );

                              $$->AdoptChildren( id );
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
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              $$ = new NodeAbstract();
                              $$->set_name( "NumberInitializer" );
                              
                              id->MakeSibling( $2 );
                              id->MakeSibling( $4 );

                              $$->AdoptChildren( id );
                           }
                         | IDENTIFIER LPAREN Expression RPAREN
                           {
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              $$ = new NodeAbstract();
                              $$->set_name( "NumberInitializer" );
                              
                              id->MakeSibling( $3 );
                              $$->AdoptChildren( id );
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

StrInitializer           : IDENTIFIER  TypeModifier LPAREN STR_TOKEN RPAREN
                           {
                              $$ = new NodeAbstract();
                              
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              NodeAbstract *value( nullptr );
                              value = new NodeAbstract();
                              assert( value != nullptr );
                              value->set_name( *$4 );
                              delete( $4 );

                              $$->set_name( "StringInitializer" );
                              id->MakeSibling( value );
                              id->MakeSibling( $2 );
                              $$->AdoptChildren( id );
                           }
                         | IDENTIFIER LPAREN STR_TOKEN RPAREN
                           {
                              $$ = new NodeAbstract();
                              
                              NodeAbstract *id( nullptr );
                              id = new NodeAbstract();
                              assert( id != nullptr );
                              id->set_name( *$1 );
                              delete( $1 );

                              NodeAbstract *value( nullptr );
                              value = new NodeAbstract();
                              assert( value != nullptr );
                              value->set_name( *$3 );
                              delete( $3 );

                              $$->set_name( "StringInitializer" );
                              id->MakeSibling( value );
                              $$->AdoptChildren( id );
                           }
                         ;


InstantModifier   :     FINAL SYSTEM
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "Final System" );
                        }
                  |     FINAL
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "Final" );
                        }
                  |     ABSTRACT
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "Abstract" );
                        }
                  |     
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "No Instantiation Modifier" );
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
                           NodeAbstract *ot = new NodeAbstract();
                           ot->set_name( "ObjectType" );
                           ot->AdoptChildren( $1 );
                        }
                  ;

TypeModifier      :     LBRACKET ArraySize RBRACKET
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "TypeModifier" );
                           $$->AdoptChildren( $2 );
                        }
                  |     LBRACKET RBRACKET /* dynamic array */
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "DynamicArray" );
                        }
                  |     LCARROT GenericInstantiationList RCARROT LBRACKET ArraySize RBRACKET
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "TypeModifier->GenericArray" );
                           $$->AdoptChildren( $2 );
                           $$->AdoptChildren( $5 );
                        }
                  |     LCARROT GenericInstantiationList RCARROT
                        {  
                           $$ = new NodeAbstract();
                           $$->set_name( "TypeModifier->Generic" );
                           $$->AdoptChildren( $2 );
                        }     
                  |     LCARROT GenericInstantiationList RCARROT LBRACKET RBRACKET
                        {
                           $$ = new NodeAbstract();
                           $$->set_name( "TypeModifier->GenericDynamicArray" );
                           $$->AdoptChildren( $2 );
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

AllowedGenericInstTypes : IDENTIFIER
                          {
                              NodeAbstract *all( nullptr );
                              all = new NodeAbstract();
                              assert( all != nullptr );
                              all->set_name( "Allowed -> Object" );
                              NodeAbstract *object( nullptr );
                              object = new NodeAbstract();
                              assert( object != nullptr );
                              std::stringstream ss;
                              ss << *$1;
                              object->set_name( ss.str() );
                              delete( $1 );
                              all->AdoptChildren( object );
                              $$ = all;
                          }
                        | Literal
                          {
                              NodeAbstract *all( nullptr );
                              all = new NodeAbstract();
                              assert( all != nullptr );
                              all->set_name( "Allowed -> Literal" );
                              all->AdoptChildren( $1 );
                              $$ = all;
                          }
                        | Number
                          {
                              NodeAbstract *all( nullptr );
                              all = new NodeAbstract();
                              assert( all != nullptr );
                              all->set_name( "Allowed -> Number" );
                              all->AdoptChildren( $1 );
                              $$ = all;
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
                        $$ = new NodeAbstract();
                        $$->set_name( "UnaryExpression 1" );
                        $$->AdoptChildren( $1 );
                     }
                  |  ArithmeticUnaryOperator CastExpression
                     {
                        $$ = new NodeAbstract();
                        $$->set_name( "UnaryExpression 2" );
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
                                 std::cerr << "StreamCall\n";
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
            |  DelayedName LBRACKET ArraySize RBRACKET
               {
                  $$ = new NodeAbstract();
                  $$->set_name( "DelayedName" );
                  $$->MakeSibling( $1 );
                  $$->MakeSibling( $3 );
               }
            ;

FieldAccess :  NotJustName PERIOD IDENTIFIER
               {
                  //TODO start here, 29 Dec 2013
                  $$ = new NodeAbstract();
                  $$->set_name( "FieldAccess" );
                  $$->MakeSibling( $1 );
                  NodeAbstract *field_name( nullptr );
                  field_name = new NodeAbstract( );
                  assert( field_name != nullptr );
                  field_name->set_name( *$3 );
                  delete( $3 );
                  $$->MakeSibling( field_name );
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
