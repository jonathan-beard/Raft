/**
 * ClassDeclaration.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan  1 17:00:38 2014
 */
#include "ClassDeclaration.hpp"

using namespace Node;

ClassDeclaration::ClassDeclaration( const std::string classname ) : Declaration( classname )
{
   class_tree.addRelation( typeid( Node::Declaration ).hash_code(),
                           typeid( Node::ClassDeclaration ).hash_code() );
   /** nothing to do here **/
}
