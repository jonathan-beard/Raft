/**
 * ap_set_options.cpp - 
 * @author: Jonathan Beard
 * @version: Thu May 16 09:13:02 2013
 */
#include <cassert>

#include "ap_set_options.hpp"
#include "ap_data.hpp"
#include "command_arguments.h"
#include "ap_options_vars.hpp"

void
AP_Set_Options::SetOptions( CmdArgs &cmd, AP::AP_Data &data )
{
   AP_Options_Vars &options( data.get_options_vars() );
   cmd.addOption( new Option< bool >( options.help,
                     "-h",
                     "Print this message",
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
                  "Generate AutoPipe version 2.0 compatible x files " +
                  "and executable code, automatically means generate " +
                  "a run package" ) );

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
                     "Enter interactive GraphModeler mode( must have "+
                     "GraphModeler exe compiled and in your path )"));
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
                     "Output image fo AP hardware mapped topology" ));
   cmd.addOption( new Option< std::string >(
                     options.map_objective,
                     "-mapping_objectibe",
                     "Objective for optimizations" ) );
   cmd.addOption( new Option< std::string >(
                     options.hardware_defs_file,
                     "-hardware_definitions",
                     "Specifications and known information about "+
                     "the hardware you want to map the application to"));
   cmd.addOption( new Option< std::string >(
                     options.comm_hardware_defs_file,
                     "-comm_definitions",
                     "Specifications and known information about "+
                     "the communications hardware you want to map the"+
                     " application to" ) );
   cmd.addOption( new Options< std::string >(
                     options.hardware_configuration_rules,
                     "-hardware_config_rules",
                     "Rules to map the hardware resources together "+
                     "in a sane way" ) );

   cmd.addOption( new Options< int64_t >(
                     options.max_buffer_size,
                     "-max_buffer_size",
                     "Set global maximum allowable buffer size "+
                     "(in bytes)" ) );

   cmd.addOption( new Options< bool >(
                     options.generate_run_package,
                     "-generate_run_pkg"
                     "Generate a run package suitable for deployment "+
                     "on multiple targets") );

   cmd.addOption( new Options< bool >(
                     options.dump_cpp_output,
                     "-dump_cpp_output"
                     "Dump output from cpp" ) );
   cmd.addOption( new Options< bool >(
                     options.dump_include_file_list,
                     "-dump_include_file_list"
                     "Dump include file list to cpp" ) );
   cmd.addOption( new Options< bool >(
                     options.dump_parse_stream,
                     "-dump_parse_stream",
                     "Dump parse stream" ) );
}
