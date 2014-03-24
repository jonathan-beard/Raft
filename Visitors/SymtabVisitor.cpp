/**
 * SymtabVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Fri May 24 08:00:53 2013
 */
#include  <iostream>
#include "SymtabVisitor.hpp"
#include "NodeAbstract.hpp"
#include "Declaration.hpp"
#include "VariableDeclaration.hpp"
#include "FieldVarDecl.hpp"
#include "data.hpp"
#include <sstream>
#include <utility>

using namespace Visitor;

SymtabVisitor::SymtabVisitor( Raft::Data &data ) : 
                            DefaultVisitor( data )
{
   /* nothing really to do here */
   visit_methods.insert( std::make_pair( typeid( Node::NodeAbstract ).hash_code(),
                                        AbstractVisit ) );

   visit_methods.insert( std::make_pair( typeid( Node::VariableDeclaration ).hash_code(),
                                        VarVisit ) );
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
SymtabVisitor::AbstractVisit( Node::VariableDeclaration &node, Visitor::DefaultVisitor &visitor )
{
   visitor.VisitChildren( node );
}

void
SymtabVisitor::VarVisit( Node::VariableDeclaration &node, Visitor::DefaultVisitor &visitor )
{
   std::stringstream ss;
   node.print( ss );
   temp_st.push_back( ss.str() );
   visitor.VisitChildren( node );
}
