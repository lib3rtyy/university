#include <stdio.h>
#include <stdlib.h>

int main () {
	char etos;
	int x,sum ;
	float z,y;

printf("Eisagete to spoudwn sas se kefalaious latinikous xarakthres \n"  );
scanf("%c",&etos);

	
	/* Opou x to plithos apousiwn, y o vathmos eksetashs, z o vathos tou ergasthriou kai sum o telikos vathmos*/

if (etos=='A') {
    
    /* Sthn periptwsh pou o foithths einai prwtoeths*/
      
	  printf("Eisagete to plithos apousiwn sas pou exete kanei sto ergasthrio: \n");
	  scanf(" %d",&x);
	  
}
else  
if((etos=='A')&&(x>2)) {
    
	printf("Kophkes! Prepei na epanalaveis to ergasthrio \n");
    
	printf("Eisagete ton vathmo ths grapths eksetashs:\n");
    scanf(" %d",&y);


/* Meta thn eisagwgh tou vathmou thw grapths eksetashs emfanizei an petyxe h apetyxe*/

  if (y>=5) {
		printf("O vathmos toy graptou tha kratithei gia thn epomenh xronia \n");
		}
  else{
    printf("Apetuxes kai sth grapth eksetash \n");

	}

return 0;
}
/* Sthn periptwsh pou o foithths den einai prwtoeths*/

 if ((etos!= 'A')||(etos=='A')&&(x<=2)) {


	printf("Eisagete ton vathmo ths grapths eksetashs:\n");
	scanf("%f",&y);
}

if (y>=5) {
	
	printf("Perases thn grapth eksetash \n");
	printf("Eisagete ton vathmo tou ergasthriou \n");
	scanf(" %f",&z);

}
	
if (z>=5) {

sum=(0.7*y)+(0.3*z);
printf("perases me %d \n",sum);
printf("Perases to ergasthrio \n");
}

if (sum<5) {

printf("Apetuxes sto ergasthrio \n ");

}

if(y<5) {

printf("Exeis apotyxei sth grapth eksetash \n");
printf("Eisagete to vathmo ergasthriou \n");
scanf(" %d",&z);


}
if(z<5) {

printf("Apetyxes kai sto ergasthrio \n");
}


return 1;

}







