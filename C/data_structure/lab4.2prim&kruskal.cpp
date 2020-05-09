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
typedef struct oneclosedge{
    int adjvex;
    int lowcost;
}closedge[MAX_VERTEX_NUM+1];        //throw num0，代表从U到剩余顶的最短边权值
typedef struct enode{               //边节点，head要比rear小，kruskal用
    int head;
    int rear;
    int weight;
}enode;
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
int minimum(algraph G,closedge clo){  //找出clo中权值最小，并返回V-U中的该顶
    int i,mincost,minnum;
    for(i=2;i<=G.vexnum;i++)        //初始化mincost，找到第一个非U中点的边
    {
        if(clo[i].lowcost>0)
        {
            minnum=i;
            mincost=clo[i].lowcost;
            //printf("%d %d\n",i,mincost);
            break;
        }
    }
    for( ++i;i<=G.vexnum;i++)          //从该点起，找最小项下标
    {
        if(clo[i].lowcost>0 && clo[i].lowcost<mincost)            //不在U内
        {
            minnum=i;
            mincost=clo[i].lowcost;
            //printf("%d  ",minnum);
        }
    }
    //printf("\n");
    return minnum;
}
int arccost(algraph G,int k,int j){          //求顶k 到顶j 的边权值，不相邻则返回0
    arcnode *p;
    for(p=G.vertices[k].firstarc; p; p=p->nextarc)
    {
        if(p->adjvex == j)
            return p->weight;
        //else if(p->adjvex>j)
          //  return 0;
    }
    return 0;
}
void minispantree_prim(algraph G){          //默认从第一个顶开始
    int minlength=0;
    int i,j,k,w,tcost;
    closedge clo;
    arcnode *p=G.vertices[1].firstarc;
    for(i=2;i<=G.vexnum;i++)                //初始化
    {
        p=G.vertices[i].firstarc;
        if(p->adjvex == 1)                  //是邻顶
        {
            clo[i].adjvex=1;
            clo[i].lowcost=p->weight;
        }
        else                                //不是邻顶,0表示非邻，-1表示无穷大
        {
            clo[i].adjvex=0;
            clo[i].lowcost=-1;
        }
    }
    clo[1].lowcost=0;                       //并入U


    for(i=2;i<=G.vexnum;i++)                //选择其余V-1个顶，进行V-1次
    {
        /*for(m=1;m<=G.vexnum;m++){
            printf("%d ",clo[m].lowcost);
        }   printf("\n");
        */

        k=minimum(G,clo);                   //k为U中顶邻顶边权值最小项下标
        //printf("%d  ",k);
        minlength+=clo[k].lowcost;      //路程长度增
        clo[k].lowcost=0;               //并入U

        for(p=G.vertices[k].firstarc; p; p=p->nextarc)//只对k的邻顶进行更新操作
        {
            w=p->adjvex;
            if(clo[w].lowcost!=0)         //只对下标不在U中的进行操作
            {

                tcost=arccost(G,k,w);
                if( (tcost && tcost<clo[w].lowcost) || (tcost && clo[w].lowcost<0))
                    //w与k相邻且边权值更小或U与j不连通时更新
                {
                    clo[w].adjvex=k;
                    clo[w].lowcost=tcost;
                }
            }
        }

         /*for(j=2;j<=G.vexnum;j++)        //并入一个顶后更新clo
        {

            if(clo[j].lowcost!=0)         //只对下标不在U中的进行操作
            {
                tcost=arccost(G,k,j);
                //printf(" %d",tcost);
                if( (tcost && tcost<clo[j].lowcost) || (tcost && clo[j].lowcost<0))//j与k相邻且边权值更小或U与j不连通时更新
                {
                    clo[j].adjvex=k;
                    clo[j].lowcost=tcost;
                }
            }
        }
        //printf("\n\n");
        */
    }

    printf("%d\n",minlength);
}
void minispantree_kruskal(algraph G){
    int i,j=0,k,head,rear,mincost;
    arcnode *p;
    int tree[G.vexnum+1];
    int minilength;
    enode edge[G.arcmun+1];         //边数组
    for(i=2;i<=G.vexnum;i++)        //从第二个顶开始找边，head<rear
    {
        p=G.vertices[i].firstarc;
        while(p->adjvex<i)
        {
            j++;
            edge[j].head=p->adjvex;
            edge[j].rear=i;
            edge[j].weight=p->weight;
            p=p->nextarc;
        }
    }//j=G.arcnum
    //初始化tree，设tree[i]为顶所在的生成树，用来判断有无圈
    for(i=1;i<=G.vexnum;i++) tree[i]=i;

    mincost=edge[1].weight; //初值
    head=edge[1].head;
    rear=edge[1].rear;
    for(i=2;i<=G.arcmun;i++){       //first minedge
        if(edge[i].weight<mincost){
            mincost=edge[i].weight;
            head=edge[i].head;
            rear=edge[i].rear;
        }
    }
    minilength+=mincost;
    tree[rear]=tree[head];
    for(i=2;i<=G.vexnum-1;i++)      //next n-2 minedge
    {
        for(j=1;j<=G.arcmun;j++)
        {
            if(tree[edge[j].head] != tree[edge[j].rear])
                //初值，选择的边不在同一颗树中
            {
                mincost=edge[j].weight;
                head=edge[j].head;
                head=edge[j].rear;
            }
        }
        for( ;j<=G.arcmun;j++)
        {
            if(tree[edge[j].head] != tree[edge[j].rear] && edge[j].weight<mincost)
                //选择的边可以更小
            {
                mincost=edge[j].weight;
                head=edge[j].head;
                head=edge[j].rear;
            }
        }
        minilength+=mincost;
        //每选一条最小边，改生成树记录//n-2次后，所以tree[i]=1
        for(k=1;k<=G.vexnum;k++)
            if(tree[k]==tree[rear]) tree[k]=tree[head];
    }
    printf("%d\n",minilength);
}


int main()
{
    algraph G;
    int V,E;
    int va,vb,weight;
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

    minispantree_prim(G);


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
    //fclose(fout);
}
