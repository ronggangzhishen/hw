#include<stdio.h>
#include<math.h>
int main()
{
    int n;
    scanf("%d",&n);
    n=1;
    printf("please input 'a,b'\n");

}
/*?change color
#include <stdlib.h>
void cc()
{
system("color f0");
}
*/
/* bubble
{
int i,j,t,a[10]={11,9,8,7,6,5,4,3,2,1};
for(i=0;i<9;i++)
  {for(j=0;j<10-i;j++)
    {
     if(a[j]>a[j+1])
       {
        t=a[j];
        a[j]=a[j+1];
        a[j+1]=t;
       }
    }
  }
for(i=0;i<10;i++) printf("%4d",a[i]);
}*/
/*change order       !!!error
{
int x,i,j,n;
double y=0;
scanf("%d%d",&n,&x);
for(i=1;i<=n;i++)
  {
    j=x%10;
    y=y+j*pow(10,(n-i));
    printf("%.f\n",j*pow(10,(n-i)));
    x=x/10;
  }
printf("%.f",y);
}*/
/*C(?,?)
{
long int ways=0;
int a=6,b=3,c=3,i=0;
for( ;i<2;ways=ways+combine(6,6-i)*combine(3,2+i),i++);
for(i=0;i<3;ways=ways+combine(6,6-i)*combine(3,1+i),i++);
for(i=0;i<4;ways=ways+combine(6,6-i)*combine(3,i),i++);
for(i=0;i<5;ways=ways+combine(6,6-i)*combine(3,i-1),i++);
printf("ways=%ld",ways);
}
int combine(int a,int b)
{
    int i=0;
    long int c=1;
    while(i < b)
    {
        c=c*(a-i)/(1.0+i);
        i++;
    }
    return c;
}*/
