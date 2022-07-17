#include <Function.h>

Function::Function(){
  _head = nullptr;
  _end = nullptr;
  BB_computed = false;
  label_computed = false;
  BB_pred_succ = false;
  dom_computed = false;
  loop_computed = false;
  
}

Function::~Function(){}

void Function::set_head(Line *head){
  _head = head;
}

void Function::set_end(Line *end){
  _end = end;
}

Line* Function::get_head(){
  return _head;
}

Basic_block* Function::get_firstBB(){
   return _myBB.front();
}

Line* Function::get_end(){
  return _end;
}

void Function::display(){
  cout<<"Begin Function"<<endl;
  Line* element = _head;

  while(element != _end){
    cout << element->get_content() <<endl;		
    element = element->get_next();
  }

  if (element == _end)	
    cout << _head->get_content() <<endl;

  cout<<"End Function\n\n"<<endl;
	
}

int Function::size(){
  Line* element = _head;
  int lenght=0;
  while(element != _end)
    {
      lenght++;		
      if (element->get_next()==_end)
	break;
      else
	element = element->get_next();
    }
  return lenght;
}	


void Function::restitution(string const filename){
	
  Line* element = _head;
  ofstream monflux(filename.c_str(), ios::app);

  if(monflux){
    monflux<<"Begin"<<endl;
    if(element == _end)	
      monflux << _head->get_content() <<endl;
    while(element != _end)
      {
	if(element->isInst() || 
	   element->isDirective()) 
	  monflux<<"\t";
	
	monflux << element->get_content() ;
	
	if(element->get_content().compare("nop")) 
	  monflux<<endl;
		
	if(element->get_next()==_end){
	  if(element->get_next()->isInst() || 
	     element->get_next()->isDirective())
	    monflux<<"\t";
	  monflux << element->get_next()->get_content()<<endl;
	  break;
	}
	else element = element->get_next();

      }
    monflux<<"End\n\n"<<endl;
		
  }

  else {
    cout<<"Error cannot open the file"<<endl;
  }

  monflux.close();
}

void Function::compute_label(){
  if (label_computed) return; // on ne le fait qu'une fois
  Line* element = _head;

  if(element == _end && element->isLabel())	
    _list_lab.push_back( getLabel(element) );
  while(element != _end)
    {
      if(element->isLabel())	
	_list_lab.push_back( getLabel(element)) ;

      if (element->get_next() == _end){
	if (element->isLabel())	
	  _list_lab.push_back( getLabel(element) );
	break;
      }
      else element = element->get_next();

    }
  label_computed = true;
}

int Function::nbr_label(){
  return _list_lab.size();

}

string Function::get_name(){
 if (!label_computed) compute_label();
 Label * l = get_label(0);
 if (l != nullptr)
   return l-> to_string();
 else 
   return "name not found";
}

Label* Function::get_label(int index){
  int size=(int) _list_lab.size();
  if(index < size){
    int i = index; 
    for (auto label_fct: _list_lab) {
      if (i == 0)
	return label_fct;
      else
	i--;
    }
  }
  else cout<<"Error get_label : index is bigger than the size of the list, returns the last one (if any)"<<endl; 	
  return nullptr;
}

Basic_block *Function::find_label_BB(OPLabel* label){
  if (!label_computed) compute_label();
  for(auto bb : _myBB) {		
    if(bb ->is_labeled()){	 
      string str= bb ->get_head()->get_content();
      if (!str.compare(0, (str.size()-1),label->get_op())){
	return bb;
       }
    }
  }
  cout << "find_label_BB can't find a BB starting with " << label->to_string() << endl;
  return nullptr;
}


/* add_BB(debut, fin, br, index) cr�e un nouveau BB et 
 l'ajoute � la liste de BB de la fonction en le creant */
/* "debut" est l'entete, "fin" la derniere ligne du BB, "br" est une ligne contenant un saut ou vaut nullptr si le BB ne finit pas par un saut , "index" est le num�ro du BB */ 

