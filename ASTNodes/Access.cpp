/**
 * Access.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 15:35:23 2014
 */
#include "Access.hpp"

using namespace Node;

Access::Access() : Returns( "Access" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::Access ).hash_code() );

}

Access::Access( const std::string name ) : Returns( name )
{   
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::Access ).hash_code() );
}
