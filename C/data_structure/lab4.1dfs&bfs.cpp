#include<stdio.h>
#include<stdlib.h>
#define MAX_VERTEX_NUM 30               //V<30 E<300
typedef struct arcnode{
    int adjvex;
    struct arcnode *nextarc;
    //int weight;                   //weight=1
}arcnode;
typedef struct vnode{
    //int num;                      //������Ҫ���,�±�����
    arcnode *firstarc;
}vnode,adjlist[MAX_VERTEX_NUM+1];   //0�����ò���
typedef struct{
    adjlist vertices;
    int vexnum,arcmun;
    //int kind                      //��������ͼ
}algraph;
typedef int *pint;
int visited[MAX_VERTEX_NUM+1]={0};  //��ʼ��0

void insertarc(algraph &G,int va,int vb){//����ͼ���ؼ���arc
    arcnode *p,*q;
    if(G.vertices[va].firstarc == NULL) //0�ζ�
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[va].firstarc=p;
        p->adjvex=vb;
        p->nextarc=NULL;
    }
    else                                //�������ñߣ��������
    {
        for(p=G.vertices[va].firstarc,q=p; p&&p->adjvex<vb; p=p->nextarc) q=p;//��Ϊ���رߣ�����q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,ͷ��
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=vb;
            G.vertices[va].firstarc=q;
            q->nextarc=p;
        }
        else                        //�ҵ����в��β��
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=vb;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
    if(G.vertices[vb].firstarc == NULL) //��vbͬ��������0�ζ�
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[vb].firstarc=p;
        p->adjvex=va;
        p->nextarc=NULL;
    }
    else                                //�������ñߣ��������
    {
        for(p=G.vertices[vb].firstarc,q=p; p&&p->adjvex<va; p=p->nextarc) q=p;//��Ϊ���رߣ�����q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,ͷ��
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=va;
            G.vertices[vb].firstarc=q;
            q->nextarc=p;
        }
        else                        //�ҵ����в��β��
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=va;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
}
void DFS(algraph G,int v){              //�Ӷ�v��ʼ,��
    visited[v]=1;
    printf(" %d ",v);
    int w;
    arcnode *p;
    for(p=G.vertices[v].firstarc; p; p=p->nextarc)
    {
        w=p->adjvex;
        if(!visited[w])
            DFS(G,w);
    }
}
void BFS(algraph G,int intqueue[],pint &head,pint &rear){              //�Ӷ�v��ʼ����
    int v,w;
    arcnode *p;

    while(rear != head)                                         //�ǿ�ʱ����һ����˳����ڶ�
    {
        v=*head;
        head++;
        for(p=G.vertices[v].firstarc; p; p=p->nextarc)
        {
            w=p->adjvex;
            if(!visited[w])
            {
                visited[w]=1;
                printf(" %d ",w);
                *rear=w;
                rear++;
            }
        }
    }
}


int main()
{
    algraph G;
    int V,E,S;
    int va,vb;
    int i,j,k;
    arcnode *p,*q;
    FILE* fin=fopen("in2.txt","r");
    FILE* fout=fopen("out.txt","w");

    fscanf(fin,"%d %d",&V,&E);
    G.arcmun=E; G.vexnum=V;
      //printf("%d vex  %d arc\n",G.vexnum,G.arcmun);
    for(i=1;i<=V;i++) G.vertices[i].firstarc=NULL;  //��ʼ��null
    for(i=1;i<=E;i++)
    {
        fscanf(fin,"%d %d",&va,&vb);
          //printf(" %d %d\n",va,vb);
        insertarc(G,va,vb);
    }
    /*for(i=1;i<=V;i++)                               //print graph
    {
        printf(" %d ",i);
        p=G.vertices[i].firstarc;
        for( ; p; p=p->nextarc) printf(" %d ",p->adjvex);
        printf("\n");
    }*/

    fscanf(fin,"%d",&S); printf("s=%d\n",S);

    for(i=1;i<=V;i++) visited[i]=0;
    DFS(G,S);
    printf("\n");

    int intqueue[V]={0};                    //ģ�����
    pint head=intqueue,rear=intqueue;
    for(i=1;i<=V;i++) visited[i]=0;

    *rear=S; rear++;                        //���г�ʼ��
    visited[S]=1; printf(" %d ",S);
    BFS(G,intqueue,head,rear);
    printf("\n");

    for(i=1;i<=V;i++)       //free
    {
        p=G.vertices[i].firstarc;
        while(p)
        {
            q=p;
            p=p->nextarc;
            free(q);
        }
    }
    fclose(fin);
    fclose(fout);
    /*
    scanf("%d %d",&V,&E);
    G.arcmun=E; G.vexnum=V;
    G.arcmun=E; G.vexnum=V;
    for(i=1;i<=V;i++) G.vertices[i].firstarc=NULL;  //��ʼ��null
    for(i=1;i<=E;i++)
    {
        scanf("%d %d",&va,&vb);
        insertarc(G,va,vb);
    }
    scanf("%d",S);
    DFS(G,S);
    BFS(G,S);*/
}
