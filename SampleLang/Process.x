/**
 * Process.x - defines all the basics for a new process
 * type within AutoPipev3.  What we consider a process
 * is a single scheduler with potentially many threads
 * or in the case of FPGA's multiple kernels on a single
 * FPGA.  The definition is intentionally kept generic
 * so that extensions can be made easily and seamlessly.
 * @version: AutoPipev3.0b Last Modified 18 February 2013
 * @author: Jonathan Beard
 * @contact: jbeard@wustl.edu
 */

/**
 * ProcessInterface - interface for a generic process
 * only one implementation is allowed for a single 
 * process type, the implementation is the skeleton
 * scheduler file that'll determine how each process
 * is called.  When assigning Kernels to a single 
 * process the expected behavior is that they will 
 * all be assigned to a single thread in software 
 * and a single FPGA in hardware.  If multiple threads
 * are wanted in software then multiple threads can be
 * requested depending on the implementation.
 */
define interface ProcessInterface {
@public:
   /**
    * set_impl - set the implementation for the 
    * C++ skeleton file that is the scheduler
    * implementation.
    * @param   implementation - String
    * @return void
    */
   void set_impl( String implementation );
   /**
    * get_impl - returns the String object with the implementation
    * of this process
    * @return  String
    */
   String get_impl( );
   /**
    * IsProcessCombinable - checks to see if the process in the
    * parameter is compatible to be combined with this object
    * @param   other    - ProcessInterface 
    * @return  bool - true if the are combinable
    */
   bool IsProcessCombinable( ProcessInterface other );
   /**
    * CombineProcess - combines the param process with this one,
    * it is assumed that the user has already called IsProcessCombinable
    * otherwise underfined behavior may occur if the processes
    * are in fact not combinable.  
    * @param   other - ProcessInterface
    * @return void
    */
   void CombineProcess( ProcessInterface other );

   /**
    * AddKernel - ensures that sub-classes add a method that
    * looks like this to add a Kernel object
    * @param   kernel - Kernel
    * @return  bool - true if the Kernel was added
    */
   bool AddKernel( Kernel kernel );
   /**
    * GetKernels - ensures that sub-classes add a method to 
    * get the kernels stored on this system that looks like this
    * @return  Array<Kernel>
    */
   Array<Kernel> GetKernels( )
};

/**
 * Process - abstract class that implements some of the 
 * functions defined in the ProcessInterface
 */
define abstract class Process : implements ProcessInterface {
@public: 
   /* autogenerate getters / setters */
   autogen impl;
   
   /** 
    * AddKernel - adds the param Kernel to this Process,
    * calls the method IsValidKernel on the param Kernel
    * to ensure that it is in fact compatible.
    * @param   kernel   - Kernel
    * @return  bool  - true if the addition is successful
    */
   implements bool AddKernel( Kernel kernel )
   {
      if( IsValidKernel( kernel ) ){
         kernels.add( kernel );
      }
   }

   /**
    * GetKernels - returns an array of the assigned 
    * Kernels
    * @return Array<Kernel>
    */
   implements Array<Kernel> GetKernels( ){
      return( kernels );
   }

   /**
    * IsValidKernel - method to be implemented by sub-classes
    * that returns true if the kernel is valid to be assigned
    * to this type of process
    * @param   kernel - Kernel
    * @return  bool
    */
   abstract bool IsValidKernel( Kernel kernel );
@private:
   /**
    * String that stores the location of the implementation
    * file for this type of process 
    */
   String impl;
   /**
    * list of assigned kernels
    */
   Array<Kernel> kernels;
};

/**
 * VHDLProcess - implements code necessary to 
 * synthesize for an FPGA, once this process
 * is assigned a valid platform
 */
define class VHDLProcess : extends Process {
@public:
   /**
    * VHDLProcess - public construcotr, sets the implementation
    * file, inherits all the methods defined in Process
    */
   VHDLProcess( ) : super.set_impl( VHDLProcess ) {};

   overrides bool IsValidKernel( Kernel kernel )
   {
      foreach( AP.ImplType type : kernel.get_impl_types ){
         if( AP.GetImplTypeFor( (this).class ) == type )
         {  
            return( true );
         }
      }
      return( false );
   }

   implements bool IsProcessCombinable( ProcessInterface other )
   {
      if( other.class() == (this).class ){ return( true ); }
      return( false );
   }

   implements void CombineProcess( ProcessInterface other )
   {
      /* assume that IsProcessCombinable has already been called */
      foreach( Kernel k : other.GetKernels() )
      {
         AddKernel( k );
      }
      other.destroy();
   }
};

/**
 * CProcess - implements a process in the C language
 */
define class CProcess : extends Process {
@public:
   /**
    * CProcess - public constructor, sets default
    * cpu_affinity to CPU zero and the implementation
    * file to CProcess
    */
   CProcess( ) : super.set_impl( CProcess ),
                 cpu_affinity( 0 ){};

   overrides bool IsValidKernel( Kernel kernel )
   {
      foreach( AP.ImplType type : kernel.get_impl_types ){
         if( AP.GetImplTypeFor( (this).class ) == type )
         {  
            return( true );
         }
      }
      return( false );
   }

   implements bool IsProcessCombinable( ProcessInterface other )
   {
      if( other.class() == (this).class ){ return( true ); }
      return( false );
   }

   implements void CombineProcess( ProcessInterface other )
   {
      /* assume that IsProcessCombinable has already been called */
      foreach( Kernel k : other.GetKernels() )
      {
         AddKernel( k );
      }
      other.destroy();
   }


   autogen cpu_affinity;

@private:
   /* an array of threads */
   Array<Thread> threads;
   /* an array of cpu_affinities */
   Array<int64_t> cpu_affinity;
};

define class CPlusPlusProcess : extends Process {
@public:
   CPlusPlusProcess( ) : super.set_impl( CPlusPlusProcess ),
                         cpu_affinity( 0 ){};

@private:
   int64_t cpu_affinity;
};
