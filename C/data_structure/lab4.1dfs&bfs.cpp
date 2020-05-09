#include<stdio.h>
#include<stdlib.h>
#define MAX_VERTEX_NUM 30               //V<30 E<300
typedef struct arcnode{
    int adjvex;
    struct arcnode *nextarc;
    //int weight;                   //weight=1
}arcnode;
typedef struct vnode{
    //int num;                      //顶不需要编号,下标足以
    arcnode *firstarc;
}vnode,adjlist[MAX_VERTEX_NUM+1];   //0号弃置不用
typedef struct{
    adjlist vertices;
    int vexnum,arcmun;
    //int kind                      //都是无向图
}algraph;
typedef int *pint;
int visited[MAX_VERTEX_NUM+1]={0};  //初始化0

void insertarc(algraph &G,int va,int vb){//无向图，必加两arc
    arcnode *p,*q;
    if(G.vertices[va].firstarc == NULL) //0次顶
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[va].firstarc=p;
        p->adjvex=vb;
        p->nextarc=NULL;
    }
    else                                //排序插入该边，方便遍历
    {
        for(p=G.vertices[va].firstarc,q=p; p&&p->adjvex<vb; p=p->nextarc) q=p;//认为无重边，移至q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,头插
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=vb;
            G.vertices[va].firstarc=q;
            q->nextarc=p;
        }
        else                        //找到，中插或尾插
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=vb;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
    if(G.vertices[vb].firstarc == NULL) //对vb同样操作，0次顶
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[vb].firstarc=p;
        p->adjvex=va;
        p->nextarc=NULL;
    }
    else                                //排序插入该边，方便遍历
    {
        for(p=G.vertices[vb].firstarc,q=p; p&&p->adjvex<va; p=p->nextarc) q=p;//认为无重边，移至q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,头插
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=va;
            G.vertices[vb].firstarc=q;
            q->nextarc=p;
        }
        else                        //找到，中插或尾插
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=va;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
}
void DFS(algraph G,int v){              //从顶v开始,深
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
void BFS(algraph G,int intqueue[],pint &head,pint &rear){              //从顶v开始，广
    int v,w;
    arcnode *p;

    while(rear != head)                                         //非空时，出一顶，顺序进邻顶
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
    for(i=1;i<=V;i++) G.vertices[i].firstarc=NULL;  //初始化null
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

    int intqueue[V]={0};                    //模拟队列
    pint head=intqueue,rear=intqueue;
    for(i=1;i<=V;i++) visited[i]=0;

    *rear=S; rear++;                        //队列初始化
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
    for(i=1;i<=V;i++) G.vertices[i].firstarc=NULL;  //初始化null
    for(i=1;i<=E;i++)
    {
        scanf("%d %d",&va,&vb);
        insertarc(G,va,vb);
    }
    scanf("%d",S);
    DFS(G,S);
    BFS(G,S);*/
}
