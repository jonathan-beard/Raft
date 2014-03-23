#include "VoidType.hpp"

using namespace Node;

VoidType::VoidType() : Type( "Void" )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::VoidType ).hash_code() );
   /* nothing else to do */
}
