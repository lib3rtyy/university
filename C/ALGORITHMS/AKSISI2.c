#include <stdio.h>
#include <stdlib.h>

#define M 3
#define N 3

int costMap[M][N];

int findMin(int a, int b){
	
	if(a<b)
		return a;
	else
		return b;
	
}

int fun(int A[M][N]){
	
	int i,j;
	
	costMap[0][0]=A[0][0];
	
	//First row and column except [0][0] | Only moves to the right and down respectively
	for(i=1;i<N;i++){

		costMap[0][i]=A[0][i]+costMap[0][i-1];
		costMap[i][0]=A[i][0]+costMap[i-1][0];

	}
	
	//Rest of the map
	for(i=1;i<M;i++){
		for(j=1;j<N;j++){
			
			costMap[i][j]=findMin(A[i][j]+costMap[i-1][j],A[i][j]+costMap[i][j-1]);
			
		}
	}
	
	return costMap[M-1][N-1];
	
}

void printPath(int A[M][N]){
	
	int x=M-1, y=N-1;
	int tmpNum;
	
	printf("[%d][%d]<-",x,y);
	
	while(!(x==0 && y==0)){
		
		tmpNum=costMap[x][y]-A[x][y];
		
		if(tmpNum==costMap[x-1][y]){
			x-=1;
			printf("[%d][%d]<-",x,y);
		}
		else if(tmpNum=costMap[x][y-1]){
			y-=1;
			printf("[%d][%d]<-",x,y);
		}
		
	}
	
	printf("\n");
	
}

int main(int argc, char *argv[]) {
	
	int array1[M][N]={{1,2,3},
					{4,5,6},
					{7,8,9}};
				
	int array2[M][N]={{1,8,6},
					{7,2,5},
					{9,3,4}};
				
	int array3[M][N]={{1,6,9},
					{2,8,7},
					{3,4,5}};
				
	int array4[M][N]={{1,9,2},
					{8,3,7},
					{4,6,5}};
	
	printf("The shortest path cost to reach the bottom right cell in array1 is %d\n",fun(array1));
	printPath(array1);
	printf("The shortest path cost to reach the bottom right cell in array2 is %d\n",fun(array2));
	printPath(array2);
	printf("The shortest path cost to reach the bottom right cell in array3 is %d\n",fun(array3));
	printPath(array3);
	printf("The shortest path cost to reach the bottom right cell in array4 is %d\n",fun(array4));
	printPath(array4);
	
	return 0;
}
