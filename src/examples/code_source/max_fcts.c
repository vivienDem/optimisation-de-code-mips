
int tab[] = {23, 45, -6, 120, 2, 11, 23};
char espace = ' ';
char rt = '\n';

extern void print_int(int);
extern void print_char(char);

int max2(int a, int b){
  if (a < b)
      return b;
  else
      return a;
}

int max(int a, int b, int c){
  if (a < b)
    if (b < c)
      return c;
    else
      return b;
  else
    if (a < c)
      return c;
    else
      return a;
}

int max_tab(int *t, int size){
  int i;
  int maxtab = -1;
  for (i = 0;  i < size; i++)
    if (maxtab < t[i])
      maxtab = t[i];

  return maxtab;
}


int main(int argc, char ** argv){

  print_int(max2(23,5));
  print_char(rt);
  
  print_int(max(3, 16, 8));
  print_char(rt);
  
  print_int(max_tab(tab,7));
  print_char(rt);
  return 0;
}
