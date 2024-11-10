#include <stdio.h>\
#include <stdlib.h>

int main() {
	float x,y,z;

printf("Eisagete thn timh tou 1ou autokinhtou se dolaria \n");
scanf("%f \n",x);

printf("Eisagete thn timh tou 2ou autokinhtou se lires \n");
scanf("%f \n" ,y);

printf("Eisagete thn timh tou 3ou autokinhtou se australezika dolaria \n");
scanf("%f \n",z);
  
	int b,e,k,a;

	b=(int)(x/1.16);
	e=(int)(y/0.88);
	k=(int)(z/1.62);
	a=(int)((b+e+k)/3);

printf("To prwto autokinhto stoixhse %f se dolaria kai %d se euro \n",x,b);
printf("To deutero autokinhto stoixhse %f se lires kai %d se euro \n",y,e);
printf("To trito autokinhto stoixhse %f se australezika dolaria kai %d se euro \n",z,k);
printf("o Mesos Oros twn timwn einai %d \n",a);
	return 0;
}
