#include <stdio.h>
#include <string.h>
#define N 20

void hlikia(int x ,int a[]);//hlikia
int mesos_oros(int x,int a[]);//mesos oros
int max(int a[]);//megistos oros mesa ston meso oro
int y(int a[]);
void arxikopoihsh(int x, int a[]);//arxikopoihsh

int main()
{

int a[N],i=0,max1,x,c[10];
float mo;

read(a);

mo=mesos_oros(N,a);
printf("O mesos oros twn timwn einai %f\n",mo);//ektupwsh mesou orou

max1=max(a);
x=y(a);
printf("h megaluterh hlikia einai %d kai einai sthn %d thesh toy pinaka\n",max1,x);//eyresh megaluterhs hlikias kai pou einai ston pinaka

arxikopoihsh(N,a);


return 0;
}
void read( int a[])//synarthsh eisagwghs hlikiwn
{
    int i;
    printf("Dwse tis hlikies %d atomwn\n",N);

    for(i=0; i<N; i=i+1)
    {
        scanf("%d",&a[i]);


        while(a[i]<1 || a[i]>99)
        {
             printf("H hlikia den einai apodekth dwse allh hlikia\n");
             scanf("%d",&a[i]);
        }
    }

}

int mesos_oros(int x, int a[])//synarthsh eureshs mesoy orou
{
    int i;

    float sum=0;

    for (i=0; i<x; i++)
            sum += a[i];

return(sum/x);
}

int max(int a[])//synarthsh eureshs megisths hlikias

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


int y(int a[])//synarthsh eureshs theshs megisths hlikias
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

void arxikopoihsh(int x, int a[])//synarthsh apxikopoihshs
{
    int i,j,b[10];
    i=0;
    j=0;

        for(j=0; j<10; j++)
        {
            b[j]=0;
        }

        for(i=0; i<N; i++)
        {
            for(j=0; j<10; j++)
            {
                if(a[i]=1 && a[i]<10)
                    b[j]++;
            }
        }



       j=0;
       for(j=0; j<10; j++)
       {
           printf("%d\n",b[j]);
       }

}


