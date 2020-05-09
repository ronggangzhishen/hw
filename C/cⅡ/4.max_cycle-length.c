#include<stdio.h>

int max_cyclelength(int a,int b){   //the tree end with 1
    int t;
    int i,j,max=0;
    if(a>b){t=a;a=b;b=t;}//change to a<b
    for(i=a;i<=b;i++)  //calculate the cycle-length of i
    {
        t=i;
        for(j=1;t!=1;j++)
        {
            if(t%2 == 0)
                t/=2;
            else
            {
                t*=3;
                t+=1;
            }
        }
        if(j > max) max=j;
    }
    return max;
}
int main()
{
    int a,b;
    int i=0;
    int c[1000]={0},ca[1000],cb[1000];
    while(scanf("%d %d",&a,&b) != EOF)
    {
        c[i]=max_cyclelength(a,b);
        ca[i]=a;
        cb[i]=b;
        i++;
    }

    i=0;
    while(c[i]>0)
    {
        printf("%d %d %d\n",ca[i],cb[i],c[i]);
        i++;
    }
}
