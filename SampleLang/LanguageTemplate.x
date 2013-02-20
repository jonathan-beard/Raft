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
 * String
 */

import AP.Kernel;
import AP.Thread;
import AP.Process;
import AP.Container;


/**
 * Note: when you use generics such as this the 
 * class invocation automatically gets a type 
 * specifier such as GenInt< y0 = int64_t > some_name_for_object
 * otherwise it is assumed that you want the runtime
 * to automatically determine what the type should be
 * if the run-time can't figure it out then an error is 
 * thrown.
 */
define class GenInt : extends Kernel{
@public:
   GenInt( int64_t seed ) : seed( seed )
   {
      SetImplementations( "gen.c", "gen.vhd", "gen.cu" );
   }

@ports:
   Output< Generic( { int32_t, int64_t } ) > y0;

@configs:
   /* single type, no need to specify variables */
   Config< int64_t > seed;
}

define class Sum : extends Kernel{
@public:
   Sum( )
   {
      SetImplementations( "sum.c", "sum.vhd" );
   }

@ports:
   Input< Generic( { int32_t, int64_t, float } ) > x0;
   Input< Generic( { int32_t, int64_t, float } ) > x1;
   Output< Generic( {int32_t, int64_t, float } ) > y0;

@private:
   typedef Generic( {int32_t, int64_t, float } )
}

define class Print : extends Kernel{
@public:
   Print( )
   {
      SetImplementations( "print.cpp" );
   }

@ports:
   Input< Generic( { int32_t, int64_t, float } ) > x0;
}

define main
begin
   GenInt<int64_t> gen1, gen2;
   Sum sum;
   Print print;
   CPlusPlusProcess A;
   A.AddKernel( AP.MakeList( gen1, gen2, sum, print ) );
   AutoLink( gen1.y0, sum.x0 );
   AutoLink( gen2.y0, sum.x1 );
   AutoLink( sum.y0, print.x0 );
end
