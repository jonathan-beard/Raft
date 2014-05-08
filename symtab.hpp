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

   /**
    * addType - since the language allows for multiple declarations 
    * with a single type declaration, the type is added first then
    * multiple symbols can be added for the type.  The type is stored 
    * internally.
    * @param   type  - const std::string
    */
   void  addType(  const std::string type  );
   /**
    * addScope - increments the scope with the given name.  The name
    * is used in the hashing function for the symbol.
    * @param   scope - const std::string
    */
   void  addScope( const std::string scope );
   /**
    * addAnonymousScope - increments an anonymous scope, i.e., a block
    * with curly braces that is used to identify a scoped section that
    * simply has no name.  This scope is assigned a random string of
    * characters to identify it.
    */
   void  addAnonymousScope();
   /**
    * addSymbol - adds the symbol within the currently active scope and
    * with the associated current type.
    * @param   symbol - const std::string
    */
   void  addSymbol( const std::string symbol );
   /**
    * leaveScope - decrements the current scope.
    */
   void  leaveScope();
   /**
    * getTypeForSymbol - gets the type for the symbol currently
    * defined in this scope.
    * @param   symbol - const std::string
    * @param   type   - std::string&, symbol is stored here if function
    *                   returns true
    * @return  bool   - true if symbol exists, false if not
    */
    bool getTypeForSymbol( const std::string symbol );

};
}
#endif /* END _SYMTAB_HPP_ */
