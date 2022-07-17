#include <iostream>
#include <string>
#include <Program.h>
#include <Basic_block.h>
#include <Function.h>


/*  Programme à appeler avec le nom d'un fichier assembleur en argument  */

/* - Découpage en fonctions et affichage du nombre de fonctions
    -Pour chaque fonction,  calcul des boucles de la fonction : 
      1) détermination des blocs de base, des successeurs et prédécesseurs des BB, 
      2) calcul des blocs dominants
      3) calcul des boucles 
      4) affichage des boucles de la fonction

    Construction et restitution en fichier .dot du CFG de la fonction permettant de vérifier si les boucles sont bien déterminées

*/

int main(int argc, char * argv[]){

   if (argc < 2) {
      cout << "erreur : pas de fichier assembleur en entree" << endl;
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
 
  prog.compute_function();  
  cout<<"nombre de fonctions : "<<prog.nbr_func()<<endl;

  
   for (int i=0; i<prog.nbr_func(); i++){    
     // recupération de la ieme fonction du programme
       Function* functmp = prog.get_function(i);

      if(functmp == nullptr){
	cout<<"fonction" << i << "vaut nullptr"<<endl;
	break;
      }

      cout <<"------------Function " << (i+1) <<"/"<<prog.nbr_func();
      cout << " : " << functmp -> get_name() << " ----------\n" <<endl;
      //calcule des boucles
      functmp->compute_loops();

      //affiche les boucles
      functmp->display_loops();
     
      // crée un  CFG pour la fonction
      // permet de le visualiser avec dot ou dotty, cf. plus bas
       Cfg *graph =new Cfg(functmp->get_BB(0),
			  functmp->nbr_BB());
			
   
      // Affichage sur la sortie standard des BB prédécesseurs et successeurs de chaque BB 
      //  graph->display(nullptr);

      // construction d'un fichier .dot pour le cfg de la fonction dans ./tmp/ 
       string name_f_cfg = "./tmp/" + name + "_cfg_func_" + functmp->get_name() +".dot";

      graph->restitution(nullptr,name_f_cfg);
      delete(graph);
   }
  
   return 0;
}
