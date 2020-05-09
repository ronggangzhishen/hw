#include <stdio.h>
struct stu{
	int num;
	char name[20];
};
void main()
{
	FILE *p;
	p=fopen("stud_dat","rb+");
	struct stu s1[10]={{12,asdf},{13,ghjkl}};,s2[10]="\0";
	int i;
	for(i=0;i<10;i++)
	fwrite(s1+i,sizeof(struct stu),1,p);
	rewind(p);
	for(i=0;i<10;i++)
	fread(s2+i,1,1,p);
	printf("%s\n",s2);
	fclose(p);
}
/* 2
{
	FILE *p1,*p2,*p3,*p4;
	char t1,s1[255]="\0";
	int a[27]={0},b=0,c=0,i=0,others=0;
	p1=fopen("11.txt","r");
	fscanf(p1,"%s",s1);
	fclose(p1);
	printf("\n%s\n",s1);
	while(s1[i])
	{
		switch(s1[i++])
		{
			case 'a':a[1]+=1;break;
			case 'b':a[2]+=1;break;
			case 'c':a[3]+=1;break;
			default:others+=1;
		}
	}
	printf("%d\n",others);
	i=0;
	for(t1=97;t1<100;t1+=1)
	printf("%c=%d\n",t1,a[++i]);
	
}*/
/*
while(!feof(p1))
	{
		t1=fgetc(p1);
		fputc(t1,p3);
	}
*/
