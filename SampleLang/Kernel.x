/**
 * Kernel.x - this file defines all the base types
 * for kernel implementations in AutoPipe v3.0
 * @author: Jonathan Beard
 * @version: AutoPipev3.0b, Last Modified 18 February 2013
 * @contact: jbeard@wustl.edu
 */


/**
 * Generic - extends Type which is the built-in
 * class for all basic types.  This class is to 
 * be used for specifying generic AutoPipe ports
 * with the options for implementing the generic
 * type specified within the Generic constructor.
 * Within the implementation file itself the type
 * should be specified as GENERIC which will be 
 * replaced at compile time with the correct type
 * for the given port.  The types should also be 
 * valid types for the language as specified within
 * the XML types specification file.
 */
define class Generic : extends Type {
@public:
   /**
    * Generic - Constructor, parameters are 
    * one or more valid Type objects.
    * @param type - Type variable length array
    */
   Generic( Type type = {...} ){
      foreach( Type t : type ){
         types.AddItem( t );
      }
   }

@private:
   Array<Type> types;

};

/**
 * Input - simple class that defines an in-edge
 * AutoPipe port for each compute Kernel.  The 
 * two constructors provided allow the user to
 * specify either a Generic port type or a single
 * port type.
 */
define class Input {
@public:
   /** 
    * Input constructor for a single type
    * @param   n  - String name for port
    * @param   t - Type for port
    */
   Input( String n, Type t ) : name( n ),
                               type( t ),
                               is_generic( false ){};
   /**
    * Input constructor for generic types
    * @param   n - String name for port
    * @param   g  - Generic object with types for ports
    */
   Input( String n, Generic g ) : name( n ),
                                  generic_types( g ),
                                  is_generic( true ){};
   
   autogen name, type, generic_types, is_generic;

@private:
   /* port name */
   String name;
   /* port type if single port */
   Type type;
   /* valid types for port if multiple valid port types */
   Generic generic_types;
   /* set true if generic_types was set in constructor */
   bool  is_generic;
};

/**
 * Output - simple class that defines an out-edge
 * AutoPipe port for each compute Kernel.  The two
 * constructors provided allow for the user to specify
 * either a Generic port type or a single port type
 */
define class Output {
@public:
   /**
    * Output constructor for a single data type
    * @param n - String name for port
    * @param t - Type object for port
    */
   Output( String n, Type t ) : name( n ),
                                type( t ),
                                is_generic( false ){};
   /**
    * Output constructor for generic types
    * @param   n - String name for port
    * @param   g - Generic object with types for ports
    */
   Output( String n, Generic g ) : name( n ),
                                   generic_types( g ),
                                   is_generic( true ){};
   autogen name, type, generic_types, is_generic;

@private:
   /* port name */
   String name;
   /* port type if single port data type */
   Type type;
   /* valid types for port if multiple port types */
   Generic generic_types;
   /* set true if generic was set in the constructor */
   bool is_generic;
};

/** 
 * Kernel - implementation for a Kernel, user
 * has the option of either using the constructor
 * which is rather cumbersome or make a sub-class
 * of this method to make a cleaner invocation.  
 */
define class Kernel {
@public:
   /**
    * Kernel constructor, takes a list of implementations,
    * In-Edge types and out-edge types
    */
   Kernel( String implementations = {...},
           Input  in_edges = {...},
           Ouput  out_edges = {...} )
   {
      foreach( String str : implementations ){
         impls.AddItem( str );
         ImplType type = AP.GetType( str );
         impl_types.AddItem( type );
      }
      foreach( Input input : in_edges ){
         inputs.AddItem( input );
      }
      foreach( Output output : out_edges ){
         outputs.AddItem( output );
      }
   }

   autogen impls, inputs, outputs, impl_types;

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
   /**
    * array of input objects
    */
   Array<Input>      inputs;
   /**
    * array of output objects
    */
   Array<Output>     outputs;
};
