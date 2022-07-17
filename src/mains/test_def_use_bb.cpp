#include <iostream>
#include <string>
#include <Program.h>
#include <Basic_block.h>
#include <Function.h>


int main(int argc, char * argv[]){

  if (argc < 2) {
    cout << "erreur : pas de fichier assembleur" << endl;
  }	  	
  
  // récupère le nom du fichier dans le chemin entrée et sans extension
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

    if (functmp == nullptr) {
      cout << "Function " << i << " does not exist" << endl;
      continue;
    }
 
    cout<<"========== Function "<<i<<" : " << functmp->get_name()  << " ==========="<<endl;
  
   // delimitation des BB de la fonction
    functmp->compute_basic_block();
    
    // determination des liens entre les BB
    functmp->compute_succ_pred_BB();
      
    // production d'un fichier .dot pour le CFG de la fonction 
    string name_f_cfg = "./tmp/" + name + "_cfg_func_" + functmp ->get_name() +".dot";
    Cfg *c = new Cfg(functmp->get_BB(0), functmp->nbr_BB());
    c->restitution(nullptr, name_f_cfg);
    
    
    
    // iteration sur tous les BB du CFG
    for(int j = 0;  j< functmp->nbr_BB(); j++){
      
      Basic_block * bb = functmp -> get_BB(j);
      cout<<"---------- BB "<<j<<" -----------"<<endl;
      
      //affichage du BB
      bb->display();
      
      //calcul des liens de dépendances entre les instructions du BB
      bb->compute_pred_succ_dep();
      
      bb->compute_use_def();
      bb->show_use_def();
      
    }
  }
	return 0;
}
