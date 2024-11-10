#include <stdio.h>
#include <stdlib.h>
#define N 4

int main ()
{
	int x1,x2;
	int a[N],b[N],c[N];
	int *ptr1,*ptr2,*ptr3;
	int i;
	ptr1=a;
	ptr2=b;

//Eisagwgh timwn x1 kai x2
printf("Eisagete times gia tis metavlhtes x1 kai x2\n");
scanf("%d %d",&x1,&x2);


//Eisagwgh timwn ston pinaka a 
for (i=0;i<4;i++)
{
	printf("Eisagete timh gia th %dh thesh mhnmhs tou pinaka a \n",i+1);
    scanf("%d",ptr1);
    ptr1++;
}


//Eisagwgh timwn ston pinaka b
for (i=0;i<4;i++)
{
	printf("Eisagete timh gia th %dh thesh mhnmhs tou pinaka b \n",i+1);
    scanf("%d",ptr2);
    ptr2++;
}


//Ekxwrhsh twn x1 kai x2 stous deiktes ptr1 kai ptr2
ptr1=&x1;
ptr2=&x2;


//Tupwsh timwn me thn xrhsh deiktewn
printf("H timh ths metavlhths x1 einai x1=%d\n",*ptr1);
printf("H timh ths metavlhths x2 einai x2=%d\n",*ptr2);


//Aukshsh tou deikth ptr1 kata 1 kai tupwsh tou periexomenou ths theshs mnhmhs
(*ptr1)++;
printf("To periexomeno ths theshs mhnmhs einai %d\n",*ptr1);	

//Kataxwrhsh ston deikth ptr1 thn timh tou deikth ptr2
ptr1=&x2;

//Tupwsh timwn x1 kai x2 me thn xrhsh twn deiktwn
printf("Oi timh ths metavlhths x1 einai x1=%d kai ths metavlhths x2 einai x2=%d\n",*ptr1,*ptr2);
	
//Ekxwrhsh tou prwtou stoixeiou tou pinaka a ston deikth ptr1
ptr1=&a[0];

//Ekxwrhsh tou prwtou stoixeiou tou pinaka b ston deikth ptr2
ptr2=&b[0];

//Provolh twn stoixeiwn tou pinaka a me vrogxo kai th xrhsh tou deikth ptr1
for (i=0;i<4;i++)
{
	printf("To %do stoixeio tou pinaka a einai %d\n",i+1,*(ptr1+i));
}

//Pollaplasiasmos twn timwn twn pinakwn a kai b me th vohtheia twn deiktwn kai kataxwrhsh twn apotelesmatwn ston pinaka c
ptr3=c;
for (i=0;i<4;i++)
{
*ptr3=(*ptr1)*(*ptr2);
ptr1++,ptr2++,ptr3++;
}

//Tupwsh twn periexomenwn tou pinaka c me th xrhsh deikth ptr3
ptr3=c;
for (i=0;i<4;i++)
{
printf("To ginomeno twn %dwn timwn twn pinakwn a kai b einai %d\n",i+1,*(ptr3+i));
}
	return 0;
}
