/**
 * xprep.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 30 12:46:53 2013
 */
#ifndef _AP_PREP_HPP_
#define _AP_PREP_HPP_  1

#include <set>
#include <vector>
#include <string>

#include "ap_data.hpp"

class AP_Prep{
public:

static std::set< std::string >*
get_ap_includes( const std::string main_ap,
                 AP::AP_Data &data );

static std::vector< std::string> *
get_tokens( const std::string &line );

static bool
is_ap_file( std::vector< std::string > &tokens,
            std::string &filename );

};
#endif /* END _AP_PREP_HPP_ */
