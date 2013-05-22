/**
 * AP_Options_Vars.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Dec 14 13:41:06 2012
 */
#include <cassert>

#include "ap_options_vars.hpp"

AP_Options_Vars::AP_Options_Vars()
{
   load_defaults();
}

AP_Options_Vars::~AP_Options_Vars(){ /* nothing to do here */ }

void AP_Options_Vars::load_defaults()
{
   /* misc */
   help = false;
   verbose = true;
   output_topology_image = false;
   clean = false;
   generate_ap_v2_compat = false;


   /* set code directory to pwd */
   const char *pwd = getenv( "PWD" );
   assert( pwd != nullptr );
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

std::string AP_Options_Vars::get_default_string(){
   return("NONE");
}

bool  AP_Options_Vars::is_string_default(const std::string &val ){
   return( val.compare( get_default_string() ) == 0 );
}
