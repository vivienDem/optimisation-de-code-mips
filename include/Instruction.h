#ifndef _Instruction_H
#define _Instruction_H

/**	\file	Instruction.h
	\brief	Instruction class
*/

#include <Operand.h>
#include <string>
#include <OPExpression.h>
#include <OPImmediate.h>
#include <OPLabel.h>
#include <Line.h>
#include <OPRegister.h>
#include <Enum_type.h>
#include <list>
#include <bitset>

using namespace std;

/**	\class	Instruction
	\brief	class representing an instruction which herited by Line
*/

class Instruction;

typedef struct{
   Instruction *inst;
   t_Dep type;
}dep;

class Instruction: public Line{
  static std::map<t_Format,string> form;
  static std::map<t_Inst,string> typ;

private:
   t_Operator _op;
   t_Inst _type;
   Operand *_op1;
   Operand *_op2;
   Operand *_op3;
   int _nbOp;
   int _index;
   std::bitset<NB_REG> Def;
   std::bitset<NB_REG> Use;
   Instruction *_next_inst;
   Instruction *_prev_inst;

   list <dep*> _succ_dep; // liste des dépendances & inst avec les instructions qui suivent dans un bloc
   list <dep*> _pred_dep; // liste des dépendances & inst avec les instructions qui précédent dans un bloc



/**	\brief	Get the first operand value
	accessor of the operand
*/
   Operand* get_op1();

/**	\brief	set the first operand value
	setter of the operand
*/
   void set_op1(Operand * o);

/**	\brief	Get the second operand value
	accessor of the operand
*/
   Operand* get_op2();

/**	\brief	set the second operand value
	setter of the operand
*/
   void set_op2(Operand * o);

/**	\brief	Get the third operand value
	accessor of the operand
*/
   Operand* get_op3();

/**	\brief	set the third operand value
	setter of the operand
*/
   void set_op3(Operand * o);



public:

/** \brief display the instruction 
 */
   void display(void);

  /**	\brief	get the string  of the instruction
    */
   virtual string get_content();


/**	\brief	test if the instruction is a branch or jump instruction
 */
   bool is_branch();

/**	\brief	test if the instruction is a call
 */

   bool is_call();
/**	\brief	test if the instruction is a conditionnal branch
 */

   bool is_cond_branch();


/**	\brief	test if the instruction is a syscall
 */

   bool is_syscall();


/**	\brief	test if the instruction a branch and the target adress is in a register
 */	
   bool is_indirect_branch();


/**	\brief	get the immediate operand of the instruction, if any
    */

   OPImmediate* get_op_imm();

 /**	\brief	get the label operand of the instruction, if any
    */
   OPLabel* get_op_label();


  /**	\brief	get the register destination of the instruction, if any
    */
   OPRegister* get_reg_dst();

   /**	\brief	get the first register source of the instruction
    */
   OPRegister* get_reg_src1();
	
   /**	\brief	get the second register source of the instruction
    */
   OPRegister* get_reg_src2();

 /**	\brief	get the immediate operand of the instruction 
    */
   OPImmediate* get_immediate();




/**	\brief	get the index of instruction
 */
   int get_index();


/**	\brief	get the successor of the Instruction (given by the schedule of instruction in its basic block)
 */
   Instruction* get_next();


/**	\brief	get the predecessor of the Instruction  (given by the schedule of instruction in its basic block)
 */

   Instruction* get_prev();


/**	\brief	return if there is a syntactical dependence RAW between the current instruction and the 1st source operand of i2 if any	
	\return return true if there is a syntactical RAW dependence between the current instruction and the 1st source operand of i2 if any

*/	bool is_dep_RAW1(Instruction *i2);

/**	\brief	return if there is a syntactical dependence RAW between the current instruction and the 2nd source register operand of i2 if any	
	\return return true if there is a RAW dependence between the current instruction and the 2nd source register  operand of i2  if any

*/	bool is_dep_RAW2(Instruction *i2);


/**	\brief	test if there is a syntactical dependence WAR between the 1st source register operande of the current instruction if any and the destination register operand i2 if any	
	\return return true if there is a syntactical WAR dependence between the 1st source register operande of the current instruction if any and the destination register operande i2 if any	 	
*/
	bool is_dep_WAR1(Instruction *i2);

/**   	\brief	test if there is a syntactical dependence WAR between the second source operande of the current instruction if any and the destination register operande i2 if any	
	\return return true if there is a syntactical WAR dependence between the second source operande of the current instruction if any and the destination register operande i2 if any
*/     	bool is_dep_WAR2(Instruction *i2);


/**	\brief	get the information if there is a syntactical dependence WAW between the current instruction and i2	
	\return return true if there is a syntactical WAW dependence
*/
   bool is_dep_WAW(Instruction *i2);

/**	\brief	test if there is a syntactical dependence MEMDEP between the current instruction and i2	
	\return return true 1) if the address registers are different or 2) if address registers are equal and if the difference between the immediate offsets is less than 4. 
*/
   bool is_dep_MEM(Instruction *i2);


/**	\brief	conservatively test if there is a potential MEMDEP dependence between the current instruction and i2
	\return return true if the current instruction and i2 are two memory accesses different from two reads when accesses are not related to the stack pointer. In case of memory accesses, different from two reads, relative to the stack pointer, the returned value depends on the immediate offsets. 
*/
   bool is_strict_dep_MEM(Instruction *i2);




/**     \brief set the parameter as successor and this as predecessor of the parameter
 */
   void set_link_succ_pred(Instruction*);



/**	\brief	add a dependence with a predecessor instruction to the dependence type list
 */
   void add_pred_dep(dep*);

/**	\brief	get the dependence type with the ith predecessor instruction of the current instruction
 */
   dep* get_pred_dep(int i);

/**	\brief	add a dependence with a successor  to list of the dependence type of successors
 */
   void add_succ_dep(dep*);

/**	\brief	get the ieme dependence type with successors from successor dependence type list  of the current instruction
 */
   dep* get_succ_dep(int i);


/**	\brief	get the number of successor (dependence) of the Instruction 
 */
   int get_nb_succ();

/**	\brief	get the number of predecessor (dependence) of the Instruction
 */
   int get_nb_pred();

 

