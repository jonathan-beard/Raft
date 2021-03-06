/**
 * Options_Vars.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Dec 14 13:41:06 2012
 */
#include <cassert>
#include <unistd.h>
#include <errno.h>
#include <cstdlib>
#include <cstring>

#include "options_vars.hpp"

Options_Vars::Options_Vars()
{
   load_defaults();
}

Options_Vars::~Options_Vars()
{ /* nothing to do here */ }

void 
Options_Vars::load_defaults()
{
   /* misc */
   help = false;
   verbose = true;
   output_topology_image = false;
   clean = false;
   generate_ap_v2_compat = false;


   /* set code directory to pwd */
   const size_t buffer_size( 4096 );
   char pwd[ buffer_size ];
   memset( pwd, '\0', sizeof(char) * buffer_size );
   errno = EXIT_SUCCESS;
   char *ret_val_pwd( nullptr );
   ret_val_pwd = getcwd( pwd, buffer_size );
   assert( ret_val_pwd != nullptr );
   assert( errno == EXIT_SUCCESS );
   send_code_to_directory = std::string( pwd );

   /* optimization stuff */
   optimization_level = 0;
   use_genetic_algorithm = false;
   use_simulated_annealing = false;
   enter_graph_modeler_mode = false;

   
   /* image options */
   unmapped_image_suffix = "_unmapped";
   mapped_image_suffix = "_mapped";
   dir_for_images = std::string( pwd ) + "/images";
   hardware_map_image = false;

   /* params for mapping */
   map_objective = "random.mo";
   hardware_defs_file = "hwdef.xml";
   comm_hardware_defs_file = "commdef.xml";
   hardware_configuration_rules = "hw.config";
   /* global max allowable buffer size */
   max_buffer_size = ( (int64_t) 1 << 31 );

   /* generate deployment package for multiple targets */
   generate_run_package = false;

   /* dump options */
   dump_cpp_output = false;
   dump_include_file_list = false;
   dump_parse_stream = false;

   input_full_path = get_default_string();
   input_filename = get_default_string();
   input_dir_path = get_default_string();
}

std::string 
Options_Vars::get_default_string(){
   return("NONE");
}

bool  
Options_Vars::is_string_default(const std::string &val ){
   return( val.compare( get_default_string() ) == 0 );
}
