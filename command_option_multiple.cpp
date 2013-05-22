/**
 * command_option_multiple.hpp - 
 * @author: Jonathan Beard
 * @version: Tue May 21 15:12:50 2013
 */
#ifndef _COMMAND_OPTION_MULTIPLE_HPP_
#define _COMMAND_OPTION_MULTIPLE_HPP_  1

#include <cassert>
#include <array>
#include "command_option_base.hpp"

template <class T, int N> class OptionMultiple : public OptionBase {
public:

private:
   std::array<T&, N> items;
   std::array< std::
};

#endif /* END _COMMAND_OPTION_MULTIPLE_HPP_ */
