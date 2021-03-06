/**
 * StreamingMethodDeclaration.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 06:44:01 2014
 */
#include "StreamingMethodDeclaration.hpp"

using namespace Node;

StreamingMethodDeclaration::StreamingMethodDeclaration( const std::string name ) 
         : Declaration( name ) 
{
   class_tree.addRelation( typeid( Node::Declaration ).hash_code(),
                           typeid( Node::StreamingMethodDeclaration ).hash_code() );
}
