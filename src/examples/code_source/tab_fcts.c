#define N 10
int tabA[N] = {23, 45, -6, 120, 2, 11, 23, -5, 12, 14};
int tabB[N] = {13, 5, -16, 12, 24, 115, -123, -55, 57, 0};
int tabC[N];
int tabD[N];
char espace = ' ';
char rt = '\n';

extern void print_int(int);
extern void print_char(char);
extern void print_string(char *);

void sum(int tab1[], int tab2[], int tab3[], int size)
{
  int i;
  for (i = 0; i < size; i++){
    tab3[i] = tab1[i]  + tab2[i]; 
  }
  return;
}
int max_min_tab(int a[], int b[], int c[], int d[], int size){
  int i;
  for (i = 0; i < size; i++){
    if (a[i] < b[i]){
      c[i] = b[i];
      d[i] = a[i];
    }
    else {
      c[i] = a[i];
      d[i] = b[i];
    }
  }
  return 0;
}

int sum_tab(int tab[], int size){
  int i;
  int sum = 0;
  for (i = 0; i < size; i++){
    sum += tab[i];
  }
  return sum;
}

int sum_tab_unroll(int tab[], int size){
  int i;
  int sum = 0;
  for (i = 0; i + 3 < size; i += 4){
    sum += tab[i] + tab[i+1] + tab[i+2] + tab[i+3];
  }
  for (; i < size; i += 1)
    sum += tab[i];
  
  return sum;
}

void print_tab(int tab[], int size){
  int i;
  for (i = 0; i < size; i++){
    print_int(tab[i]);
    print_char(espace);
  }
  print_char(rt);
  return;
}



int main(int argc, char ** argv){
  int n = 10;
  int s = sum_tab(tabA, n);
  print_int(s);
  print_char(espace);
  print_char(rt);
  
  s = sum_tab_unroll(tabA, n);
  print_int(s);
  print_char(espace);
  print_char(rt);
 
  sum(tabA, tabB, tabC, n);
  print_tab(tabC, n);
  
  max_min_tab(tabA, tabB, tabC, tabD, n);
  print_tab(tabC, n);
  print_tab(tabD, n);
  
  return 0;
}
