#include<stdio.h>
#include<math.h>
#include<string.h>
void copy(char a[],char b[],int m)
{
    char *pa=a+m-1,*pb=b;
    while(*pb++=*pa++) ;
}
void connect(char a[],char b[])
{
    char *pa=a,*pb=b;
    while(*++pa) ;
    while(*pa++=*pb++) ;
}
int strcmp2(char a[],char b[])
{
    char *pa=a,*pb=b;
    while(*pa++==*pb++) if(*pa=='\0') break;
    return *(pa-1)-*(pb-1);
}
main()
{

}