void Function::add_BB(Line *debut, Line* fin, Line *br, int index){
   Basic_block *b = new Basic_block();
   b->set_head(debut);
   b->set_end(fin);
   b->set_index(index);
   b->set_branch(br);
   _myBB.push_back(b);
}


// Calcule la liste des blocs de base : il faut d�limiter les BB, en parcourant la liste des lignes (qui contiennent des directives, des labels ou des instructions) � partir de la premiere de la fonction, il faut s'arreter � chaque branchement (et prendre en compte le delayed slot qui appartient au meme BB, c'est l'instruction qui suit tout branchement) ou � chaque label (on estime que tout label est utilis� par un saut et donc correspond bien � une ent�te de BB).

// Pour cr�er un bloc il est conseiller d'utiliser la fonction addBB ci-dessus qui cr�e un BB et l'ajoute � la liste des BB de la fonction 
void Function::compute_basic_block(){
  
  bool verbose = false;  // passer � false pour moins d'affichage 
  if (verbose){
    cout << "comput BB" <<endl;
    cout<<" head:"<< _head->get_content()<<endl;
    cout<<" tail:"<< _end->get_content()<<endl;
  }
  if (BB_computed) return; // NE PAS TOUCHER, �vite de recalculer si d�j� fait

 
  Line *debut = nullptr; // debut contient nullptr ou une ent�te
  Line *current = _head; // current contient la ligne en cours de traitement,
  int bb_num = 0; // numerotation des BB dans l'ordre 
 
  while(current != _end->get_next()){ // il faut traiter la derniere ligne donc il faut s'arr�ter � la suivante!

     if (current -> isLabel()) { // Si label, fin de bloc
          if (debut != nullptr) add_BB(debut, current->get_prev(), nullptr, bb_num++);
          debut = current;
     }
     
     if (current -> isInst()) {
         if (debut == nullptr) {
           debut = current;
         }
         if (getInst(current)->get_type() == t_Inst::BR) {
           add_BB(debut, current->get_next(), current, bb_num++);
           current = current -> get_next();
           debut = nullptr;
         }
     }
     current = current ->get_next();

  }
  
  if (verbose)
    cout<<"end comput Basic Block"<<endl;
  
  
  // calcul effectu�, ne pas toucher ci-dessous
  BB_computed = true;
  return;
}

int Function::nbr_BB(){
   return _myBB.size();
}



Basic_block *Function::get_BB(int index){
   int size=(int)_myBB.size();
 
   if (index < size){
     int i = index;
     for (auto bb: _myBB){
       if (i == 0)
	 return bb;
       else i--;
     }
   }
   return nullptr;
}


/* compute_pred_succ calcule les successeurs (et pr�d�cesseur) des BB */
/* et it�rer sur tous les BB d'une fonction */
/* il faut determiner si un BB a un ou deux successeurs : d�pend de la pr�sence d'un saut pr�sent ou non � la fin */
/* pas de saut ou saut incontionnel ou appel de fonction : 1 successeur (lequel ?)*/
/* branchement conditionnel : 2 successeurs */ 
/* le bloc de sortie de fonction  n'a pas de successeurs - celui qui se termine par jr R31 */
/* les sauts indirects n'ont pas de successeur */
/* lorsque l'on a un successeur on l'ajoute au BB, et on ajoute BB comme pr�decesseur du successeur */

