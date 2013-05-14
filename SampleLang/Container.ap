define interface Container<T>{
@public:
   void AddItem( T item );
   T    DeleteItem( int64_t index );
   T    GetItem( int64_t index );
};

define class Array<T> : implements Container<T> {
@public:
   Array( int64_t item_count = 10 ) : curr_size( 0 ), 
                                      allocated_size( item_count )
   {
      /* dynamically "create" space for item_count items */
      the_array = new T[item_count];
   }

   implements void AddItem( T item )
   {
      if( curr_size == allocated_size )
      {
         T new_array = new T[ allocated_size * 2 ];
         for( int64_t i(0); i < curr_size; ++i )
         {
            new_array[i] = the_array[i];
         }
         the_array = new_array;
      }

   }

   implements T DeleteItem( int64_t index )
   {
      if( index > ( curr_size - 1 ) ){ return( NULL ); }
      T item = the_array[ index ];
      for( int64_t i( index ); i < ( curr_size - 1 ); ++i )
      {
         the_array[ index ] = the_array[ index + 1 ];
      }
      the_array[ curr_size - 1 ] = NULL;
      return( item );
   }

   implements T GetItem( int64_t index )
   {
      if( index > (curr_size - 1 ) ){ return( NULL ); }
      return( the_array[index] );
   }


@private:
   T the_array;
   int64_t curr_size;
   int64_t allocated_size;
};
