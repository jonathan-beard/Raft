/**
 * DefaultVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include <iostream>
#include <cassert>

#include "DefaultVisitor.hpp"
#include "NodeAbstract.hpp"


DefaultVisitor::DefaultVisitor() : errstream( std::cerr )
{
     
}

DefaultVisitor::DefaultVisitor( const DefaultVisitor &visitor ) :
                                       errstream( visitor.errstream );
{
   /* not much to copy at the moment */
}

DefaultVisitor::~DefaultVisitor()
{
   /* nothing to destroy :( */
}

void DefaultVisitor::VisitChildren( NodeAbstract *node )
{
    
}

void DefaultVisitor::Error( std::string s )
{
   errstream << s << std::endl;
}
