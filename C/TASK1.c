
/* This is a simple program in C */
  
#include <stdio.h>
#include <stdlib.h>

int main () {
	int x,y,z,mod,sum,prod;

       x=20;
	   y=7;
	   sum=x+y;
	   prod=x*y;

printf("To athroisma twn x kai y einai:%d \n",sum);
printf("%d,%d,%d \n" ,x,y,sum);
printf("To ginomeno twn x kai y einai:%d \n",prod);
printf("%d,%d,%d \n" ,x,y,prod);

	float d,w,f;
		w=10.6;
	    f=5.2;
        d=w/f;

printf("To phliko twn w kai f einai:%f \n",d);
printf("%f,%f,%f \n",w,f,d);

	mod=x%y;

printf("To upoloipo diaireshs twn x kai y einai:%d \n",mod);
printf("%d,%d,%d \n",x,y,mod);


	 return 0;
}
