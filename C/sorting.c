#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 5
#define key(A) (A) 
#define less(A, B) (key(A) < key(B))
#define exch(A, B) { item t = A; A = B; B = t; } 
#define compexch(A, B) if (less(A, B)) exch(A, B) 
typedef int item;

void insertionsort(item *a, int n) {
	int i, j;
	item temp;
	
	for (i = 1; i < n; i++) {
		compexch(a[i], a[0]);
	}
	for (i = 2; i < n; i++) {
		j = i;
		temp = a[i];
	
		while (less(temp, a[j - 1])) {
			a[j] = a[j - 1];
			j--;
		}
		a[j] = temp;
	}
}

void selectionsort(item *a, int n) {
	int i, j, min;
	for (i = 0; i < n - 1; i++) {
		min = i;
		for (j = i + 1; j < n; j++) {
			if (less(a[j], a[min])) 
				min = j;
		}
		exch(a[i], a[min]); 
	}
}



void display(item *a, int n) {
	int i;
	printf("-----\n");
	for (i = 0; i < n; i++) {
		printf("%d ", a[i]);
	}
	printf("\n-----\n");
}


int main(int argc, char *argv[]) {
	
	int counter,i;
	int A[N];
	clock_t start, end;
	double cpu_time_used;
	
	for (i=0;i<10;i++)
	{

		for(counter=0;counter<N;counter++)
		{
			A[counter]=rand();
			//printf("%d\n", A[counter]);
		}		
    

	start = clock();
	insertionsort(A,N);
	end = clock();
	//display (A,N);
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("\n");
	printf("%lf \n", cpu_time_used);
	
	start = clock();
	selectionsort(A,N);
	end = clock();
	//display (A,N);
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("\n");
	printf("%lf \n", cpu_time_used);
	
	
    }
srand(time(NULL));
return 0;
}
