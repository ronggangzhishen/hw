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
    int i=1,j,m=0,tm,pretotal,totaltime=0,ta,tb,ti,time=0,t[1001];//t为第i个人的等待时间
    linkqueue q;
    qnode tp;
    initqueue(q);
    fscanf(pfile,"%d %d %d %d",&N,&total,&close_time,&wait_time);
    while(i<=N)
    {
        fscanf(pfile,"%d %d",&a,&b);
      if(time>=close_time)            //下班，不受理
            t[i]=close_time-b;
      else
      {
        if(a < 0)
        {
            if(total+a<0)               //进队列，等
            {
                enqueue(q,a,b,i);
                m++;                    //二队人数
            }
            else                        //可取，受理
            {
                total+=a;
                if(b>=time)             //前面没人
                {
                    t[i]=0;
                    time=b+wait_time;
                }
                else                    //前面有人，等
                {
                    t[i]=time-b;
                    time+=wait_time;
                }
            }
        }
        else                            //存，受理
        {
            pretotal=total;
            total+=a;
            if(b>=time)                 //没人
            {
                t[i]=0;
                time=b+wait_time;
            }
            else                        //等
            {
                t[i]=time-b;
                time+=wait_time;
            }
            if(!emptyp(q))              //二队有人
            {
                j=0;
                tm=m;
                while(total>pretotal&&j<m)     //查队列2
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
    while(!emptyp(q))    //关门了还有人
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
