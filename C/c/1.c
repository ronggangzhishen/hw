#include<stdio.h>
#include<stdlib.h>
struct stu{
	int num;
	char name[16];
	char sex;
	int age;
	double grade;
	struct stu *next;
};
void get(struct stu *p)
{
	scanf("%s %c %lf",p->name,&p->sex,&p->grade);
	printf("succeed\n");
}
void put(struct stu *p)
{
	printf("%10d %20s %10c %10.lf\n",p->num,p->name,p->sex,p->grade);
}
struct stu *create(void)    //head
{
	struct stu *head,*p;
	int num;
	head=NULL;
	scanf("%d",&num);
	while(num!=0)
	{
		p=(struct stu *)malloc(sizeof(struct stu));
		p->num=num;
		get(p);
		p->next=head;
		head=p;
		scanf("%d",&num);
	}
	return head;
}
void print(struct stu *head)
{
    struct stu *p=head;
	while(p!=NULL)
    {
        put(p);
        p=p->next;
    }
}
void cutoff(struct stu **phead)
{
    struct stu *p,*q;
    while((*phead)->num==101)
    {
        q=*phead;
        *phead=q->next;
        free(q);
    }
    p=q=*phead;
	while(p->next!=NULL)
    {
        q=p;
        if((p->next)->num==101)
        {
            q=p->next;
            p->next=q->next;
            free(q);
        }
        else p=p->next;
    }
}
void main()
{
    struct stu *pt,**ppt=&pt;
    pt=create();
    print(pt);
    printf("\n\n");
    cutoff(ppt);
    print(pt);
}
