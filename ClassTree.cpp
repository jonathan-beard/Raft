#include "ClassTree.hpp"
#include <utility>


ClassTree::~ClassTree()
{
   for( auto it( tree.begin() ); it != tree.end(); ++it )
   {
      delete( (*it).second );
   }
}

void
ClassTree::addRelation( const size_t base, const size_t derived )
{
   /**
    * if base == zero then no parent class, simply add
    * derived to the tree
    */
   if( ! base ) 
   {
      tree.insert( std::make_pair( derived, new Node( derived ) ) );
   }
   auto base_found( tree.find( base ) );
   auto derived_found( tree.find( derived ) );
   bool base_exists( base_found != tree.end() );
   bool derived_exists( derived_found != tree.end() );

   if( base_exists && ! derived_exists )
   {
      /**
       * case where the base is already present, but
       * the derived class hasn't been entered yet.
       */
       Node *parent( base_found->second );
       Node *child( new Node( derived, parent ) );
       tree.insert( std::make_pair( derived, child ) );
       return;
   }
   else if( ! base_exists && ! derived_exists )
   {
     /**
      * simple case, nothing exists so far,
      * create both and add them to the tree.
      */
      Node *parent( new Node( base ) );
      Node *child( new Node( derived, parent ) );
      tree.insert( std::make_pair( base, parent ) );
      tree.insert( std::make_pair( derived, child ) );
      return;
   }
   else if( ! base_exists && derived_exists )
   {
      /** 
       * case exists if we insert a derived 
       * class that has no existing parent, 
       * therefore we make one.  When we attempt
       * to add the base class we end up with a 
       * case where the derived class exists, but
       * with parent as self
       */
      Node *parent( new Node( base ) );
      Node *child( derived_found->second );

      child->parent = parent;

      tree.insert( std::make_pair( base, parent ) );
      return;
   }
   else if( base_exists && derived_exists )
   {
      /** check and see if derived has base as a parent **/
      Node *parent( base_found->second );
      Node *child( derived_found->second );
      child->parent = parent;
      return;
   }
}

size_t
ClassTree::getClosestTo( const size_t class_type ,FunctionMap  &function_map )
{
   /**
    * NOTE: You might get some strange errors with this function
    * if there is an ASTNode that is not in the tree, if you 
    * notice the first line we implicitly check to find an entry
    * point that is one of the leaves in the tree.  If it doesn't
    * exist then there's no entry point and zero is returned.  
    * This behavior can be guarded against by being very careful
    * about adding ASTNodes to the tree.  Its okay to add them
    * more than once, just not zero times.
    */
   auto found( tree.find( class_type ) );
   if( found == tree.end() ) return( 0 );
   /** else start **/
   Node *node( found->second );
   do
   {
      auto match( function_map.find( node->key ) );
      if( match != function_map.end() )
      {
         /* we've a winner */
         return( (*match).first );
      }
      node = node->parent;
   }while( node->parent != node );
   /** no matching class hashes found, return zero **/
   return( 0 );
}


ClassTree::Node::Node( size_t key ) : parent( this ),
                                      key( key )
{

}

ClassTree::Node::Node( size_t key,
                       Node   *parent ) : parent( parent ),
                                          key( key )
{

}