void Function::compute_succ_pred_BB(){
  
  if (BB_pred_succ) return; // on ne le fait qu'une fois 
  
  if (!BB_computed) 
    compute_basic_block();
  if (!label_computed) 
    compute_label();
 
 
  int size= (int) _myBB.size();
   
  for (auto bb: _myBB){ // parcours tous les BB de _myBB
    Instruction *instr;
    Basic_block *succ=nullptr;

    if (bb->get_end()->get_prev() -> isInst()) { // si l'avant derniere ligne est une instruction
      instr = getInst(bb->get_end()->get_prev());
      switch (instr->get_opcode()) {
        case t_Operator::b:
        case t_Operator::j:
          succ = find_label_BB(instr->get_op_label());
          bb->set_link_succ_pred(succ); // bloc ciblé par l'instruction
          break;
        case t_Operator::beq:
        case t_Operator::beqz:
        case t_Operator::bgez:
        case t_Operator::bgezal:
        case t_Operator::bgtz:
        case t_Operator::blez:
        case t_Operator::bltz:
        case t_Operator::bltzal:
        case t_Operator::bne:
        case t_Operator::bnez:
          bb->set_link_succ_pred(get_BB(bb->get_index() + 1)); // bloc suivant
          succ = find_label_BB(instr->get_op_label());
          bb->set_link_succ_pred(succ); // bloc ciblé par l'instruction
          break;
        case t_Operator::jr:
        case t_Operator::jalr:
          break;
        default:
          bb->set_link_succ_pred(get_BB(bb->get_index() + 1)); // bloc suivant
      }
    }
    else {
      bb->set_link_succ_pred(get_BB(bb->get_index() + 1));
    }

  }
    
  // ne pas toucher ci-dessous
  BB_pred_succ = true; // calcul effectu�
  return;
}

void Function::compute_dom(){
  if (dom_computed) return; // on ne le fait qu'une fois

  if (!BB_pred_succ)
    compute_succ_pred_BB();   // on a besoin d'avoir calcul� les blocs pr�d�cesseurs et successeurs avant de calculer les dominants
 
   // on peut r�cup�rer les BB de la fonction avec la m�thode get_BB(num du BB) pour tous les num�ros de BB entre 0 et nbBB-1.

  list<Basic_block*> workinglist; // liste de travail  
  bool change = true;  // pour it�rer tant que pas de point fixe
  Basic_block* n = nullptr;
  bitset<NB_MAX_BB> T;
  bitset<NB_MAX_BB> tmp;
  int nb_pred, nb_succ;

  /* A REMPLIR */
  Basic_block* r = get_BB(0);
  workinglist.push_back(r);
  do {
    change = false;
    n = workinglist.front();
    workinglist.pop_front();
    if (n != r) {
      T.set(); 
    }
    else {
      T.reset();
    }

    nb_pred = n->get_nb_pred();
    for (int index = 0; index < nb_pred; index++) {
      T = T & n->get_predecessor(index)->Domin;    
    }
    T.set(n->get_index());

    if (T != n->Domin) {
      n->Domin = T;
      change = true;
    }
    nb_succ = n->get_nb_succ();
    if (change) {
      for (int index = 0; index < nb_succ; index++) {
        workinglist.push_back(n->get_successor(index));
      }
    }
  }
  while (!workinglist.empty());



  // affichage du resultat
  
  for (auto bb : _myBB){ // parcours des bb dans la liste des BB    
    cout << "Dominants pour BB" << bb -> get_index() << " : "; 
    for (int i = 0; i< nbr_BB(); i++){ // affichage des bloc dominants parmi les nbr_BB() bb de la fonction
      if (bb->Domin[i]) cout << " BB" << i  ;
    }
    cout << endl;
  }
  dom_computed = true;
  return;
}

void Function::compute_loops(){
  if (loop_computed) return;
  if (!BB_computed) 
    compute_basic_block();
  if (!BB_pred_succ) 
    compute_succ_pred_BB();
  if (!dom_computed)
    compute_dom();

  unsigned int index = 0;
  for (auto bb: _myBB){
    for (int i = 0; i < bb->get_nb_succ(); i++) {
      if (bb->Domin[bb->get_successor(i)->get_index()]) {// arc arri�re
	Loop * loop = new Loop(bb->get_successor(i), bb, index++);
	loop -> compute_in_loop_BB();
	_myLoop.push_back(loop);
      }
    }
  }
  loop_computed = true;
}

