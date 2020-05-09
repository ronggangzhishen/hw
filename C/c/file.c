#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
void main()
{
FILE *p;
p=fopen("text.txt","r+");
int i=3,j,k,n,m,count=1;
fprintf(p,"%d\t%d\n",i,count);
for(i=5;i<1000000;i+=2)
 {
  k=sqrt(i);
  for(j=2;j<=k;j++)
    if(i%j==0)
     break;
    if(j>k)
    {
     count++;
     printf("%d\t%d\n",i,count);
     fprintf(p,"%d\t%d\n",i,count);
    }
 }
 fclose(p);
}
/*{
    FILE *p;
    p=fopen("text.txt","r+");
    char c;
    while(!feof(p))
    {
        c=fgetc(p);
        fseek(p,-1,SEEK_CUR);
        if(c>='0'&&c<='9')
        {
            switch(c)
            {
               case '1':c='5';break;
               case '2':c='0';break;
            }
        }
        if(c>='a'&&c<='z')
        {
            c-=1;
            if(c=='z'+1) c='a';
            if(c=='a'-1)  c='z';
        }
        fputc(c,p);
        fseek(p,0,SEEK_CUR);
    }
}*/