   /** \brief print the dependence of this with instructions denoted by their index and the dependence type */
   void print_succ_dep();



/** \brief reset succ and pred dependences of this */
   void reset_pred_succ_dep();
   
   list<dep*>::iterator succ_begin();
   list<dep*>::iterator succ_end();

  list<dep*>::iterator  pred_begin();
  list<dep*>::iterator pred_end();


 

/**	\brief	test if the instruction a branch and the target adress is in a register
 */	

   bool is_nop();


/**	\brief	test if the instruction is a memory access 
 */
   
   bool is_mem();
/**	\brief	test if the instruction is a memory access that reads a value
 */
   bool is_mem_load();

/**	\brief	test if the instruction is a memory access that writes a value
 */
   bool is_mem_store();



/**	\brief	get the  Opcode 
*/

   t_Operator get_opcode();

/**	\brief	get the string Opcode value
	accessor of the string opcode
*/
   string string_opcode();


/**	\brief	set the opcode value
	setter of the opcode
*/
   void set_opcode(t_Operator newop);

/**	\brief	get the format of the Instruction
	accessor of the format (see Enum_type.h)
*/


   t_Format get_format();

/**	\brief	get the Type of the Instruction
	accessor of the Type  (see Enum_type.h)
*/
   virtual t_Inst  get_type();


 /** \brief return the latency of the instruction */

   int get_latency();



   /**	\brief	get the type of the line
    */
   virtual t_Line type_line();

   /**	\brief	get the name string instruction
    */
   virtual string to_string();

   /**	\brief	set the string of the instruction
    */
   virtual void set_content(string);




/**	\brief	set the string format
 */
   string string_form();

/**	\brief	set the string Type of instruction
 */
   string string_type();


/**	\brief	set the index of instruction
 */
   void set_index(int);



/**	\brief	setter of the predecessor of the Instruction
 */
   void set_prev(Instruction *);



/**	\brief	set the successor of the Instruction
 */ 
   void set_next(Instruction*);

/**	\brief	get the most important dependence between the current instruction and i2
	\return return "RAW", "WAR", "WAW", "MEMDEP" or "not dependent" in format enum
*/


   t_Dep is_dependent(Instruction *i2);



/**	\brief	test if there is a syntactical dependence RAW between the current instruction and i2 (not that is_dep_RAW1 and is_dep_RAW2 are more precise if needed)	
	\return return true if there is a RAW dependence
*/
   bool is_dep_RAW(Instruction *i2);



/**	\brief	test if there is a syntactical dependence WAR between the current instruction and i2 (not that is_dep_WAR1 and is_dep_WAR2 are more precise if needed)
	\return return true if there is a syntactical WAR dependence
*/
   bool is_dep_WAR(Instruction *i2);



/**	\brief	get the number of operand	
	\return return the number of operand
*/
   int get_nbOp();


/**	\brief	set the number of operand*/
   void set_number_oper(int);



	
/**	\brief	Constructor of the class instruction
 */
   Instruction(string, t_Operator, t_Inst, Operand *, Operand *, Operand *);

/**	\brief	Constructor with 3 Operands of the class instruction */
   Instruction(t_Operator, Operand *, Operand *, Operand *);
/**	\brief	Constructor with 2 Operands of the class instruction */
   Instruction(t_Operator, Operand *, Operand *);
/**	\brief	Constructor with 1 Operand of the class instruction */
   Instruction(t_Operator, Operand *);
/**	\brief	Constructor without Operands of the class instruction */
   Instruction(t_Operator);

/**	\brief	Destructor of the class instruction
 */
   virtual ~Instruction();



};



/**	\brief	returns the instruction associated to the line, if the line is an instruction, nullptr otherwise
*/
Instruction* getInst(Line* l);

/** \brief retourne le délai induit par une dépendance RAW entre i1 et i2 (i1 -> i2) avec i1 de type t1 et i2 de type t2

 */
int delai(t_Inst t1, t_Inst t2);


#endif
