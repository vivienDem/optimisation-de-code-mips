#include <iostream>
#include <string>
#include <Program.h>
#include <Basic_block.h>
#include <Function.h>


int main(int argc, char * argv[]){
	int nb_total_cycles = 0;
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

	  Function* functmp= prog.get_function(i);
	 
	  // determination des BB puis des liens entre les BB
	  functmp->compute_succ_pred_BB();
	  
	  // production d'un fichier .dot pour le CFG de la fonction
	  
	  string name_f_cfg = "./tmp/" + name + "_cfg_func_" + std::to_string(i) +".dot";
	  Cfg *c = new Cfg(functmp->get_BB(0), functmp->nbr_BB());
	  c->restitution(nullptr, name_f_cfg);
	 
  
	  cout<<"======== Function "<< i << " : " << functmp->get_name() << "========="<<endl;
	   
	   
	   // iteration sur tous les BB du CFG
	   for(int j = 0;  j< functmp->nbr_BB(); j++){
	     
	     Basic_block * bb= functmp -> get_BB(j);
	     cout<<"---------- BB "<<j<<" -----------"<<endl;
	     
	     //affichage du BB
	     bb->display();
	   
	     //calcul des liens de d�pendances entre les instructions du BB
	     bb->compute_pred_succ_dep();
	     // montre les d�pendances entre les instructions du BB
	     bb->show_succ_dep();

	     /**************** CALCUL NB CYCLES *********************/
	     //affichage du nb de cycle pour l'execution du BB
	     int nbcycles_base = bb->nb_cycles();
	     cout<<"---nb_cycles : "<< nbcycles_base <<" -----------"<<endl;
		 nb_total_cycles += nbcycles_base;
	     
	     // creation du DAG de d�pendance associ� au BB
	     Dfg* d = new Dfg(bb);
	     string name_f_dfg1 = "./tmp/" + name + "_func_" + functmp->get_name() + "_dfg_bb" + std::to_string(bb->get_index()) + ".dot";
	     d->restitute(nullptr, name_f_dfg1, true);
	     
	   }
	}

	cout << "NB TOTAL : " << nb_total_cycles << endl;
	
}
