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

import Kernel.x;
import Thread.x;
import Process.x;
import Container.x;

define class GenInt : extends Kernel{
@public:
   GenInt( int64_t seed ) : y0.set_type( type ),
                                               seed( seed )
   {
      SetImplementations( "gen.c", "gen.vhd", "gen.cu" );
   }

@ports:
   Output< Generic( { int32_t, int64_t } ) > y0;

@configs:
   Config< int64_t > seed;
}

define class Sum : extends Kernel{
@public:
   Sum( ) : 

@ports:
   Input< Generic( { int32_t, int64_t, float } ) > x0;
}

define main
begin
   
end
