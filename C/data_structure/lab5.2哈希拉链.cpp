#include<stdio.h>
#include<stdlib.h>
typedef struct node{
    int ele;
    struct node* next;
}node,*ptrnode,**pptrnode;
typedef struct{
    ptrnode *elem;      //开空间的首地址
    int cou;
    int sizeindex;
}hashtable;
void inserthash(hashtable &H,int e,ptrnode sucl[],int fail[])
{
    ptrnode p,q,prep,preq;
    int t=e%H.sizeindex;
    int mov=0;

      //printf("%3d",t);
    if(H.elem[t] == NULL)               //还为NULL
    {
    H.elem[t]=(ptrnode)malloc(sizeof(node));
    sucl[t]=(ptrnode)malloc(sizeof(node));
    H.elem[t]->ele=e;
      //printf("%5d",H.elem[t]->ele);
    H.elem[t]->next=NULL;
    sucl[t]->ele=mov+1;
      //printf("%3d\n",sucl[t]->ele);
    sucl[t]->next=NULL;
    fail[t]=sucl[t]->ele+1;
    }
    else                        //不为NULL就拉到NULL
    {
    for(p=H.elem[t],q=sucl[t]; p!=NULL; prep=p,preq=q,p=p->next,q=q->next) mov++;  //hash()并求出该处表长,p,q同步
      //printf("  mov=%d",mov);
    p=(ptrnode)malloc(sizeof(node));
    q=(ptrnode)malloc(sizeof(node));
    p->ele=e;
      //printf("%5d",p->ele);
    p->next=NULL;
    prep->next=p;
    q->ele=mov+1;
      //printf("%3d\n",q->ele);
    q->next=NULL;
    preq->next=q;
    fail[t]=q->ele+1;
    }
}
void printhash(hashtable H,ptrnode sucl[],int fail[])//
{
    int i,suns=0,sunf=0;
    ptrnode p;

    printf("地址 表中的关键字：\n");
    for(i=0;i<H.sizeindex;i++){
        printf("%2d",i);
        if(H.elem[i]!=NULL)
            for(p=H.elem[i];p!=NULL;p=p->next) printf("%5d",p->ele);
        else printf("    -");
        printf("\n");
    }
    printf("地址 成功查找次数：\n");
    for(i=0;i<H.sizeindex;i++){
        printf("%2d",i);
        if(sucl[i]!=NULL)
            for(p=sucl[i];p!=NULL;p=p->next) {
                printf("%5d",p->ele);
                suns+=p->ele;
            }
        else printf("    0");
        printf("\n");
    }

    printf("哈希表的地址：");
    for(i=0;i<H.sizeindex;i++)
        printf("%5d",i);
    printf("\n");
    printf("失败查找次数：");
    for(i=0;i<H.sizeindex;i++){
        printf("%5d",fail[i]);
        sunf+=fail[i];
    }
    printf("\n");
    printf("查找成功时的平均查找长度：%.2f\n",(float)suns/H.cou);
    printf("查找失败时的平均查找长度：%.2f\n",(float)sunf/H.sizeindex);
}
int main()
{
    int i,j;
    hashtable H;
    FILE *fin=fopen("in2.txt","r");

    fscanf(fin,"%d",&H.cou);                      //关键字个数
      //printf("%d\n",H.cou);
    int element[H.cou];                     //关键字暂存数组
    for(i=0;i<H.cou;i++)
        fscanf(fin,"%d",&element[i]);
    fscanf(fin,"%d",&H.sizeindex);                //最大容量
    H.elem=(ptrnode*)malloc(H.sizeindex*sizeof(ptrnode));

    for(i=0;i<H.sizeindex;i++)          //赋初值
        H.elem[i]=NULL;
    ptrnode sucl[H.sizeindex];                 //成功查找长度
    int fail[H.sizeindex];                  //失败查找长度
    for(i=0;i<H.sizeindex;i++){          //赋初值,sucl为0者不参与成功查找运算
        fail[i]=1;
        sucl[i]=NULL;
    }

    for(i=0;i<H.cou;i++){
        inserthash(H,element[i],sucl,fail);
    }

    printhash(H,sucl,fail);

    free(H.elem);
    fclose(fin);
}
