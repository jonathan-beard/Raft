/**
 * AP_Options_Vars.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Dec 14 13:41:06 2012
 */
#ifndef _APOPTIONSVARS_HPP_
#define _APOPTIONSVARS_HPP_  1

#include <cstdint>
#include <string>

struct AP_Options_Vars{
   /**
    * AP_Options_Vars - calls load_defaults by default
    */
   AP_Options_Vars();
   virtual ~AP_Options_Vars();
   /**
    * load_defaults - sets all the struct data members to
    * their default values, defined in src file
    */
   void load_defaults();

   /**
    * get_default_string - simply returns the default string,
    * at the moment it is set to "NONE".  This method only 
    * included as a convenience so the same string doesn't have
    * to be retyped multiple types
    * @return  std::string
    */
   std::string get_default_string();

   /**
    * number of spaces or actual tabs to use for TAB
    */
   std::string tab;

   /**
    * is_strign_default - returns true if the given string
    * is equal to the value returned by get_default_string
    * @param   val - std::string
    * @return  bool
    */
   bool          is_string_default(const std::string &val);

   /* misc */
   bool          help;
   bool          verbose;
   bool          dry_run;
   bool          output_topology_image;
   bool          clean;
   bool          generate_ap_v2_compat;
   
   /* by default pwd of exe */
   std::string   send_code_to_directory;

   /* optimization level */
   int64_t       optimization_level;
   bool          use_genetic_algorithm;
   bool          use_simulated_annealing;
   
   bool          enter_graph_modeler_mode;

   /* image options */
   std::string    unmapped_image_suffix;
   std::string    mapped_image_suffix;
   std::string    dir_for_images;
   bool            hardware_map_image;

   /* specs for mapping */
   std::string     map_objective; // objectives for performance
   std::string     hardware_defs_file;
   std::string     comm_hardware_defs_file;
   std::string     hardware_configuration_rules;
   /* set max allowable buffer size */
   int64_t         max_buffer_size;

   /* generate deployment package for multiple targets */
   bool           generate_run_package; 

   /* dump options */
   bool           dump_cpp_output;
   bool           dump_include_file_list;
   bool           dump_parse_stream;

   /* input file */
   std::string    input_full_path;
   std::string    input_filename;
   std::string    input_dir_path;
};

#endif /* END _APOPTIONSVARS_HPP_ */
