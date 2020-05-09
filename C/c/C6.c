#include<stdio.h>
#include<math.h>
#include<string.h>
/* 16
int reverse(int a)
{
    int i=1,b=0,j,t;
    while(1)
    {
        if(a>=pow(10,i-1)&&a<pow(10,i)) break;
        i++;
    }
    for(j=i-1;j>=0;j--)
    {
        t=a%10;
        b=b+t*(int)(pow(10,j)+0.5);         //pow=(double)
        a=a/10;
    }
    return b;
}
int main()
{
    int i=101;
    for(i=101;i<1000;i+=2)
        if(prime(i)&&prime(reverse(i))) printf("%d\n",i);    // see 1
}*/
/*    15
void function(int a)
{
    if(a%2==1) printf("你在逗我笑");
    int i=3;
    while(a>=6&&a%2==0)
    {
        if(prime(i)&&prime(a-i))           //见 1
        {
            printf("%d=%d+%d",a,i,a-i);
            break;
        }
        i+=2;
    }
}
int main()
{
    int a=233;
    function(a);
}
/*     14
int c[80]={0};
int i=0;
void change2(int a)
{
      //转成二进制后限制80位
    int j;
    while(1)
    {
        if(a%2==1) c[i]=1;
        else       c[i]=0;
        i++;
        a=a/2;
        if(a==0) break;
    }
    c[i]=0;
    for(j=i-1;j>=0;j--) printf("%d",c[j]);
}
void change8(int a)
{
    int j,m;
    int t[30]={0};
    for(j=0,m=0;j<(i+1)/3;j++,m+=3)
    {
        t[j]=c[m]+2*c[m+1]+4*c[m+2];
        printf("%d %d %d %d\n",t[j],c[m],c[m+1],c[m+2]);
    }
    for(m=j-1;m>=0;m--) printf("%d",t[m]);
}
// 16=2/4
void main()
{
    int a=17389;
    change2(a);
    printf("\n%o\n",a);
    change8(a);
    printf("\n%x\n",a);
}*/

/* 12
void function(char a[])
{
    int i=0,j,space=0,number=0,letter=0,others=0;
    while(a[i]!='\0') i++;
    printf("%d",i);
    for(j=0;j<i;j++)
    {
        if(a[j]==32) space++;
        else if(a[j]>47&&a[j]<=57) number++;
        else if(a[j]>64&&a[j]<=90||a[j]>96&&a[j]<=122) letter++;
        else others++;

    }
    printf(" space=%d\n number=%d\n letter=%d\n others=%d\n",space,number,letter,others);
}
void main()
{
    char c[]="  ";            //a[i]!=\n,......
    function(c);
}*/

/* 8
void turn(char a[])
{
    int i=0,j;
    while(a[i]!='\0') i++;
    for(j=i-1;j>=0;j--) printf("%c",a[j]);
}
void main()
{
    char a[80]="\0";
    gets(a);
    turn(a);
}*/

/* 2
int f1(int a,int b)
{
    int i;
    if( a < b )
    {
        i=a;
        a=b;
        b=i;
    }
    for(i=b;i>0;i--)
    if(a%i==0&&b%i==0) return i;
}
int f2(int a,int b)
{
    return a*b/f1(a,b);
}
void main()
{
    int a=12,b=15;
    printf("%d\n",f1(a,b));
    printf("%d\n",f2(a,b));
}*/
/* its 17
int i=1,j=0;
int main()
{
    void turn();
    int a=12034;
    char s[80]="\0";
    while(1)
    {
        if( a >= pow(10,i-1) && a < pow(10,i) ) break;
        else i++;
    }
    turn(a,s);
    puts(s);
}
void turn(int a,char s[])
{
    char t;
    t=a%10 + 48;
    a=a/10;
    if( t == 48 && i == 0 ) ;
    else
    {
        s[j]=t;
        j++;
        i--;
        turn(a,s);
    }
}*/

/* 17
int i=1;
void turn(int a)
{
    char t;
    t=a%10;
    a=a/10;
    if( t == 0 && i == 0 ) printf("end");
    else
    {
        putchar(t+48);
        i--;
        turn(a);
    }
}

int main()
{
    int a=12034;
    while(1)
    {
        if( a >= pow(10,i-1) && a < pow(10,i) ) break;
        else i++;
    }
    turn(a);
}*/

/* 1
int prime(int a)
{
    if(a==3) return 1;
    else if(a<3) return 0;
    else
    {
      int i,k;                //a<=3?
      k=sqrt(a);
      for(i=2;i<=k;i++)
      if(a%i==0)  return 0;
      return 1;
    }
}
*/
