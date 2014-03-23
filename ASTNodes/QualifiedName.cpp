/**
 * QualifiedName.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:30:10 2013
 */
#include "QualifiedName.hpp"

using namespace Node;

QualifiedName::QualifiedName( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::QualifiedName ).hash_code() );
   /** nothing to do here **/
}