void Function::display_loops(){
  cout << "Displaying the " << _myLoop.size() << " loops of the function" << endl;
  for(auto loop: _myLoop){
    loop->display();
  }
}

void Function::compute_live_var(){
    if (!BB_computed) 
    compute_basic_block();
  if (!BB_pred_succ) 
    compute_succ_pred_BB();

  list<Basic_block*> workinglist;

  /* A REMPLIR avec algo vu en cours et en TD : algorithme it�ratif qui part des blocs sans successeur */

  /* Lorsque l'on sort d'une fonction (BB sans successeur et se terminant par jr $31) le registre $2 contient le r�sultat, il est donc vivant en sortie du bloc ; le registre pointeur de pile ($29) est aussi vivant */

  /* Lorsqu'un bloc se termine par un appel de fonction, les registres $4, $5, $6, $7 sont vivants en sortie du bloc, car ils contiennent potentiellement les param�tres */
  /* Lorsqu'un bloc se termine par un appel syst�me (syscall), les registres $4, $5, $6, $7 et $2 sont vivants en sortie du bloc, car ils contiennent potentiellement les param�tres + le num�ro de l'appel syst�me */
  /* il faut donc initialiser correctement les LiveOut pour ces blocs avant de faire le calcul des registres vivants */

  for (auto bb : _myBB) {
    bb->compute_use_def();
    if (bb->get_nb_succ() == 0) {
      bb->LiveOut.set(2);
      bb->LiveOut.set(29);
      bb->LiveOut.set(16);
      bb->LiveOut.set(17);
      bb->LiveOut.set(18);
      bb->LiveOut.set(19);
      bb->LiveOut.set(20);
      bb->LiveOut.set(21);
      bb->LiveOut.set(22);
      bb->LiveOut.set(23);
      workinglist.push_back(bb);
    }
    
    if (bb->get_nb_inst() > 1 && bb->get_instruction_at_index(bb->get_nb_inst() - 2)->is_call()) {
      if (bb->get_instruction_at_index(bb->get_nb_inst() - 2)->is_syscall())
        bb->LiveOut.set(2);
      bb->LiveOut.set(4);
      bb->LiveOut.set(5);
      bb->LiveOut.set(6);
      bb->LiveOut.set(7);
    }
  }

  Basic_block* current;
  Basic_block* pred;
  Basic_block* suiv;
  bitset<NB_REG> tmp;
  while (!workinglist.empty()) {
    current = workinglist.front();
    workinglist.pop_front();
    tmp = current->LiveIn;
    for (int i = 0; i < current->get_nb_succ(); i++) {
      suiv = current->get_successor(i);
      current->LiveOut |= suiv->LiveIn; 
    } 

    current->LiveIn |= ((current->LiveOut &~ current->Def ) | current->Use); 
    for (int i = 0; i < current->get_nb_pred(); i++) {
      
      if (tmp != current->LiveIn) {
        pred = current->get_predecessor(i);
        workinglist.push_back(pred);
      }
    }
  }
}

void Function::show_live_var(void){
  // Affichage du resultat 
  for (auto bb: _myBB){
    cout << "********* bb " << bb->get_index() << "***********" << endl;
    cout << "LIVE_OUT : " ;
    for(int i = 0; i < NB_REG; i++){
      if (bb->LiveOut[i]){
	cout << "$"<< i << " "; 
      }
    }
    cout << endl;
    cout << "LIVE_IN :  " ;
    for(int i = 0 ; i < NB_REG ; i++){
      if (bb->LiveIn[i]){
	cout << "$"<< i << " "; 
      }
    }
    cout << endl;
  }
  return;
 }
     



/* En implementant la fonction test de la classe BB, permet de tester des choses sur tous les blocs de base d'une fonction par exemple l'affichage de tous les BB d'une fonction ou l'affichage des succ/pred des BBs comme c'est le cas -- voir la classe Basic_block et la m�thode test */

void Function::test(){
  for(auto bb: _myBB){
    bb->test();
  }
  return;
}
