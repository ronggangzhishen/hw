#include<stdio.h>
int main()
{
    int i,d;
    int minn=100,maxn=1,sign=1,num[26]={0};
    char s[100]={0},*p=s;
    gets(s);
    //puts(s);
    while(*p)
    {
        num[*p-'a']++;
        p++;
    }
    for(i=0;i<26;i++)
    {
        //printf("%d=%d\n",i,num[i]);
        if(num[i] < minn && num[i]!=0) minn=num[i];
        if(num[i] > maxn)            maxn=num[i];
    }
    //printf("maxn=%d  minn=%d\n",maxn,minn);
    d=maxn-minn;
    //printf("t=%d\n",t);
    if(d < 2) sign=0;
    else if(d < 4) sign=1;
    else
    {
        for(i=2;i<=d/2;i++)
        {
            if( d%i == 0 )  {sign=0; break;}
        }
    }
    if(sign)
        printf("Lucky Word\n%d",d);
    else
        printf("No Answer\n%d",sign);
}
