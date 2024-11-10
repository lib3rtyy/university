#include <stdio.h>
#include <stdlib.h>

int findDigits1(int num);
int findDigits2(int num);



int findDigits1(int num)
{
	
    if (num == 0)
    {
        return 0;
    }
    return 1 + findDigits1(num / 10);
    
}


int findDigits2(int num)
{
	
	static int count=0;
     
    while(num!=0)
    {
        count++;
        num=num/10;
    }
        return count;
    
}



int main() 
{
	int num,find1,find2;
	printf("Enter a non-negative integer:\n");
	scanf("%d",&num);
	
	find1= findDigits1(num);
	find2= findDigits2(num);
	
	printf("The total digits in number %d  using findDigits1 function is: %d\n",num,find1);
	printf("The total digits in number %d  using findDigits2 function is: %d\n",num,find2);
	
	return 0;
}
