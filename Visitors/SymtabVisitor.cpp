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
#include "data.hpp"

using namespace Visitor;

SymtabVisitor::SymtabVisitor( Raft::Data &data ) : 
                            DefaultVisitor( data )
{
   /* nothing really to do here */
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
SymtabVisitor::Visit( Node::NodeAbstract &node )
{
   std::cerr << "wrong one called!!\n";
   VisitChildren( node );
}

void
SymtabVisitor::Visit( Node::VariableDeclaration  &node )
{
   std::cout << "Called on : ";
   node->print( std::cout ) << "\n";
   std::stringstream ss;
   node->print( ss );
   temp_st.push_back( ss.str() );
   
   VisitChildren( node );
}
