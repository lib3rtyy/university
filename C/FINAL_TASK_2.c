#include <stdio.h>
#include <string.h>
#define N 20

void hlikia(int x ,int a[]);
int mesos_oros(int x,int a[]);
int max(int a[]);
int y(int a[]);
void arxikopoihsh(int omada[], int a[]);

int main()
{

int a[N],i=0,max1,x;
float mo;
int omada[10]={0};//se afton ton pinaka 8a kratietai to plithos twn atomon poy einai se kathe omada 

read(a);

mo=mesos_oros(N,a);
printf("O mesos oros twn timwn einai %f\n",mo);

max1=max(a);
x=y(a);
printf("h megaluterh hlikia einai %d kai einai sthn %d thesh toy pinaka\n",max1,x+1);

arxikopoihsh(omada,a);//stin sinartisi stelnoume tous 2 pinakes

for(i=0; i<10; i++)
	{
		printf("sthn omada %d anhkoyn %d atoma\n",i,omada[i]);//ektypwsh ths kathe omadas kai posa atoma antistoixoun sth kathe omada
	}


return 0;
}
void read( int a[])//sunarthsh pou diabazei ths hlikies twn atomvn
{
    int i;
    printf("Dwse tis hlikies %d atomwn\n",N);

    for(i=0; i<N; i=i+1)
    {
        scanf("%d",&a[i]);


        while(a[i]<1 || a[i]>99)//elegxos gia thn orthothta ths hlikias poy dinei o xrhsths
        {
             printf("H hlikia den einai apodekth dwse allh hlikia\n");
             scanf("%d",&a[i]);
        }
    }

}

int mesos_oros(int x, int a[])//sunarthsh pou briskei ton meso oro twn hlikiwn twn atomvn
{
    int i;

    float sum=0;

    for (i=0; i<x; i++)
            sum += a[i];

return(sum/x);
}

int max(int a[])//sunarthsh pou briskei thn megalyterh hlikia twn hlikiwn twn atomvn
{
    int max,i,y;

    max=a[0];

    for(i=0;i<N;i++)
    {
        if(max<a[i])
        {
            max=a[i];
            y=i;
        }
    }

return max;

}


int y(int a[])//sunarthsh pou briskei thnthesh ths megalyters hlikia twn hlikias twn atomvn
{
    int max,i,y;

    max=a[0];

    for(i=0;i<N;i++)
    {
        if(max<a[i])
        {

            y=i;
        }
    }

return y;

}

void arxikopoihsh(int omada[], int a[])//synarthsh pou bazei se ena pinaka to plhthos twn atomwn poy anhkei se kathe omada
{
    int i;
    for(i=0; i<N; i++)
    {
        if(a[i]>=1 && a[i]<10)
        {
		  omada[0]+=1;
		}
		else if(a[i]>=10 && a[i]<20)
        {
			omada[1]+=1;
		}
        else if(a[i]>=20 && a[i]<30)
        {
			omada[2]+=1;
		}
        else if(a[i]>=30 && a[i]<40)
        {
			omada[3]+=1;
		}
		else if(a[i]>=40 && a[i]<50)
        {
			omada[4]+=1;
		}
        else if(a[i]>=50 && a[i]<60)
        {
			omada[5]+=1;
		}
        else if(a[i]>=60 && a[i]<70)
        {
			omada[6]+=1;
		}
        else if(a[i]>=70 && a[i]<80)
        {
			omada[7]+=1;
		}
        else if(a[i]>=80 && a[i]<90)
        {
            omada[8]+=1;
		}
        else if(a[i]>=90 && a[i]<10)
        {
			omada[9]+=1;
		}
    }
}



