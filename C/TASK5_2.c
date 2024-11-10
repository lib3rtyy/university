#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{

int len,arr[26]={0},i=0,c,max=0,mem;
char str[21],str1[20],*ptr,char1;
ptr=str;

//Zhtame thn eisagwgh enos alfarithmhikou str
printf("Eisagete alfarithmhtiko str (megisto 20 xarakthres)\n");
gets(ptr);
len=strlen(ptr);

/*Orizoume alfarithmhtiko me mhkos to polu 20 xarakthres kai elegxoume an to alfarithmhtiko str
pou eisagei o xrhsths einai apodekto*/
while(len>20) 
{
	
//Ean den einai apodekto zhtaei apo ton xrhsth na eisagei kainourgio alfarithmhtiko
printf ("To alfarithmhtiko pou eisagate den einai apodekto parakalw prospathiste ksana\n");
gets(ptr);
}

//Diavazei to alfarithmhtiko me th vohtheia tou deikth
while(*ptr != '\0')
{
arr[*ptr-'a']++;
ptr++;
}

/*Eisagoume pinaka arr 26 thesewn opou h prwth thesh einai
 to prwto gramma tou agglikou alfavhtou ,A kai sthn 26h thesh to gramma Z*/
for (c = 0; c < 26; c++)
{ 

/*Me th metavlhth c diavazei ean kapoios xarakthras emfanizetai panw apo mia fora 
kai epeita tupwnei poios einai autos o xarakthras*/
    if (arr[c] >1)
    {
     printf("o xaraktiras '%c' emfanizetai pano apo 1 fores sto alfarithmitiko\n",c+'a');
     str1[i]=c+'a';
     i++;
    }
}

//Me th metavlhth max entopizoume poios xarakthras emfanizetai tis perissoteres fores 
for (c=0;c<26;c++)
{ 
    if (arr[c] >max)
    {
     max=arr[c];
     mem=c;
    }
}
//Epeita tupwnoume poses fores emfanizetai
printf("o xaraktiras '%c' einai autos pou iparxei  tis perissoteres fores kai emfanizetai  %d fores\n",mem+'a',arr[mem]);

//Zhtame apo ton xrhsth na eisagei enan xarakthra
printf("Eisagete enan xarakthra\n");
scanf("%c",&char1);
    
/*Ean o xarakthras einai enas apo autous pou tupothike logw twn parapanw entolwn tote
tupwnei pws o xarakthras emfanisthke prin*/
for(c=0;c<i;c++)

  {
  	if(char1==str1[c]){
  		printf("O xarakthras pou eisagate emfanisthke prin\n");
  		mem=1;
  		break;
	  }
	else mem=0;
   
  }
  
/*Ean o xarakthras den exei eisaxthei apo ton xrhsth stis prohgoumenes entoles tote
tupwnei pws den uparxei autos o xarakthras*/
if (mem==0)
printf("O xarakthras pou eisagate den yparxei\n");

return 0;
}
