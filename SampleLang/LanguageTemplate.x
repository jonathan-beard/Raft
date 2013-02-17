/**
 * LanaguageTemplate.x - this is the prototype language file that'll
 * define all the basic structures that we'll need for AutoPipe
 * version 3.  This isn't a compiled language, rather an interpreted
 * one.  
 * Basic Types: 
 * int8_t   8-bits
 * int16_t  etc...
 * int32_t
 * int64_t
 * uint8_t
 * uint16_t
 * uint32_t
 * uint64_t
 * float32_t
 * float64_t
 * float96_t
 */
define class Input {
@public:
   Input( String n, Type t ) : name( n ),
                               type( t ) {};
   autogen name, type;

@private:
   String name;
   Type type;
};

define class Output {
@public:
   Output( String n, Type t ) : name( n ),
                                type( t ) {};
   autogen name, type;
@private:
   String name;
   Type type;
};

define abstract class Kernel {
@public:
   autogen impl, inputs, outputs;

@private:
   string impl;
   Array<Input> inputs;
   Array<Output> outputs;
};

define interface ProcessInterface {
@public:
   autogen abstract impl;
   bool AreKernelsCombinable( ProcessInterface other );
   void CombineKernels( ProcessInterface other );

@private:
   string impl;
};

define abstract class Thread {
@public:
   bool AddKernel( Kernel kernel )
   {
      if( IsValidKernel( kernel ) ){
         kernels.add( kernel );
      }
   }
   
   abstract bool IsValidKernel( Kernel kernel );
   abstract bool AreKernelsCombinable( Thread other );
   abstract void CombineKernels( Thread other );
@private:
   Array<Kernel> kernels;
};

define class Process : implements ProcessInterface {
@public: 
   autogen impl;
};

define class ZynqFPGAProcess : extends Process {
@public:
   ZynqFPGAProcess( ) : super.set_impl( ZyngFPGAProcess ) {};
};

define class CThread : extends Thread {
@public:
   bool AreKernelsCombinable( Thread other )
   {
      if( other.class == CThread.class ){
         return( true );
      }else if( other.class == CPlusPlusThread.class ){
         return( true );
      }else {
         return( false );
      }
   }
   void CombineKernels( Thread other )
   {

   }
};

define class CProcess : extends Process {
@public:
   CProcess( ) : super.set_impl( CProcess ),
                 cpu_affinity( 0 ){};

   autogen cpu_affinity;

@private:
   size_t cpu_affinity;
};


define lang Java {
   impl(JavaProcess);
}

define platform x86 {
   produce C(Cx86Produce);
   produce C++(CPlusPlusx86Produce);
   produce Java(Javax86Produce);
}

define platform ARM {
   produce C(CARMProduce);
   produce C++(CPlusPlusARMProduce);
}
