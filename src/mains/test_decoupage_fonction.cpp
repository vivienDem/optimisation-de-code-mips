#include <iostream>
#include <OPLabel.h>
#include <Program.h>
#include <OPExpression.h>
#include <OPRegister.h>
#include <OPImmediate.h>
#include <Cfg.h>

/* 
parsing d'un fichier assembleur 
affichage possble du programme (décommenter)
calcul des fonctions, affichage du nombre de fonctions
*/

int main(int argc, char ** argv){
  if (argc < 2){
    cerr << "pas de fichier assembleur en paramètre, pb !" << endl;
    return -1;
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
  
  Program prog(argv[1]) ;
  // Decommenter ci-dessous pour voir le programme complet, mais identique au renommage près des macro-instructions au fichier ASM 
  // prog.display() ;

  prog.compute_function();
  cout << "Fichier " << argv[1]  << ": nb functions = " << prog.nbr_func() << endl;

  for (int i = 0; i < prog.nbr_func() ; i++){
    Function * fct = prog.get_function(i);
    if (fct == nullptr) 
      {
	cout << " ------------ FONCTION "<< i<< "n'existe pas -------------" << endl;	
	continue;
      }
    cout << " ------------ FONCTION "<< i<< " : " << fct -> get_name() << "-------------" << endl;
    fct->display();
  }
    
  string name_file_out = name + "_out.s";
  prog.in_file(name_file_out);

  return 0;
}
