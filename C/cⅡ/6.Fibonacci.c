#include<stdio.h>

int fib(int n){
    if(n == 1) return 1;
    else if(n == 2) return 1;
    else return fib(n-1)+fib(n-2);
}
int main()
{
    int i=0,maxn;
    int n;
    int a[100]={0},b[100]={0};
    while(scanf("%d",&n) != EOF)
    {
        if(n < 1) {a[i]=0; b[i]=0;}
        else
        {
            a[i]=n;
            b[i]=fib(n);
        }
        i++;
    }
    maxn=i;
    for(i=0;i<maxn;i++)
        printf("The Fibonacci number for %d is %d\n",a[i],b[i]);
}
