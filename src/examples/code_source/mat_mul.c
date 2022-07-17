#define N 4
int A[N][N] = {1, 2, 3, 4,
	       5, 6, 7, 8,
	       9, 10, 11, 12,
	       13, 14, 15, 16};
int Ident[N][N] = {1, 0, 0, 0,
	       	0, 1, 0, 0,
		0, 0, 1, 0,
                0, 0, 0, 1};
int C[N][N];
char espace = ' ';
char rt = '\n';

extern void print_int(int);
extern void print_char(char);


int mat_mul(int a[N][N], int b[N][N], int c[N][N]){
  
  int i, j, k;
  int sum = 0;
  for (i = 0;  i < N; i++)
     for (j = 0;  j < N; j++)
       c[i][j] = 0;

  for (i = 0;  i < N; i++)
     for (j = 0;  j < N; j++)
       for (k = 0;  k < N; k++){
	 int tmp = a[i][k] * b[k][j];
	 sum += tmp;
	 c[i][j] += tmp;
       }
  return sum;
}

void print_mat(int m[N][N]){

 int i, j;
 for (i = 0;  i < N; i++){
    for (j = 0;  j < N; j++){
       print_int(m[i][j]);
       print_char(espace);
    }
    print_char(rt);
 }
}

int mat_mul_4(int a[4][4], int b[4][4], int c[4][4]){
  
  int i, j, k;
  int sum = 0;
  for (i = 0;  i < 4; i++)
     for (j = 0;  j < 4; j++)
       c[i][j] = 0;

  for (i = 0;  i < 4; i++)
    for (j = 0;  j < 4; j++)  {  
      int tmp = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j] + a[i][3] * b[3][j];
      sum += tmp;
      c[i][j] += tmp;
    }
  return sum;
}

int main(int argc, char ** argv){

  mat_mul(A, Ident, C);
  print_mat(C);

  mat_mul_4(A, Ident, C);
  print_mat(C);
  
  return 0;
}
