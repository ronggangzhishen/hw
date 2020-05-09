#include<stdio.h>
#include<stdlib.h>

typedef struct{
    int *elem;      //���ռ���׵�ַ
    int cou;
    int sizeindex;
}hashtable;

 /*int mhash(hashtable H,int e,int p)                  //���ַ��������̽������ͻ,d=1
{
    int t;
    for(t=e%p; H.elem[t]!=NULL; t=(t+1)%p) ;
    return t;
}*/
void inserthash(hashtable &H,int e,int sucl[])     //eΪ����Ĺؼ���,����ʱ�Ϳ��Ե�֪���ҳɹ��ĳ���
{
    int t,mov=0;
    for(t=e%H.sizeindex; sucl[t]!=0; t=(t+1)%H.sizeindex) mov++;  //hash()�����ƫ����

    H.elem[t]=e;
    sucl[t]=mov+1;                  //����ƫ������
}
void printhash(hashtable H,int sucl[],int fail[])//
{
    int i,suns=0,sunf=0;
    printf("��ϣ��ĵ�ַ��");
    for(i=0;i<H.sizeindex;i++)
        printf("%5d",i);
    printf("\n");
    printf("���еĹؼ��֣�");
    for(i=0;i<H.sizeindex;i++)
        if(H.elem[i]!=0)
            printf("%5d",H.elem[i]);
        else
            printf("    -");
    printf("\n");
    printf("�ɹ����Ҵ�����");
    for(i=0;i<H.sizeindex;i++){
        printf("%5d",sucl[i]);
        if(sucl[i]>0) suns+=sucl[i];
    }
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
    H.elem=(int*)malloc(H.sizeindex*sizeof(int));
    for(i=0;i<H.sizeindex;i++)          //����ֵ
        H.elem[i]=0;
    int sucl[H.sizeindex];                  //�ɹ����ҳ���
    int fail[H.sizeindex];                  //ʧ�ܲ��ҳ���
    for(i=0;i<H.sizeindex;i++){          //����ֵ,suclΪ0�߲�����ɹ���������
        fail[i]=1;
        sucl[i]=0;
    }
    for(i=0;i<H.cou;i++)
        inserthash(H,element[i],sucl);
    for(i=0;i<H.sizeindex;i++){
        for(j=i; (sucl[j%H.sizeindex])!=0; j++,fail[i]++);
    }
    printhash(H,sucl,fail);

    free(H.elem);
    fclose(fin);
}
