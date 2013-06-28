/**
 * Declaration.hpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 08:59:18 2013
 */
#ifndef _DECLARATION_HPP_
#define _DECLARATION_HPP_  1


#include <string>
#include <ostream>
#include "NodeAbstract.hpp"



namespace Node{

class Type;
class Initializer;
class TypeModifier;

class Declaration : public NodeAbstract {
public:
   Declaration( Type *t, std::string *name, Initializer *init );
   virtual ~Declaration();
   /* override default print method */
   virtual std::ostream& print( std::ostream &stream );

   /* getter / setter methods */
   virtual Type&           get_decl_type();
   virtual std::string     get_decl_name();
   virtual Initializer&    get_decl_initializer();
   virtual TypeModifier&   get_modifier();

   virtual void set_modifier( TypeModifier *m );
protected:
   Type        *decl_type;
   std::string decl_name;
   Initializer *init;
   TypeModifier *modifier;
};

} /* end namespace Node */

#endif /* END _DECLARATION_HPP_ */
