#include<stdio.h>
#include<string.h>

struct book{
	int number;
	char title[40];
	char sex;
};
void get(struct book *a)
{
	scanf("%d,%s %c",&a->number,a->title,&a->sex);
	printf("%d  %s  (%c)\n",a->number,a->title,a->sex);
}
int main()
{
	struct book book[10],*p=book;
	
	int i;
	//for(i=0;;)
	get(p);
	i=book[0].number;
	i+=9;
	i/=10;
	
	
	printf("%d\n",i);
}
/*{
	int a;
	char s[5][20]={"aiueo","aeiou","abcde","adobe","asdfg"};
	char ((*p)[20])[5]=s,t[20];
	strcpy(t,s[0]); strcpy(s[0],s[1]); strcpy(s[1],t); 
	a=strcmp(p[0],p[1]);
	printf("%d\n",strcmp(s[0],s[1]));
	char *pa[5];
	pa[1]=s[1];
	printf("%s",pa[1]);
}*/
/*{
	int a[5][5],*p=*a;
	int i;
	for(i=1;i<=25;i++)
	{
		*p++=i;
	}
	function(a);
	p=*a-1;
	while(++p-*a<25)
	{
		printf("%5d",*p);
		if((p+1-*a)%5==0) printf("\n");
	}
}*/
/*void function(int a[][5])
{
 int *p=*a;
 int i,j,t1=0,t2;
 for(i=0;i<25;i++)
    if(*(p+i)>*(p+t1))  t1=i;
    t2=*(p+12); *(p+12)=*(p+t1); *(p+t1)=t2;
}*/
