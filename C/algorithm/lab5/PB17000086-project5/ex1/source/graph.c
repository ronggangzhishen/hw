#include<stdio.h>
#include<stdlib.h>
#define MAX_VERTEX_NUM 729


typedef struct arcnode{
    int adjvex;
    struct arcnode *nextarc;
    //int weight;                   //weight=1
}arcnode;
typedef struct vnode{
    //int num;                      //顶不需要编号,下标足以
    arcnode *firstarc;
    int d,f;
}vnode,adjlist[MAX_VERTEX_NUM+1];   //0号弃置不用
typedef struct{
    adjlist vertices;
    int vexnum,arcmun;
    //int kind                      //都是无向图
}graph;
int color[MAX_VERTEX_NUM+1]={0};
int time;

///for strongly connected components
int fin[MAX_VERTEX_NUM+1]={0},*pfin=fin;
//int visited[MAX_VERTEX_NUM+1]={0},pvis=visited;

void dfs_visit(graph* g,int u){
    //printf("%d\n",u);
    time++;
    g->vertices[u].d=time;
    color[u]=1;
    arcnode *p;
    for(p=g->vertices[u].firstarc;p;p=p->nextarc){
        if(!color[p->adjvex])
            dfs_visit(g,p->adjvex);
    }
    color[u]=2;
    time++;
    g->vertices[u].f=time;
    ///record fin order
    *pfin++=u;
}

void dfs(graph *g){
    int i;
    for(i=1;i<=g->vexnum;i++){
        color[i]=0;
    }
    time=0;
    pfin=fin;
    for(i=1;i<=g->vexnum;i++){
        if(!color[i])
            dfs_visit(g,i);
    }
}



void insertarc(graph *G,int va,int vb){//有向图，加1arc
    arcnode *p,*q;
    if(G->vertices[va].firstarc == NULL) //0次顶
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G->vertices[va].firstarc=p;
        p->adjvex=vb;
        p->nextarc=NULL;
    }
    else                                //排序插入该边，方便遍历
    {
        for(p=G->vertices[va].firstarc,q=p; p&&p->adjvex<vb; p=p->nextarc) q=p;//认为无重边，移至q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,头插
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=vb;
            G->vertices[va].firstarc=q;
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

}

void destroygraph(graph *g){
    int i;
    arcnode *p,*q;
    for(i=1;i<=g->vexnum;i++)       //free
    {
        p=g->vertices[i].firstarc;
        while(p)
        {
            q=p;
            p=p->nextarc;
            free(q);
        }
    }
    free(g);
}

void printgraph(graph *g){
    int i;
    arcnode *p;
    for(i=1;i<=g->vexnum;i++){
        printf("%d -> ",i);
        p=g->vertices[i].firstarc;
        while(p){
            printf("%d,",p->adjvex);
            p=p->nextarc;
        }
        printf("\n");
    }
}
