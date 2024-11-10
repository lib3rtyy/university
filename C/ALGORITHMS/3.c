#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h>

void merge(int arr[], int l, int m, int r)
{
    int i, j, k;
    int n1 = m - l + 1;
    int n2 = r - m;
    int L[n1], R[n2];

    for (i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];
  
    i = 0;
    j = 0;
    k = l;
    
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            i++;
        }
        else {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    while (i < n1) {
        arr[k] = L[i];
        i++;
        k++;
    }

    while (j < n2) {
        arr[k] = R[j];
        j++;
        k++;
    }
}


void mergeSort(int arr[], int l, int r)
{
    if (l < r) {
        int m = l + (r - l) / 2;

        mergeSort(arr, l, m);
        mergeSort(arr, m + 1, r);
  
        merge(arr, l, m, r);
    }
}


void fillArray(int array[], int arr_size){
	
	int i;
	
	for(i=0;i<arr_size;i++)
		array[i]=(rand() % 10000)+1;
	
}

int findMinDiff1(int array[],int arr_size)
{
	int i,j,diff=INT_MAX;
	for (i=0; i<arr_size-1; i++)
            for (j=i+1; j<arr_size-1; j++)
                if ( i!=j && abs((array[i] - array[j]) )< diff)
                    diff = abs((array[i] - array[j]));
       
        return diff;
}

int findMinDiff2(int array[], int arr_size){
	
	int i, min=INT_MAX;
	mergeSort(array,0,arr_size-1);
	
	for(i=0;i<arr_size-1;i++){
		if(array[i+1]-array[i]<min)
			min=array[i+1]-array[i];
	}
	
	return min;
}


int main(int argc, char *argv[]) {
	
	int i;
	clock_t t;
	double execTime, avgTime=0;
	srand(time(NULL));	
	
	int array1[60000], array2[70000], array3[80000], array4[90000], array5[100000];
	
	int arr_size1 = sizeof(array1) / sizeof(array1[0]);
	int arr_size2 = sizeof(array2) / sizeof(array2[0]);
	int arr_size3 = sizeof(array3) / sizeof(array3[0]);
	int arr_size4 = sizeof(array4) / sizeof(array4[0]);
	int arr_size5 = sizeof(array5) / sizeof(array5[0]);
	
	//Random number filling
	fillArray(array1, arr_size1);
	fillArray(array2, arr_size2);
	fillArray(array3, arr_size3);
	fillArray(array4, arr_size4);
	fillArray(array5, arr_size5);
	
	printf("----------------------findMinDiff1----------------------\n\n");
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff1(array1, arr_size1);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
	}
	
	avgTime/=5;
	printf("findMinDiff1 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size1);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff1(array2, arr_size2);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
	}
	
	avgTime/=5;
	printf("findMinDiff1 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size2);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff1(array3, arr_size3);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
	}
	
	avgTime/=5;
	printf("findMinDiff1 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size3);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff1(array4, arr_size4);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
	}
	
	avgTime/=5;
	printf("findMinDiff1 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size4);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff1(array5, arr_size5);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
	}
	
	avgTime/=5;
	printf("findMinDiff1 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size5);
	avgTime=0;
	
	printf("\n----------------------findMinDiff2----------------------\n\n");
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff2(array1, arr_size1);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
		fillArray(array1, arr_size1);
	}
	
	avgTime/=5;
	printf("findMinDiff2 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size1);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff2(array2, arr_size2);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
		fillArray(array2, arr_size2);
	}
	
	avgTime/=5;
	printf("findMinDiff2 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size2);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff2(array3, arr_size3);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
		fillArray(array3, arr_size3);
	}
	
	avgTime/=5;
	printf("findMinDiff2 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size3);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff2(array4, arr_size4);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
		fillArray(array4, arr_size4);
	}
	
	avgTime/=5;
	printf("findMinDiff2 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size4);
	avgTime=0;
	
	for(i=0;i<5;i++){
		t=clock();
		findMinDiff2(array5, arr_size5);
		t=clock()-t;
		execTime=((double)t)/CLOCKS_PER_SEC;
		avgTime+=execTime;
		fillArray(array5, arr_size5);
	}
	
	avgTime/=5;
	printf("findMinDiff2 took an average of %f seconds to execute for an array size of %d\n",avgTime,arr_size5);
	avgTime=0;
	
	return 0;
}










