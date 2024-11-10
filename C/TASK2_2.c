
/* This is a simple program in C */
  
#include <stdio.h>
#include <stdlib.h>

int main ()
 {
 	int x, y, z, mo1, mo2;
 	float t1, t2, t3;
 	
 	printf("Dwse treis times gia ta autokinhta \n");
 	scanf("%f, %f, %f" ,&t1, &t2, &t3);
 	
 	x=(int) (t1/1.16);
 	y=(int) (t2/0.88);
 	z=(int) (t3/1.62);
 	mo1=(x+y+z)/3;
 	mo2=(int) mo1;
 	
 	printf("Oi times tou prwtou autokinhtou se dolaria kai se eurw einai : %f,%d \n" ,t1,x);
 	printf("Oi times tou deuterou autokinhtou se agglikes lires kai se eurw einai : %f,%d \n" ,t2,y);
 	printf("Oi times tou tritou autokinhtou se australezika dolaria kai se eurw einai : %f ,%d \n" ,t3,z);
 	printf("O mesos oros twn triwn autokinhtwn se eurw einai : %d \n", mo2);
 	
 	system ("PAUSE");
 	
 	return 0;
}

