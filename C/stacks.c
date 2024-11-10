#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

int main(int argc, char *argv[]) {
	
	stack_type stackA;
	stack_element_type item;
	int a;
	
	initialize(&stackA);
	
	printf("Please give a positive, real number: \n");
	scanf("%d",&a);
	
	while(a>0)
	{
		a = a%2;
		a = a/2;
		push(&stackA,a);
	}
	
    
		display(stackA);
	
	
	return 0;
}


