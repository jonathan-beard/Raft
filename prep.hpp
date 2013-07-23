/**
 * prep.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 30 12:46:53 2013
 */
#ifndef _PREP_HPP_
#define _PREP_HPP_  1

#include <set>
#include <vector>
#include <string>

#include "data.hpp"

class Prep{
public:

static std::set< std::string >*
get_rf_includes( const std::string main_ap,
                 Raft::Data &data );

static std::vector< std::string> *
get_tokens( const std::string &line );

static bool
is_rf_file( std::vector< std::string > &tokens,
            std::string &filename );

};
#endif /* END _PREP_HPP_ */
