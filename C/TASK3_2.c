#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main ()
{
	/*dilonoume metavlites*/
	char O[3][21];
	float M[3][4],MO[3],tixaia,min=0;
	int i,y,len,x,count=0,name;
	
	for ( i=0; i<3; i++ ) 
	/*  midenizoume kathe stihio tou pinaka MO*/
		MO[i] = 0;
	
	for (i=0;i<3;i++)
	{
		/*diavazoume ta onomata kai eleghoume an o arithmos twn xaraktiron einai megaluteros tou 10*/
		printf ("Doste to onoma tou %dou katasthmatos (Megisto 10 xaraktires)\n",i+1);
		gets (O[i]);
		fflush(stdin);
		len=strlen(O[i]);
		
		while (len>=10)
		{
			printf ("Dosate pano apo 10 xaraktires,parakalo ksanaprospathiste \n");
			gets (O[i]);
			len=strlen(O[i]);
		}
		
		/*diavazoume tis times tou kathe laptop gia katrhe katasthma kai tous vazoume se pinaka*/  
		for (y=0;y<4;y++)
		{
			printf ("Gia to %do katasthma dwste thn timh tou %dou laptop\n",i+1,y+1);
			scanf (" %f", &M[i][y]);
			fflush(stdin);
			/*vriskoume ton meso oro ton misthwn gia kathe ipalilo*/
			MO[i]+=M[i][y];
		}	
	}
	/*diavazoume mia timi apo ton hristi opos mas zitaei i ekfonisi*/
	printf ("Doste mia timi laptop\n");
	scanf("%f",&tixaia);
	/* eleghoume pioi ergazomenoi exoun pari mistho megalitero apo tin timi pou diavasame gia kathe hrono kai tiponoume ta onomata tous*/
	for(i=0;i<3;i++)
	{
		for( x=0;x<4;x++)
		{
			if(M[i][x]==tixaia)count++;
		}
	}
	
    printf("ta onomata twn katasthmatwn pou exoun laptop sthn timh pou eisagate einai: %d\n",count);
			
	printf("Eisagete ena onoma laptop\n");
	scanf("%d",&y);
	
	min=M[0][y];
	name=0;
	for(i=1;i<3;i++)
	{
		if (min>M[i][y])
		{
			min=M[i][y];
			name=i;
    	}
	}
	printf("To onoma tou katasthmatos pou exei th xamhloterh timh gia ton %do upologisth einai:%s\n",y,O[name]);
	system("PAUSE");
	return 1;
}
	
	
	
