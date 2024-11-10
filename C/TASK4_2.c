#include <stdio.h>
#include <stdlib.h>

int main () {
    const int applications=10;
    
int Counter , Bestapp;
float x, y, z, max;
char rec;

max=0;
Bestapp=0;

for(Counter=1; Counter<=applications; Counter++) {
	
	printf("application %d\n", Counter);
	
printf("Eisagete ton vathmo sas sto mathhma \n");
scanf("%f", &x); 

/* xrhsimopoioume thn while gia na ginei elegxos ths sunthhkhs sthn arxh tou bragxou */

/* elegxoume ton vathmo sto mathhma ths C*/

while(x<0 || x>10);{
	
	printf("O vathmos sou einai akuros \n");
	printf("Eisagete ton vathmo sas sto mathhma \n");
	scanf("%f", &x);
	
}

/* elegxoume ton meso oro ths vathmologias */

printf("Eisagete ton meso oro ths vathmologias sas \n"); 
scanf("%f",&y);

while(y<5 || y>10); {
	
	printf("O mesos oros einai akuros \n");
	printf("Eisagete ton meso oro ths vathmologias sas \n");
	scanf("%f",&y);
}

fflush(stdin);

/* elegxoume to epipedo twn systatikwn epistolwn */
printf("Eisagete to epipedo twn sustatikwn epistolwn : A=aristes, B=polu kales h C=kales \n");
scanf("%c",&rec);
 
 while(rec!='A' && rec!='B' && rec!='C'); {
 	 
 	 printf("H sustatikh epistolh einai akurh\n");
 	 fflush(stdin);
 	 
 	 printf("Eisagete to epipedo twn sustatikwn epistolwn : A=aristes, B=polu kales h C=kales \n");
scanf("%c",&rec);
 	 
 }
 
 /* edw upologizoume thn vathmologia ths kathe aithshs */
 
 if(rec=='A') {
 	
 	z=(x+y);
 	
 	printf("O telikos vathmos tou application %d einai %f\n\n", Counter, z);
 	
 	if(z>max) {
 		
 		max=z;
 		Bestapp=Counter;
	 }
 	
 }
 if(rec=='B') {
 	
 	z=(x+y)*0.9;
 	
 	printf("O telikos vathmos tou application %d einai %f\n\n", Counter, z);
 	
 	if(z>max) {
 		
 		max=z;
 	    Bestapp=Counter;
	 }
 }
 
 if(rec=='C') {
 	z=(x+y)*0.8;
 	
 	printf("O telikos vathmos tou application %d einai %f\n\n", Counter, z);
 	
 	if(z>max);{
 		
 		max=z;
 	    Bestapp=Counter;	
	 }
 }
}
/* telos typwnetai h kalyterh vathmologia kai o aukswn arithmos ths aithshs*/

printf("To kalutero application einai %d me timh %f\n", Bestapp,max);

return 0;
}

