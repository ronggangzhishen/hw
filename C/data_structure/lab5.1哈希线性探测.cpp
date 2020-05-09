#include<stdio.h>
#include<stdlib.h>

typedef struct{
    int *elem;      //开空间的首地址
    int cou;
    int sizeindex;
}hashtable;

 /*int mhash(hashtable H,int e,int p)                  //求地址，用线性探测解决冲突,d=1
{
    int t;
    for(t=e%p; H.elem[t]!=NULL; t=(t+1)%p) ;
    return t;
}*/
void inserthash(hashtable &H,int e,int sucl[])     //e为插入的关键字,插入时就可以得知查找成功的长度
{
    int t,mov=0;
    for(t=e%H.sizeindex; sucl[t]!=0; t=(t+1)%H.sizeindex) mov++;  //hash()并求出偏移量

    H.elem[t]=e;
    sucl[t]=mov+1;                  //若有偏移量，
}
void printhash(hashtable H,int sucl[],int fail[])//
{
    int i,suns=0,sunf=0;
    printf("哈希表的地址：");
    for(i=0;i<H.sizeindex;i++)
        printf("%5d",i);
    printf("\n");
    printf("表中的关键字：");
    for(i=0;i<H.sizeindex;i++)
        if(H.elem[i]!=0)
            printf("%5d",H.elem[i]);
        else
            printf("    -");
    printf("\n");
    printf("成功查找次数：");
    for(i=0;i<H.sizeindex;i++){
        printf("%5d",sucl[i]);
        if(sucl[i]>0) suns+=sucl[i];
    }
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
    H.elem=(int*)malloc(H.sizeindex*sizeof(int));
    for(i=0;i<H.sizeindex;i++)          //赋初值
        H.elem[i]=0;
    int sucl[H.sizeindex];                  //成功查找长度
    int fail[H.sizeindex];                  //失败查找长度
    for(i=0;i<H.sizeindex;i++){          //赋初值,sucl为0者不参与成功查找运算
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
