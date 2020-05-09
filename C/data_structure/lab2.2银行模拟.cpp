#include<stdio.h>
#include<stdlib.h>

typedef struct qnode{
    int amount;
    int arrtime;
    int num;
    struct qnode* next;
}qnode, *qptr;
typedef struct{
    qptr head;
    qptr rear;
}linkqueue;
void initqueue(linkqueue &q)
{    q.head=q.rear=(qptr)malloc(sizeof(qnode));
    q.rear->next=NULL;
}
void destroyqueue(linkqueue &q)
{    while(q.head)
    {
        q.rear=q.head->next;
        free(q.head);
        q.head=q.rear;
    }
}
void enqueue(linkqueue &q,int a,int b,int i)
{    qptr p;
    p=(qptr)malloc(sizeof(qnode));
    p->amount=a;
    p->arrtime=b;
    p->num=i;
    p->next=NULL;
    q.rear->next=p;
    q.rear=p;
}
void dequeue(linkqueue &q,int &a,int &b,int &i)
{   qptr p;
    p=q.head->next;
    a=p->amount;
    b=p->arrtime;
    i=p->num;
    q.head->next=p->next;
    if(q.rear==p) q.rear=q.head;
    free(p);
}
int emptyp(linkqueue q)
{    if(q.head==q.rear)
        return 1;
    else
        return 0;
}
int main()
{
    FILE *pfile,*file2;
    pfile=fopen("in3.txt","r+");
    file2=fopen("out.txt","w");
    int N,total,close_time,wait_time;   //bank
    int a,b;                            //customer
    int i=1,j,m=0,tm,pretotal,totaltime=0,ta,tb,ti,time=0,t[1001];//tΪ��i���˵ĵȴ�ʱ��
    linkqueue q;
    qnode tp;
    initqueue(q);
    fscanf(pfile,"%d %d %d %d",&N,&total,&close_time,&wait_time);
    while(i<=N)
    {
        fscanf(pfile,"%d %d",&a,&b);
      if(time>=close_time)            //�°࣬������
            t[i]=close_time-b;
      else
      {
        if(a < 0)
        {
            if(total+a<0)               //�����У���
            {
                enqueue(q,a,b,i);
                m++;                    //��������
            }
            else                        //��ȡ������
            {
                total+=a;
                if(b>=time)             //ǰ��û��
                {
                    t[i]=0;
                    time=b+wait_time;
                }
                else                    //ǰ�����ˣ���
                {
                    t[i]=time-b;
                    time+=wait_time;
                }
            }
        }
        else                            //�棬����
        {
            pretotal=total;
            total+=a;
            if(b>=time)                 //û��
            {
                t[i]=0;
                time=b+wait_time;
            }
            else                        //��
            {
                t[i]=time-b;
                time+=wait_time;
            }
            if(!emptyp(q))              //��������
            {
                j=0;
                tm=m;
                while(total>pretotal&&j<m)     //�����2
                {
                    j++;
                    dequeue(q,ta,tb,ti);
                    if(total+ta < 0)
                        enqueue(q,ta,tb,ti);
                    else
                    {
                        total+=ta;
                        t[ti]=time-tb;
                        time+=wait_time;
                        tm--;
                    }
                }
                m=tm;
            }
        }
      }
      i++;
      //printf("%d %d\n",total,i-1);
    }
    while(!emptyp(q))    //�����˻�����
    {
        dequeue(q,ta,tb,ti);
        t[ti]=close_time-tb;
    }
    destroyqueue(q);
    for(i=1;i<=N;i++)
    {
        totaltime+=t[i];
        //printf("%d %d\n",t[i],i);
        fprintf(file2,"%d\n",t[i]);
    }
    //printf("%d\n",totaltime);
    fprintf(file2,"%d\n",totaltime/N);
}
