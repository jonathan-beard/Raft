/**
 * symtab.hpp - 
 * @author: Jonathan Beard
 * @version: Wed May  7 15:47:56 2014
 * 
 * Copyright 2014 Jonathan Beard
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef _SYMTAB_HPP_
#define _SYMTAB_HPP_  1
#include <string>

namespace Raft {
class SymTab {
public:
   SymTab();
   virtual ~SymTab();

   void  addScope( const std::string scope );
   void  addAnonymousScope();
   void  addSymbol( const std::string symbol );

   void  leaveScope();

};
}
#endif /* END _SYMTAB_HPP_ */
