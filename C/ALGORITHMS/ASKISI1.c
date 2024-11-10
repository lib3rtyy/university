#include<stdio.h>
#include <stdlib.h>
#include <time.h>

//recursive
int permutationCoeff1(int n, int k)  //O(n)
{
    int fact[n + 1],i;
   
    fact[0] = 1;
 
    for (i = 1; i <= n; i++)
        fact[i] = i * fact[i - 1];
 
    return fact[n] / fact[n - k];
}
 
int findMin(int a, int b)
{
	
	if(a<b)
		return a;
	else
		return b;
	
}

//botom up
int permutationCoeff2(int n, int k) 
{ 
    int P[n + 1][k + 1],i,j; 
  
    for ( i = 0; i <= n; i++) 
    { 
        for ( j = 0; j <=findMin(i, k); j++) 
        { 
            
            if (j == 0) 
                P[i][j] = 1; 
            else
                P[i][j] = P[i - 1][j] + (j * P[i - 1][j - 1]); 
  
            P[i][j + 1] = 0; 
        } 
    } 
    return P[n][k]; 
} 

// top-down 
int permutationCoeff3(int n, int k)
{ 
    int P[n][k];
    int fact[n + 1],i;
    
    if (n == 0 || k == 0) 
		return 1;  
    if (P[n][k] != -1) 
		return P[n][k];
		
		fact[0] = 1;
    for (i = 1; i <= n; i++)
        fact[i] = i * fact[i - 1];
			
    return P[n][k] = permutationCoeff3(n-1, k) + permutationCoeff3(n, k-1);
}


int main()
{
    int n,i,k;
    clock_t t;
	double execTime, avgTime=0;
	
	
	for(i=0;i<10;i++)
	{
		printf ("Enter the value of n: ");
	    scanf("%d",&n);
	    printf ("Enter the value of k: ");
	    scanf("%d",&k);
	    t=clock();
	    printf ("Value of P(%d, %d) is %d \n",n, k, permutationCoeff1(n, k) );
		t=clock()-t;
		execTime=(double)(t/CLOCKS_PER_SEC);
		avgTime+=execTime;
	}
	
    avgTime/=10;
	printf("permutationCoeff1 took an average of %f seconds to execute \n", avgTime);
	avgTime=0;
	printf("---------------------------------\n");
	
	for(i=0;i<10;i++)
	{
		
		printf ("Enter the value of n: ");
	    scanf("%d",&n);
	    printf ("Enter the value of k: ");
	    scanf("%d",&k);
	    t=clock();
	    printf ("Value of P(%d, %d) is %d \n",n, k, permutationCoeff2(n, k) );
		t=clock()-t;
		execTime=(double)(t/CLOCKS_PER_SEC);
		avgTime+=execTime;
	}
	
	avgTime/=10;
	printf("permutationCoeff2 took an average of %f seconds to execute \n", avgTime);
	avgTime=0;
	printf("---------------------------------\n");
	
	for(i=0;i<10;i++)
	{
		
		printf ("Enter the value of n: ");
	    scanf("%d",&n);
	    printf ("Enter the value of k: ");
	    scanf("%d",&k);
	    t=clock();
	    printf ("Value of P(%d, %d) is %d \n",n, k, permutationCoeff3(n, k) );
		t=clock()-t;
		execTime=(double)(t/CLOCKS_PER_SEC);
		avgTime+=execTime;
	}
	
	avgTime/=10;
	printf("permutationCoeff3 took an average of %f seconds to execute \n", avgTime);
	avgTime=0;
	
    return 0;
    
}





























