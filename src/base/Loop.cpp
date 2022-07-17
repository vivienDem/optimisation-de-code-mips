#include <Loop.h>


Loop::Loop(Basic_block *bb1, Basic_block *bb2, unsigned int id):header_bb(bb1), latch_bb(bb2), loop_id(id){}

Loop::~Loop(){}

void Loop::set_header(Basic_block *bb){
  header_bb = bb;
  return;
}
void Loop::set_latch(Basic_block *bb){
  latch_bb = bb;
  return;
}

void Loop::set_id(unsigned int id){
  loop_id = id;
  return;
}
Basic_block* Loop::get_header(){
  return header_bb;
}
Basic_block* Loop::get_latch(){
  return latch_bb;
}

unsigned int Loop::get_id(){
  return loop_id;
}
void Loop::display(){
  if (!header_bb || !latch_bb) {
    cerr << "Loop:display : can't display a loop without header or latch";
    exit(0);
  }
  cout << "Loop " << loop_id << " between BB" << header_bb->get_index() << " and BB" << latch_bb->get_index() << ": ";
    for (auto bb: _myBB){
	cout << "BB" << bb->get_index() << " ";
    }
  cout << endl;
  return;
}


int Loop::nbr_BB(){
  
  return _myBB.size();
}


void Loop::compute_in_loop_BB(){
  Basic_block * current;
  list<Basic_block*> workinglist;
  _myBB.push_back(header_bb);
  workinglist.push_back(latch_bb);
  bool contains;
  int nb_pred;
  do {
    current = workinglist.front();
    workinglist.pop_front();
    contains = false;
    for (auto bb : _myBB) {
      if (bb == current) {
        contains = true;
        break;
      }
    }
    if (!contains) {
      _myBB.push_back(current);
      nb_pred = current->get_nb_pred();
      for (int index = 0; index < nb_pred; index++) {
        workinglist.push_back(current->get_predecessor(index));    
      }
    }
  }
  while (!workinglist.empty());
  
  return;
}
