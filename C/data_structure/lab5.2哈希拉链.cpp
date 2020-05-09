#include<stdio.h>
#include<stdlib.h>
typedef struct node{
    int ele;
    struct node* next;
}node,*ptrnode,**pptrnode;
typedef struct{
    ptrnode *elem;      //���ռ���׵�ַ
    int cou;
    int sizeindex;
}hashtable;
void inserthash(hashtable &H,int e,ptrnode sucl[],int fail[])
{
    ptrnode p,q,prep,preq;
    int t=e%H.sizeindex;
    int mov=0;

      //printf("%3d",t);
    if(H.elem[t] == NULL)               //��ΪNULL
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
    else                        //��ΪNULL������NULL
    {
    for(p=H.elem[t],q=sucl[t]; p!=NULL; prep=p,preq=q,p=p->next,q=q->next) mov++;  //hash()������ô���,p,qͬ��
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

    printf("��ַ ���еĹؼ��֣�\n");
    for(i=0;i<H.sizeindex;i++){
        printf("%2d",i);
        if(H.elem[i]!=NULL)
            for(p=H.elem[i];p!=NULL;p=p->next) printf("%5d",p->ele);
        else printf("    -");
        printf("\n");
    }
    printf("��ַ �ɹ����Ҵ�����\n");
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

    printf("��ϣ��ĵ�ַ��");
    for(i=0;i<H.sizeindex;i++)
        printf("%5d",i);
    printf("\n");
    printf("ʧ�ܲ��Ҵ�����");
    for(i=0;i<H.sizeindex;i++){
        printf("%5d",fail[i]);
        sunf+=fail[i];
    }
    printf("\n");
    printf("���ҳɹ�ʱ��ƽ�����ҳ��ȣ�%.2f\n",(float)suns/H.cou);
    printf("����ʧ��ʱ��ƽ�����ҳ��ȣ�%.2f\n",(float)sunf/H.sizeindex);
}
int main()
{
    int i,j;
    hashtable H;
    FILE *fin=fopen("in2.txt","r");

    fscanf(fin,"%d",&H.cou);                      //�ؼ��ָ���
      //printf("%d\n",H.cou);
    int element[H.cou];                     //�ؼ����ݴ�����
    for(i=0;i<H.cou;i++)
        fscanf(fin,"%d",&element[i]);
    fscanf(fin,"%d",&H.sizeindex);                //�������
    H.elem=(ptrnode*)malloc(H.sizeindex*sizeof(ptrnode));

    for(i=0;i<H.sizeindex;i++)          //����ֵ
        H.elem[i]=NULL;
    ptrnode sucl[H.sizeindex];                 //�ɹ����ҳ���
    int fail[H.sizeindex];                  //ʧ�ܲ��ҳ���
    for(i=0;i<H.sizeindex;i++){          //����ֵ,suclΪ0�߲�����ɹ���������
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
