/**
 * ap_set_options.cpp - 
 * @author: Jonathan Beard
 * @version: Thu May 16 09:13:02 2013
 */
#include <cassert>
#include <array>

#include "ap_set_options.hpp"
#include "ap_data.hpp"
#include "command_arguments.h"
#include "ap_options_vars.hpp"
#include "ap_common.hpp"
#include "command_option_single.tcc"
#include "command_option_multiple.tcc"

void
AP_Set_Options::SetOptions( CmdArgs &cmd, AP::AP_Data &data )
{
   AP_Options_Vars &options( data.get_options_vars() );
   cmd.addOption( new Option< bool >( options.help,
                     "-h",
                     "Print this message",
                     [](const char *x, bool &v){ 
                        v = true;
                        return( true ); 
                     },
                     true ) );
   cmd.addOption( new Option< bool >( options.verbose,
                     "-v",
                     "Verbose execution mode" ) );

   cmd.addOption( new Option< bool >( options.dry_run,
                     "-dry_run",
                     "Dry run, automatically triggers verbose" ) );
   cmd.addOption( new Option< bool >( options.output_topology_image,
                     "-img_topo",
                     "Output image of AP app topology via GraphViz") );
   cmd.addOption( new Option< bool >( options.clean,
                "-clean",
                "Clean all generated code, sort of like 'make clean'") );
   cmd.addOption( new Option< bool >( options.generate_ap_v2_compat,
                  "-gen_v2",
       std::string("Generate AutoPipe version 2.0 compatible x files ") +
       std::string("and executable code, automatically means generate ") +
       std::string("a run package") ) );

   cmd.addOption( new Option< std::string >( 
                     options.send_code_to_directory,
                     "-dir_for_code",
                     "Send code to this directory instead of PWD" ) );

   cmd.addOption( new Option< int64_t >( options.optimization_level,
                     "-O",
                     "Optimization level, valid options are 0,1,2,3" ) );

   cmd.addOption( new Option< bool >(options.use_genetic_algorithm,
                     "-genetic_algorithm",
                     "Use genetic algorithm to optimize application" ));
   cmd.addOption( new Option< bool >(options.use_simulated_annealing,
                     "-simulated_annealing",
                     "Use simulated annealing to optimize application" ));
   cmd.addOption( new Option< bool >(options.enter_graph_modeler_mode,
                     "-use_graph_modeler",
       std::string("Enter interactive GraphModeler mode( must have ") +
       std::string("GraphModeler exe compiled and in your path )") ));

   cmd.addOption( new Option< std::string >(
                     options.unmapped_image_suffix,
                     "-img_unmapped_suffix",
                     "Suffix selection for unmapped topology images" ) );
   cmd.addOption( new Option< std::string >(
                     options.mapped_image_suffix,
                     "-img_mapped_suffix",
                     "Suffix selection for mapped topology images" ) );
   cmd.addOption( new Option< std::string >(
                     options.dir_for_images,
                     "-img_dir",
                     "Directory for topology images" ) );
   cmd.addOption( new Option< bool >( 
                     options.hardware_map_image,
                     "-img_hardware_topo",
                     "Output image for AP hardware mapped topology" ));
   cmd.addOption( new Option< std::string >(
                     options.map_objective,
                     "-mapping_objectibe",
                     "Objective for optimizations" ) );
   cmd.addOption( new Option< std::string >(
                     options.hardware_defs_file,
                     "-hardware_definitions",
      std::string("Specifications and known information about ") +
      std::string("the hardware you want to map the application to") ));
   cmd.addOption( new Option< std::string >(
                     options.comm_hardware_defs_file,
                     "-comm_definitions",
      std::string("Specifications and known information about ") +
      std::string("the communications hardware you want to map the") +
      std::string(" application to")) );
   cmd.addOption( new Option< std::string >(
                     options.hardware_configuration_rules,
                     "-hardware_config_rules",
      std::string("Rules to map the hardware resources together ") +
      std::string("in a sane way") ) );

   cmd.addOption( new Option< int64_t >(
                     options.max_buffer_size,
                     "-max_buffer_size",
      std::string("Set global maximum allowable buffer size ") +
      std::string("(in bytes)") ) );

   cmd.addOption( new Option< bool >(
                     options.generate_run_package,
                     "-generate_run_pkg",
      std::string("Generate a run package suitable for deployment ") +
      std::string("on multiple targets")) );

   cmd.addOption( new Option< bool >(
                     options.dump_cpp_output,
                     "-dump_cpp_output",
                     "Dump output from cpp" ) );
   cmd.addOption( new Option< bool >(
                     options.dump_include_file_list,
                     "-dump_include_file_list",
                     "Dump include file list to cpp" ) );
   cmd.addOption( new Option< bool >(
                     options.dump_parse_stream,
                     "-dump_parse_stream",
                     "Dump parse stream" ) );

   cmd.addOption( new OptionMultiple<std::string,3>(
                     {{ &options.input_full_path,
                        &options.input_filename,
                        &options.input_dir_path}},
                     "-f",
                     "Specify Autopipe input filename",
                       {{[&](const char *x, bool &v) /* full pathname */
                         {
                           v = true;
                           return( std::string( x ) );
                         },
                         [&](const char *x, bool &v) /* filename */
                         {
                           std::string out(
                              AP::AP_Common::GetFileNameFromPath( x, v ) );
                           return( out ); 
                         },
                         [&](const char *x, bool &v) /* dir path */
                         {
                           std::string out(
                           AP::AP_Common::ExtractPathNoFileName( x, v ) );
                           return( out ); 
                         } }}
                        ) );
}
