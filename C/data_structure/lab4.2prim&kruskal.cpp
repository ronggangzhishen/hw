#include<stdio.h>
#include<stdlib.h>
#define MAX_VERTEX_NUM 10000               //V<30 E<300
typedef struct arcnode{
    int adjvex;
    struct arcnode *nextarc;
    int weight;                   //weightΪ��Ȩֵ
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
typedef struct oneclosedge{
    int adjvex;
    int lowcost;
}closedge[MAX_VERTEX_NUM+1];        //throw num0�������U��ʣ�ඥ����̱�Ȩֵ
typedef struct enode{               //�߽ڵ㣬headҪ��rearС��kruskal��
    int head;
    int rear;
    int weight;
}enode;
void insertarc(algraph &G,int va,int vb,int weight){//����ͼ���ؼ���arc
    arcnode *p,*q;
    if(G.vertices[va].firstarc == NULL) //0�ζ�
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[va].firstarc=p;
        p->adjvex=vb;
        p->weight=weight;
        p->nextarc=NULL;
    }
    else                                //�������ñ�,�������
    {
        for(p=G.vertices[va].firstarc,q=p; p&&p->adjvex<vb; p=p->nextarc) q=p;//��Ϊ���رߣ�����q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,ͷ��
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=vb;
            q->weight=weight;
            G.vertices[va].firstarc=q;
            q->nextarc=p;
        }
        else                        //�ҵ����в��β��
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=vb;
            p->weight=weight;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
    if(G.vertices[vb].firstarc == NULL) //��vbͬ��������0�ζ�
    {
        p=(arcnode*)malloc(sizeof(arcnode));
        G.vertices[vb].firstarc=p;
        p->adjvex=va;
        p->weight=weight;
        p->nextarc=NULL;
    }
    else                                //�������ñߣ��������
    {
        for(p=G.vertices[vb].firstarc,q=p; p&&p->adjvex<va; p=p->nextarc) q=p;//��Ϊ���رߣ�����q<vb<p
        if(q==p)                    //vb<forstarc.adjvex,ͷ��
        {
            q=(arcnode*)malloc(sizeof(arcnode));
            q->adjvex=va;
            q->weight=weight;
            G.vertices[vb].firstarc=q;
            q->nextarc=p;
        }
        else                        //�ҵ����в��β��
        {
            p=(arcnode*)malloc(sizeof(arcnode));
            p->adjvex=va;
            p->weight=weight;
            p->nextarc=q->nextarc;
            q->nextarc=p;
        }
    }
}
int minimum(algraph G,closedge clo){  //�ҳ�clo��Ȩֵ��С��������V-U�еĸö�
    int i,mincost,minnum;
    for(i=2;i<=G.vexnum;i++)        //��ʼ��mincost���ҵ���һ����U�е�ı�
    {
        if(clo[i].lowcost>0)
        {
            minnum=i;
            mincost=clo[i].lowcost;
            //printf("%d %d\n",i,mincost);
            break;
        }
    }
    for( ++i;i<=G.vexnum;i++)          //�Ӹõ�������С���±�
    {
        if(clo[i].lowcost>0 && clo[i].lowcost<mincost)            //����U��
        {
            minnum=i;
            mincost=clo[i].lowcost;
            //printf("%d  ",minnum);
        }
    }
    //printf("\n");
    return minnum;
}
int arccost(algraph G,int k,int j){          //��k ����j �ı�Ȩֵ���������򷵻�0
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
void minispantree_prim(algraph G){          //Ĭ�ϴӵ�һ������ʼ
    int minlength=0;
    int i,j,k,w,tcost;
    closedge clo;
    arcnode *p=G.vertices[1].firstarc;
    for(i=2;i<=G.vexnum;i++)                //��ʼ��
    {
        p=G.vertices[i].firstarc;
        if(p->adjvex == 1)                  //���ڶ�
        {
            clo[i].adjvex=1;
            clo[i].lowcost=p->weight;
        }
        else                                //�����ڶ�,0��ʾ���ڣ�-1��ʾ�����
        {
            clo[i].adjvex=0;
            clo[i].lowcost=-1;
        }
    }
    clo[1].lowcost=0;                       //����U


    for(i=2;i<=G.vexnum;i++)                //ѡ������V-1����������V-1��
    {
        /*for(m=1;m<=G.vexnum;m++){
            printf("%d ",clo[m].lowcost);
        }   printf("\n");
        */

        k=minimum(G,clo);                   //kΪU�ж��ڶ���Ȩֵ��С���±�
        //printf("%d  ",k);
        minlength+=clo[k].lowcost;      //·�̳�����
        clo[k].lowcost=0;               //����U

        for(p=G.vertices[k].firstarc; p; p=p->nextarc)//ֻ��k���ڶ����и��²���
        {
            w=p->adjvex;
            if(clo[w].lowcost!=0)         //ֻ���±겻��U�еĽ��в���
            {

                tcost=arccost(G,k,w);
                if( (tcost && tcost<clo[w].lowcost) || (tcost && clo[w].lowcost<0))
                    //w��k�����ұ�Ȩֵ��С��U��j����ͨʱ����
                {
                    clo[w].adjvex=k;
                    clo[w].lowcost=tcost;
                }
            }
        }

         /*for(j=2;j<=G.vexnum;j++)        //����һ���������clo
        {

            if(clo[j].lowcost!=0)         //ֻ���±겻��U�еĽ��в���
            {
                tcost=arccost(G,k,j);
                //printf(" %d",tcost);
                if( (tcost && tcost<clo[j].lowcost) || (tcost && clo[j].lowcost<0))//j��k�����ұ�Ȩֵ��С��U��j����ͨʱ����
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
    enode edge[G.arcmun+1];         //������
    for(i=2;i<=G.vexnum;i++)        //�ӵڶ�������ʼ�ұߣ�head<rear
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
    //��ʼ��tree����tree[i]Ϊ�����ڵ��������������ж�����Ȧ
    for(i=1;i<=G.vexnum;i++) tree[i]=i;

    mincost=edge[1].weight; //��ֵ
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
                //��ֵ��ѡ��ı߲���ͬһ������
            {
                mincost=edge[j].weight;
                head=edge[j].head;
                head=edge[j].rear;
            }
        }
        for( ;j<=G.arcmun;j++)
        {
            if(tree[edge[j].head] != tree[edge[j].rear] && edge[j].weight<mincost)
                //ѡ��ı߿��Ը�С
            {
                mincost=edge[j].weight;
                head=edge[j].head;
                head=edge[j].rear;
            }
        }
        minilength+=mincost;
        //ÿѡһ����С�ߣ�����������¼//n-2�κ�����tree[i]=1
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
    for(i=1;i<=V;i++) G.vertices[i].firstarc=NULL;  //��ʼ��null
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
