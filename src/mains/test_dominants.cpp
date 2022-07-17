#include <iostream>
#include <string>
#include <Program.h>
#include <Basic_block.h>
#include <Function.h>


/*  Programme � appeler avec le nom d'un fichier assembleur en argument  */

/* - D�coupage en fonctions et affichage du nombre de fonction
    -Pour chaque fonction, calcul des blocs dominants (apr�s d�termination des blocs de base, des successeurs et pr�d�cesseurs des BB n�cessaires pour le calcul). 
    Construction et restitution en fichier .dot du CFG de la fonction permettant de v�rifier si les dominants sont ok

*/

int main(int argc, char * argv[]){

   if (argc < 2) {
      cout << "erreur : pas de fichier assembleur en entree" << endl;
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
   
   prog.compute_function();
   cout<<"nombre de fonctions : "<<prog.nbr_func()<<endl;
   
   for (int i=0; i<prog.nbr_func(); i++){    
     // recup�ration de la ieme fonction du programme
       Function* functmp = prog.get_function(i);

      if(functmp == nullptr){
	cout<<"fonction" << i << " est nullptr"<<endl;
	break;
      }
     
      //calcule des dominants (et autres calculs n�cessaires pour le faire)
      functmp->compute_dom();

      // cr�e un CFG pour la fonction
      // permet de le visualiser avec dot ou dotty, cf. plus bas
       Cfg *graph =new Cfg(functmp->get_BB(0),
			  functmp->nbr_BB());
	
		
      cout<<"------------Function "<< (i+1) <<"/"<<prog.nbr_func()<<" DISPLAY----------\n" <<endl;
    
      // pour afficher le CFG mais l'affichage ci-dessus donne les infos aussi
      // graph->display(nullptr);

      // construit un fichier .dot pour le cfg numero i dans ./tmp/
  
      string name_f_cfg = "./tmp/" + name + "_cfg_func_" + functmp->get_name() +".dot";

      graph->restitution(nullptr,name_f_cfg);
      delete(graph);
   }
  
   return 0;
}
