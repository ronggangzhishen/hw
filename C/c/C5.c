#include<stdio.h>
#include<math.h>
int main()
{

}
/* 1 p163
{
	char str1[]="abcdefgheijkelmnefg";
	char str2[]="efg";
	int t[80]={0};
	int a,b,i,j,m=0;
	a=strlen(str1);
	b=strlen(str2);
		for(i=0;i<=a-b;i++)
		{
			if(str1[i]==str2[0])
			{
				t[m]=i;                             //记录下a中b[0]的多个位置
				m++;
			}
		}
		for(i=0;i<m;i++)
		{
		    for(j=0;j<b;j++)
		    {
		    	if(str1[t[i]+j] != str2[j]) break;  //从刚才记录的位置开始判断
			}
			if(j >= b)
			{
				printf("%d\n",t[i]+1);
			    //break;                         //若去掉break;可以给出str2在str1中的多个位置
			}
		}
}*/
/* 1 p163
void udfcpy(char a[],char b[])
{
	int i=0;
	while(b[i]!='\0')
	{
	a[i]=b[i];
	i++;
    }
}
int main()
{
	char a[80]="abc";
	udfcpy(a,"aiueo");
	puts(a);
}*/
/* 1 p163
int udf_strcmp(char a[],char b[])
{
	int i=0;
	while(1)
	{
	    if(a[i]=='\0'&&b[i]=='\0') return 0;
        if(a[i]==b[i]) i++;
		else return (a[i]-b[i]);
	}
}
int main()
{
char a[]="abcde";
char b[]="aeiou";
printf("%d\n",udf_strcmp(a,b));
}*/

/* 1 p163
void udf_strcat(char a[],char b[])
{
	int i=0,j=0;
    while(a[i]!='\0')
    {
     i++;
    }
    while(b[j]!='\0')
    {
     a[i+j]=b[j];
     j++;
    }
}
int main()
{
	char a[80]="hey ",b[]="world!";
	udf_strcat(a,b);
    printf("%s\n",a);
}*/

/* 1 p161
{
int a[15]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14},b,min=0,max=14,mid;
scanf("%d",&b);
if(b<a[0]||b>a[14]) printf("ないです");
else
  {
    while(1)
    {
     mid=(min+max)/2;
     if(b>a[mid]) min=mid+1;
     else if(b==a[mid])
      {
       printf("%d",mid);
       break;
      }
     else max=mid-1;
    }
  }
}*/

/* 1 p163 insert
{
int a[30]={1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39},b[10]={5,6,7,8,9,21,22,23,0,40};
int i,j,m,n;
for(i=0;i<10;i++)
  {
   for(j=0;j<20+i;j++)
     {
      if(b[i]<a[j])
       {
        for(m=20+i;m>j;m--) a[m]=a[m-1];
         a[j]=b[i];
         break;
       }
     }
     if(b[i] > a[j]) a[20+i]=b[i];
  }
for(i=0;i<30;i++)
  {if( (i+1)%5 == 0 ) printf("%6d\n",a[i]);
   else printf("%6d",a[i]);
  }
}*/

/* 1 p163
{
int i=0,n,m=0,x;
char c;
static int a[20];
do
  {
   scanf("%d",&a[i]);
   i++;
   c = getchar();
  }
while(c!='\n');
scanf("%d",&m);                    //m为第几个数,1<=m<=20
for(i=m;i<20;i++) a[i-1]=a[i];
for(i=0;i<19;i++)
   {if((i+1)%5==0) printf("%6d\n",a[i]);
    else printf("%6d",a[i]);
   }
}*/
/* 1 p163
{
int i=0,n,m=0,x=1;
char c;
static int a[21];
do
  {
   scanf("%d",&a[i]);
   i++;
   c = getchar();
  }
while(c!='\n');
scanf("%d%d",&m,&x);                    //m为第几个数
for(i=21;i>(m-1);i--) a[i]=a[i-1];
a[m-1]=x;
for(i=0;i<21;i++)
   {if((i+1)%5==0) printf("%6d\n",a[i]);
    else printf("%6d",a[i]);
   }
}*/
