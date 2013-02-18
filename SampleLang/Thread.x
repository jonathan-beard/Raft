/**
 * Thread.x - Implementation file for use of Threads within
 * AutoPipev3. 
 * @version 3.0b, Last Modified 18 February 2013
 * @author Jonathan Beard
 * @contact jbeard@wustl.edu
 */

/**
 * Thread - abstract class, which means it must
 * be sub-classed with all abstract functions 
 * implemented in order to be instantiated.  The
 * Thread is a container object which holds a single
 * or multiple Kernel objects that are all intended
 * to be run on this thread 
 */
define abstract class Thread {
@public:
   /**
    * AddKernel - adds the parameter Kernel to this 
    * thread if it is valid.  Validity of the Kernel
    * is tested by the abstract method IsValidKernel
    * which must be implemented by sub-classes
    * @param   kernel   -  Kernel
    * @param   bool - true if the kernel is added
    */
   bool AddKernel( Kernel kernel )
   {
      if( IsValidKernel( kernel ) ){
         kernels.add( kernel );
      }
   }
   /**
    * GetKernels - returns the array of currently
    * assigned Kernels
    */1
   Array<Kernel> GetKernels( ){
      return( kernels );
   }
   /**
    * IsValidKernel - to be implemented by sub-classes
    * so that the AddKernel method can tell if a Kernel
    * being added to this thread is a valid Kernel.
    * @param   kernel   - Kernel
    * @return  bool - true if parameter Kernel is valid
    */
   abstract bool IsValidKernel( Kernel kernel );
   /**
    * AreThreadsCombinable - method intended to be implemented
    * by sub-classes that will return true if the parameter
    * thread is in fact combinable with this thread
    * @param other - Thread
    * @return bool - true if they are combinable
    */
   abstract bool AreThreadsCombinable( Thread other );
   /**
    * CombineThread - combines the parameter thread
    * with this thread, destroys the parameter thread
    * after the combination is successful.  The caller
    * should call the AreThreadsCombinable method before
    * calling this method to ensure that they are in 
    * fact compatible
    * @param   other - Thread
    * @return  void
    */
   abstract void CombineThread( Thread other );

@private:
   /**
    * kernels - list of Kernels currently assigned to 
    * this thread
    */
   Array<Kernel> kernels;
};

define class CThread : extends Thread {
@public:
   implements bool IsValidKernel( Kernel kernel ){
      
   }
   
   bool AreThreadsCombinable( Thread other )
   {
      if( other.class == CThread.class ){
         return( true );
      }else if( other.class == CPlusPlusThread.class ){
         return( true );
      }else {
         return( false );
      }
   }
   void CombineThreads( Thread other )
   {

   }
@private:
   Array<Kernel> kernels;
};

