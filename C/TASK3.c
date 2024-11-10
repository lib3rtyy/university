#include <stdio.h>
#include <stdlib.h>
#define Mathites 10

int main () {
/* Åisagwgh metavlhtwn */

float Programmatismos_C[Mathites];
float Thlepikoinwnies[Mathites];

int counter;
float Sum_C,Sum_T,MO_C,MO_T,Megisto;

Sum_C=0;
Sum_T=0;
Megisto=0;

/* Gia to mathima tou Programmatismou*/

for(counter=0;counter<Mathites;counter++){

do{
printf("Eisagete ton vathmo sas ston Programmatismo C\n");
scanf("%f",&Programmatismos_C[counter]);
}
while(Programmatismos_C[counter]<0 || Programmatismos_C[counter]>10);

if(Programmatismos_C[counter]>Megisto){
Megisto=Programmatismos_C[counter];
}

 /*Gia to mathima tvwn Thlepikoinwniwn*/
 
do{
printf("Eisagete ton vathmo sas stis Thlepikoinwnies\n");
scanf("%f",&Thlepikoinwnies[counter]);
}
while(Thlepikoinwnies[counter]<0 || Thlepikoinwnies[counter]>10);

if(Thlepikoinwnies[counter]>Megisto){
Megisto=Thlepikoinwnies[counter];
}
}

/*O vathmos tou kathe mathiti*/

for(counter=0;counter<Mathites;counter++){
printf("O vathmos ston Programmatismo C einai %f\n",Programmatismos_C[counter]);
printf("O vathmos stis Thlepikoinwnies einai %f\n",Thlepikoinwnies[counter]);

Sum_C=Sum_C+Programmatismos_C[counter];
Sum_T=Sum_T+Thlepikoinwnies[counter];
}

/*Upologismos kai ektupwsh tou Mesou Orou twn mathitwn*/

MO_C=(Sum_C/Mathites);
MO_T=(Sum_T/Mathites);


printf("O Mesos Oros ston Programmatismo C einai %f\n",MO_C);
printf("O Mesos Oros stis Thlepikoinwnies einai %f\n",MO_T);

/*Anadeiksh tou kaluterou vathmou pou anoikei se sugkekrimeno mathti*/

for(counter=1;counter<=Mathites;counter++){
	if (Programmatismos_C[counter]==Megisto)
    
    printf("O kaluteros vathmos ston Programmatismo C antistoixei ston mathiti %d kai einai %f\n",counter,Megisto);

	if (Thlepikoinwnies[counter]==Megisto)
		    printf("O kaluteros vathmos stis Thlepikoinwnies antistoixei ston mathiti %d kai einai %f\n",counter,Megisto);
    }
return 0;
}
