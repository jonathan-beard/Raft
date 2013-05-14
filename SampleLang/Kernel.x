/**
 * Kernel.x - this file defines all the base types
 * for kernel implementations in AutoPipe v3.0
 * @author: Jonathan Beard
 * @version: AutoPipev3.0b, Last Modified 18 February 2013
 * @contact: jbeard@wustl.edu
 */

/**
 * NOTE: There's an implicit system class BasicType too
 */


/**
 * Generic - extends Type which is the built-in
 * class for all basic types.  This class is to 
 * be used for specifying generic AutoPipe types
 * with the options for implementing the generic
 * type specified within the Generic constructor.
 * Within the implementation file itself the type
 * should be specified as GENERIC which will be 
 * replaced at compile time with the correct type
 * for the given variable.  The types should also be 
 * valid types for the language as specified within
 * the XML types specification file.
 */
define final system class Generic< Type {...} > : extends Type {
@public:
   /**
    * Generic - Constructor, parameters are 
    * one or more valid Type objects, or a
    * valid type definition object
    * @param type - Type variable length array
    */
   Generic( );
   
   Array<Type> get_types();  
};

/**
 * Input - simple class that defines an in-edge
 * AutoPipe port for each compute Kernel.  The
 * class constructor modifiers <> force the user
 * to specify a type, generic or a typedef, and
 * allow the user to select data-flow semantics
 * either ASDF or SDF.  If the user selects SDF
 * then the user can further select Consume( XX )
 * where XX is some number greater than zero, this
 * field has no effect for ASDF
 */
define final system class Input< Type T, enum DataFlow( ASDF ), int64_t Consume( -1 ) > {
@public:
   /** 
    * Input constructor for a single type, the 
    * implementation is built-into the runtime
    */
   Input( );
  
   /** 
    * HasType - returns true if this port either is
    * of the parameter type or has the capability
    * of being the type using generics
    * @param   type - Type
    * @return  bool - true if this port does have the type
    */
   bool HasType( Type type );

};

/**
 * Output - simple class that defines an out-edge
 * AutoPipe port for each compute Kernel.  The two
 * constructors provided allow for the user to specify
 * either a Generic port type or a single port type
 */
define final system class Output< Type T, enum DataFlow( ASDF ), int64_t Consume( -1 ) > {
@public:
   /**
    * Output constructor for a single data type, the
    * implementation is built-into the runtime
    */
   Output( );
   
   /** 
    * HasType - returns true if this port either is
    * of the parameter type or has the capability
    * of being the type using generics
    * @param   type - Type
    * @return  bool - true if this port does have the type
    */
   bool HasType( Type type );
};

/**
 * Config - system class that allows the user
 * to specify compile time configuration parameters
 * for specific AutoPipe kernels.
 */
define final system class Config< BasicType type >
{
@public:
   /**
    * Config - system implemented configuration parameter
    */
   Config( );
   /**
    * get_type - system method that returns the 
    * type for this configuration parameter 
    */
   BasicType get_type();
}

/** 
 * Kernel - abstract implementation for a Kernel, user
 * has the option of either using the constructor
 * which is rather cumbersome or make a sub-class
 * of this method to make a cleaner invocation.  
 */
define abstract class Kernel {

/* if you were to define ports in this abstract kernel
 * you'd do so like this
 */

/**
@ports:
   Input<int64_t, SDF, 8>  x0;
   Input<int32_t, SDF, 100> x1;
**/

/* If you were to define configuration parametsers to a 
 * kernel this is how you'd do it
 */
/**
@configs:
   Config<int64_t> seed( 1000 );
**/

@public:

   void SetImplementations( String implementations = {...} )
   {
      foreach( String str : implementations ){
         impls.AddItem( str );
         ImplType type = AP.GetType( str );
         impl_types.AddItem( type );
      }
   }

@private:
   /** 
    * impls - original implementation file
    * paths
    */
   Array<String>     impls;
   /**
    * stores enumerated impl types based
    * on XML file that defines what each
    * implementation file extension maps to
    */
   Array<AP.ImplType>   impl_types; 
};