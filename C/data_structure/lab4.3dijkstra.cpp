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

int arccost(algraph G,int k,int j){          //��k ����j �ı�Ȩֵ���������򷵻�0
    arcnode *p;
      /*if(j<k)     //��ͼ�Ż���û��
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
    int l[G.vexnum+1];                  // ���±����̳���
    int link[G.vexnum+1];               //�ɵ�
    int i,v,w,minl,tcost;
    arcnode *p;

    for(i=1;i<=G.vexnum;i++) l[i]=-1;     //��ʼ������
    for(i=1;i<=G.vexnum;i++) link[i]=0;   //��ʼ�����ɵ�
    for(p=G.vertices[startpoint].firstarc; p; p=p->nextarc)//�ڶ���ʼ��
    {
        v=p->adjvex;
        l[v]=p->weight;
    }
    l[startpoint]=0;                //���Լ�Ϊ0
    link[startpoint]=1;             //����U

    for(i=2;i<=G.vexnum;i++)            //ִ��n-1�Σ���ʣ��n-1��������U(�ҵ��յ���˳�)
    {

        //for(w=1;w<=G.vexnum;w++) printf("%d ",l[w]);

        for(w=1; w<=G.vexnum; w++)                  //�ҵ�һ��U���ڶ�
        {
            if(!link[w]&&l[w]>0)
            {
                v=w;
                minl=l[w];
                break;
            }
        }
        for( ; w<=G.vexnum; w++)             //����С
        {
            if(!link[w]&&l[w]>0&&l[w]<minl)
            {
                v=w;
                minl=l[w];
            }
        }
        link[v]=1;                          //v��С������U
        //printf("v=%d l[v]=%d\n",v,l[v]);
        if(link[endpoint]==1){printf("%d\n",l[endpoint]); break;}

        for(p=G.vertices[v].firstarc; p; p=p->nextarc)//����l[]
        {
            w=p->adjvex;
            tcost=p->weight;
            if(!link[w])
                if(minl+tcost<l[w] || l[w]<0)//����
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
