#include <stdio.h>

int input_min(int N, int *a){
  int mi = 1000000;
  for(int i = 0; i < N; i++){
    scanf("%d", &a[i]);
    if(a[i] < mi){
      mi = a[i];
    }
  }
  return mi;
}

void out_put(int N, int *b){
  for(int i = 0; i < N; i++){
    printf("%d ", b[i]);
  }
}

void task(int *a, int  *b, int mi, int N){
  for(int i = 0; i < N; i++){
    if(a[i] == 0){
      b[i] = mi;
    }
    else{
      b[i] = a[i];
    }
  }
}

int main(void) {
  int mi=1000000;
  int N = 0;
  scanf("%d", &N);
  if(N < 0){
	printf("incorrect input");
	return 0;
  }
  int a[N*sizeof(int)];
  mi = input_min(N, a);
  int b[N*sizeof(int)];
  task(a, b, mi, N);
  out_put(N, b);
  return 0;
}
