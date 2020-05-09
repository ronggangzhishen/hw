#include<stdio.h>
#include<stdlib.h>
#define MAX_VERTEX_NUM 10000               //V<30 E<300
typedef struct arcnode{
    int adjvex;
    struct arcnode *nextarc;
    int weight;                   //weight为边权值
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

void insertarc(algraph &G,int va,int vb,int weight){//无向图，必加两arc
    arcnode *p,*q;
    if(G.vertices[va].firstarc == NULL) //0次顶
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[va].firstarc=p;
        p->adjvex=vb;
        p->weight=weight;
        p->nextarc=NULL;
    }
    else                                //排序插入该边,方便遍历
    {
        for(p=G.vertices[va].firstarc,q=p; p&&p->adjvex<vb; p=p->nextarc) q=p;//认为无重边，移至q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,头插
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=vb;
            q->weight=weight;
            G.vertices[va].firstarc=q;
            q->nextarc=p;
        }
        else                        //找到，中插或尾插
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=vb;
            p->weight=weight;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
    if(G.vertices[vb].firstarc == NULL) //对vb同样操作，0次顶
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[vb].firstarc=p;
        p->adjvex=va;
        p->weight=weight;
        p->nextarc=NULL;
    }
    else                                //排序插入该边，方便遍历
    {
        for(p=G.vertices[vb].firstarc,q=p; p&&p->adjvex<va; p=p->nextarc) q=p;//认为无重边，移至q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,头插
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=va;
            q->weight=weight;
            G.vertices[vb].firstarc=q;
            q->nextarc=p;
        }
        else                        //找到，中插或尾插
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=va;
            p->weight=weight;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
}

int arccost(algraph G,int k,int j){          //求顶k 到顶j 的边权值，不相邻则返回0
    arcnode *p;
      /*if(j<k)     //试图优化，没用
    for(p=G.vertices[k].firstarc; p; p=p->nextarc)
    {
        if(p->adjvex == j)
            return p->weight;
        else if(p->adjvex>j)
            return 0;
    }
    else */
    for(p=G.vertices[k].firstarc; p; p=p->nextarc)
    {
        if(p->adjvex == j)
            return p->weight;
        //else if(p->adjvex>j)
          //  return 0;
    }
    return 0;
}
void shortestpath_dijkstra(algraph G,int startpoint,int endpoint){
    int l[G.vexnum+1];                  // 到下标的最短长度
    int link[G.vexnum+1];               //可到
    int i,v,w,minl,tcost;
    arcnode *p;

    for(i=1;i<=G.vexnum;i++) l[i]=-1;     //初始化无穷
    for(i=1;i<=G.vexnum;i++) link[i]=0;   //初始化不可到
    for(p=G.vertices[startpoint].firstarc; p; p=p->nextarc)//邻顶初始化
    {
        v=p->adjvex;
        l[v]=p->weight;
    }
    l[startpoint]=0;                //到自己为0
    link[startpoint]=1;             //并入U

    for(i=2;i<=G.vexnum;i++)            //执行n-1次，将剩余n-1个顶并入U(找到终点就退出)
    {

        //for(w=1;w<=G.vexnum;w++) printf("%d ",l[w]);

        for(w=1; w<=G.vexnum; w++)                  //找第一个U的邻顶
        {
            if(!link[w]&&l[w]>0)
            {
                v=w;
                minl=l[w];
                break;
            }
        }
        for( ; w<=G.vexnum; w++)             //找最小
        {
            if(!link[w]&&l[w]>0&&l[w]<minl)
            {
                v=w;
                minl=l[w];
            }
        }
        link[v]=1;                          //v最小，并入U
        //printf("v=%d l[v]=%d\n",v,l[v]);
        if(link[endpoint]==1){printf("%d\n",l[endpoint]); break;}

        for(p=G.vertices[v].firstarc; p; p=p->nextarc)//更新l[]
        {
            w=p->adjvex;
            tcost=p->weight;
            if(!link[w])
                if(minl+tcost<l[w] || l[w]<0)//更短
                    l[w]=minl+tcost;
        }
    }
}


int main()
{
    algraph G;
    int V,E;
    int va,vb,weight;
    int startpoint,endpoint;
    int i;
    arcnode *p,*q;
    FILE* fin=fopen("in9.txt","r");
    //FILE* fout=fopen("out.txt","w");

    fscanf(fin,"%d %d",&V,&E);
    G.arcmun=E; G.vexnum=V;
      printf("%d vex  %d arc\n",G.vexnum,G.arcmun);
    for(i=1;i<=V;i++) G.vertices[i].firstarc=NULL;  //初始化null
    for(i=1;i<=E;i++)
    {
        fscanf(fin,"%d %d %d",&va,&vb,&weight);
          //printf(" %d %d\n",va,vb);
        insertarc(G,va,vb,weight);
    }
    /*for(i=1;i<=V;i++)                               //print graph
    {
        printf(" %d ",i);
        p=G.vertices[i].firstarc;
        for( ; p; p=p->nextarc) printf(" %d,%d ",p->adjvex,p->weight);
        printf("\n");
    }*/
    fscanf(fin,"%d %d",&startpoint,&endpoint);
    printf("%d start  %d end\n",startpoint,endpoint);
    shortestpath_dijkstra(G,startpoint,endpoint);




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
}
