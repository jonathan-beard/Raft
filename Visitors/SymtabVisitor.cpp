/**
 * SymtabVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Fri May 24 08:00:53 2013
 */
#include  <iostream>
#include <sstream>

#include "SymtabVisitor.hpp"
#include "NodeAbstract.hpp"
#include "Declaration.hpp"
#include "VariableDeclaration.hpp"
#include "FieldVarDecl.hpp"
#include "data.hpp"

using namespace Visitor;

SymtabVisitor::SymtabVisitor( Raft::Data &data ) : 
                            DefaultVisitor( data )
{
   {
      const size_t hash( typeid( Node::NodeAbstract ).hash_code() );
      visit_methods.insert( std::make_pair( hash,
                                            AbstractVisit ) );
   }                                         
   {
      const size_t hash( typeid( Node::VariableDeclaration ).hash_code() );
      visit_methods.insert( std::make_pair( hash,
                                            VarVisit ) );
   }
}

SymtabVisitor::~SymtabVisitor()
{
   std::cerr << "Symbols: \n";
   for( std::string &str : temp_st )
   {
      std::cerr << str << "\n";
   }
}

void
SymtabVisitor::AbstractVisit( Node::NodeAbstract &node, 
                              Visitor::DefaultVisitor &visitor )
{
   visitor.VisitChildren( node );
}

void
SymtabVisitor::VarVisit( Node::NodeAbstract &node, 
                         Visitor::DefaultVisitor &visitor )
{
   Node::VariableDeclaration &vardecl( 
      reinterpret_cast< Node::VariableDeclaration& >( node ) );
   std::stringstream ss;
   vardecl.print( ss );
   Visitor::SymtabVisitor &v( 
      reinterpret_cast< Visitor::SymtabVisitor& >( visitor ) );
   v.temp_st.push_back( ss.str() );
   v.VisitChildren( vardecl );
}
