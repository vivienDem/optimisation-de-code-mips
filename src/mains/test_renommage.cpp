#include <iostream>
#include <string>
#include <Program.h>
#include <Basic_block.h>
#include <Function.h>


int main(int argc, char * argv[]){

	if (argc < 2) {
	  cout << "erreur : pas de fichier assembleur" << endl;
	}	  	

	// r�cup�re le nom du fichier dans le chemin entr�e et sans extension
	std::string argv1(argv[1]);	
	
	size_t debut = argv1.find_last_of("/");
	if (debut == std::string::npos)
	  debut = -1;

	size_t fin = argv1.find_last_of(".");
	if (fin == std::string::npos)
	  fin = argv1.size();
	string name = argv1.substr(debut + 1, fin - (debut + 1));

	Program prog(argv[1]);

	// delimitation et construction des fonctions du fichier
	prog.compute_function();
	
	//traitement pour toutes les fonction 
	for(int i=0; i<  prog.nbr_func(); i++){
	   cout<<"========== Function "<<i<<"==========="<<endl;
	   cout<<"============================"<<endl;

	   Function* functmp = prog.get_function(i);
		   
	  // determination des BB puis des liens entre les BB
	  functmp->compute_succ_pred_BB();
	  
	  // production d'un fichier .dot pour le CFG de la fonction
	  
	  string name_f_cfg = "./tmp/" + name + "_cfg_func_" + functmp->get_name() +".dot";
	  Cfg *c = new Cfg(functmp->get_BB(0), functmp->nbr_BB());
	  c->restitution(nullptr, name_f_cfg);
	  delete(c);
  	   
	   // calcul des registres vivants en entr�e et sortie des BB
	   functmp ->compute_live_var();
	   
	   // iteration sur tous les BB du CFG
	   for(int j = 0;  j< functmp->nbr_BB(); j++){
	     
	     Basic_block * bb= functmp -> get_BB(j);
	     cout<<"---------- BB "<<j<<" -----------"<<endl;
	     
	     //affichage du BB
	     bb->display();

	     //calcul des liens de d�pendances entre les instructions du BB
	     bb->compute_pred_succ_dep();

	     // creation du DAG de d�pendance associ� au BB
	     Dfg* d = new Dfg(bb);
	     string name_f_dfg1 = "./tmp/" + name + "_func_" + functmp->get_name() + "_dfg_bb" + std::to_string(bb->get_index()) + ".dot";
	     d->restitute(nullptr, name_f_dfg1, true);
	        
	     /**************** RENOMMAGE DE REGISTRE ****************/ 

	     // liste de registres pour le renommage
	     // avec des registres pass�ees en param�tre 
	     /*
	      
	       list<int> frees;
	       for(int k=32; k<64; k++){
	       frees.push_back(k);
	       }
	     */
	     
	     /* renommage en utilisant des registres n'existant pas */
	      
	       //bb->reg_rename(&frees);
	     
	     /* renommage utilisant les registres disponibles dans le bloc */
	     /*  ne pas faire les 2 */
	     /* il faut recalculer les informations de vivacit� et de def-use 
		pour pouvoir le faire 2 fois de suite !!
	     */

	     bb->reg_rename();
		 
	     cout<<"----- apres renommage ------"<<endl;
	     bb->display();
	     
	     // mise � 0 des d�pendances pour les recalculer 
	     bb->reset_pred_succ_dep();
	     bb->compute_pred_succ_dep();

	     // creation du DAG de d�pendance associ� au BB renomm� 
	     // permet de verifier que le calcul des dependances entre instruction marche bien et de comparer les DAG
	     d = new Dfg(bb);
	     string name_f_dfg = "./tmp/" + name + "_func_" + functmp->get_name() + "_dfg_bb" + std::to_string(bb->get_index()) + "_renamed.dot";
	     d->restitute(nullptr, name_f_dfg, true);
	     
	   
	   }
	  name_f_cfg = "./tmp/" + name + "_cfg_func_" + functmp->get_name() +"_renamed.dot";
	  c = new Cfg(functmp->get_BB(0), functmp->nbr_BB());
	  c->restitution(nullptr, name_f_cfg);
	  delete(c);
 
	}
	string name_file_out = name + "_renamed.s";
	prog.in_file(name_file_out);
	return 0;
}
