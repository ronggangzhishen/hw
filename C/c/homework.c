#include<stdio.h>
#include<math.h>
int main()
{

}

/* '*'
{
int i;
static char a[80];
for(i=0;i<80;i++)
  {
   a[i]=getch();printf("*");
   if(a[i]=='\x0d') break;
  }
puts(a);
}*/
/* 2 p110
{
int i,j,k,n,m,count=1,a[24];
a[0]=3;
for(i=5;i<100;i+=2)
 {
  k=sqrt(i);
  for(j=2;j<=k;j++)
    if(i%j==0)
     break;
    if(j>k)
    {
     a[count]=i;
     count=count+1;
    }
 }
for(i=6;i<=100;i+=2)
  {
   for(j=0;j<=23;j++)
    {
     for(n=0;n<=j;n++)
      {
       if((i-a[j])==a[n]) printf("%d=%d+%d\n",i,a[n],a[j]);
      }
    }
  }
}*/
/* 2 p109 *shape*
{
int i,j,n;
scanf("%d",&n);                                      //n=行数-1,据图形，n为偶数
for(i=0;i<=n;i++)
    {
    for(j=1;j<=fabs(i-n/2);j++) printf("  ");
    for(j=1;j<=(n+1-2*fabs(i-n/2));j++) printf("* ");
    printf("\n");
    }
}
/* 2 p109
{
double x0,x1,x2,f0;
x1=-10,x2=10;
do
 {
    x0=(x1+x2)/2;                     //已知f(x)在[-10,10]上单增
    f0=2*x0*x0*x0-4*x0*x0+3*x0-6;
    if(f0<=0) x1=x0;
    else x2=x0;
 }
 while(fabs(f0)>1e-5);
 printf("x0=%f",x0);
}

/* 2 p109
{
int i,j,k,sum=0,count=0,c[11];
for(i=499;i>=3;i-=2)
 {
  k=sqrt(i);
  for(j=2;j<=k;j++)
    if(i%j==0) break;
    if(j>k)
    {
     count=count+1;
     c[count]=i;
     sum=sum+c[count];
    }
    if(count>=10) break;
 }
 if(count<10)printf("there are less than 10 prime numbers <500");
 else
 printf("%d+%d+%d+%d+%d+%d+%d+%d+%d+%d=%d\n",c[1],c[2],c[3],c[4],c[5],c[6],c[7],c[8],c[9],c[10],sum);
}*/

/* prime number
{
int i,j,k,count=0;
for(i=11;i<=100;i+=2)
 {
  k=sqrt(i);
  for(j=2;j<=k;j++)                   //
    if(i%j==0) break;
    if(j>k) count=count+1;
 }
 printf("%d",count);
}*/

/* 1 p112
{
int a,b,c,i=1,j=1;
while(i<=9)
 {
    printf("%5d",i*j);;
    if(i==j)
    {
        i++;
        j=1;
        printf("\n");
    }
    j++;
 }
}*/
/* 1 p113 e
{
int n,i=1;
double e=1,x,t=1;
scanf("%d%lf",&n,&x);
while(i<=n)
 {
     t=t*i;
     e=e+pow(x,i)/t;
     i++;
 }
 printf("exp{x}=%f",e);
}*/
/* 1 p112 s
{
   int i=1;
   double s=0;
   while(i<=100)
   {
       s=s+pow(-1,i+1)/i;
       i++;
   }
   printf("s=%f",s);
}*/
/* 1 p112 tax
{
    float gain,reduce;
    scanf("%f",&gain);
    if(gain>3000)
    {
        if(gain>3500)
        {
            if(gain>4500)
            {
                if(gain>6000)
                {
                    if(gain>8000)
                        reduce=0.25*(gain-8000)+750;
                    else reduce=0.2*(gain-6000)+350;
                }
                else reduce=0.15*(gain-4500)+125;
            }
            else reduce=0.1*(gain-3500)+25;
        }
        else reduce=0.05*(gain-3000);
    }
    else reduce=0;
    printf("you should gain %f\nyou really gain %f\n",gain,gain-reduce);
}*/

