/**
 * Link.x - this file defins all the links 
 * for the AutoPipev3 run-time system.  
 */

/**
 * Link - every link type must sub-class this 
 * class.
 */
define abstract class Link {
   /* the root class calls register which will register
    * the invoking sub-class so that the  AP run-time
    * knows exactly which links are in existence.
    * RegisterLink will take the subclass and its 
    * implementations to tell what types of Kernels
    * it can link to.
    */
   Link( Kernel source, 
         Kernel destination ) : AP.RegisterLink( (this) ) {};

}
