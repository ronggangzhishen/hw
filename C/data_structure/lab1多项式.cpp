#include<stdio.h>
#include<stdlib.h>
#include<math.h>
typedef struct ele{
    float coe;       //ϵ��
    int exp;         //ָ��
    struct ele *next;
}ele, *pele;

void putp(pele p){
    if(p->exp>=0)
    {
        if(p->exp > 0)
        {
            printf("%d nodes\n",p->exp);
            p=p->next;
            /*if(p->coe==0)
            {
                printf("0\n");
                p=p->next;
            }*/
            while(p!=NULL)
            {
                if(p->exp==0)
                    printf("%f\n",p->coe);
                else
                    printf("%f*x^%d\n",p->coe,p->exp);
                    //���ϵ��Ϊ0�������ͷ��ָ��Ϊ����
                p=p->next;
            }
        }
        else
            printf("0\n");
    }
    else
        printf("no such polynomial\n");
}
void changep(pele p,float ta,int tb){
    //����ͷָ�룬ϵ����ָ����ϵ��Ϊ����ɾ����Ϊ��ָ�����򽨣������
    pele q,head;
    head=p;
    q=p;
    p=p->next;
    while(p->exp<tb&&p->next!=NULL)            //���Ƿ����
    {
        q=p;
        p=p->next;
    }
    if(ta==0)
    {
        if(p->exp==tb)                              //ɾ
        {
            head->exp--;                            //������һ
            q->next=p->next;
            free(p);
        }
    }
    else
    {
        if(p->exp == tb)                           // ��
            p->coe=ta;
        else if(p->exp > tb)                       //��,���ڱ�ͷ��
        {
            p=(pele)malloc(sizeof(ele));
            p->coe=ta;
            p->exp=tb;
            p->next=q->next;
            q->next=p;
            head->exp++;
        }
        else                         //�����ڱ�β��   //����ֻ��һ��ʱ������
        {
            q=(pele)malloc(sizeof(ele));
            q->coe=ta;
            q->exp=tb;
            p->next=q;
            q->next=NULL;
            head->exp++;
        }
    }
}
pele createp(int n){                       //����Ϊn,��ͷ��ϵ��Ϊ0���洢����
    float ta,t;
    int i=0,tb;
    pele head,rear,p;
    p=(pele)malloc(sizeof(ele));
    head=rear=p;
    head->coe=0;
    head->exp=1;                          //��ͷ��ϵ��Ϊ0���洢����
    head->next=NULL;
    while(i < n)                                    //
    {
        i++;
        if(i==1)
        {
        p=(pele)malloc(sizeof(ele));
        scanf("%f",&ta);       //����ĳЩԭ��coe��exp�����������м���\n����
        scanf("%f",&t);
        while(fabs(t-(int)t)>1e-4)
        {
            printf("error\ninput exp again\n");
            scanf("%f",&t);
        }
        tb=(int)t;
        p->coe=ta;
        p->exp=tb;
        rear->next=p;
        rear=p;
        p->next=NULL;
        }
        else
        {
        scanf("%f",&ta);                     //����ĳЩԭ��coe��exp�����������м���\n����
        scanf("%f",&t);
        while(fabs(t-(int)t)>1e-4)
        {
            printf("error\ninput exp again\n");
            scanf("%f",&t);
        }
        tb=(int)t;
        changep(head,ta,tb);
        }
        printf("OK\n");
        putp(head);
    }
    printf(" O K\n");
    return head;
}
pele addp(pele pa,pele pb){                   //pa,paΪ��ʽ,����ֵΪϣ���洢��ʽ

    int n=0;                                       //nΪ����
    pele pcrear,pchead,p;
    p=(pele)malloc(sizeof(ele));
    pchead=pcrear=p;
    pchead->coe=0;
    pa=pa->next;
    pb=pb->next;
    while(pa!=NULL&&pb!=NULL)
    {
        n++;
        if(pa->exp < pb->exp)
        {
            p=(pele)malloc(sizeof(ele));
            p->coe=pa->coe;
            p->exp=pa->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pa=pa->next;


        }
        else if(pa->exp==pb->exp)
        {
            if(pa->coe+pb->coe!=0)
            {
                p=(pele)malloc(sizeof(ele));
                p->coe=pa->coe+pb->coe;
                p->exp=pa->exp;
                pcrear->next=p;
                pcrear=p;
                p->next=NULL;

                printf("%f*x^%d\n",p->coe,p->exp);
            }
            else
                n--;
            pa=pa->next;
            pb=pb->next;
        }
        else
        {
            p=(pele)malloc(sizeof(ele));
            p->coe=pb->coe;
            p->exp=pb->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pb=pb->next;
        }
    }
    while(pa!=NULL)
        {
            n++;
            p=(pele)malloc(sizeof(ele));
            p->coe=pa->coe;
            p->exp=pa->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pa=pa->next;

        }
    while(pb!=NULL)
        {
            n++;
            p=(pele)malloc(sizeof(ele));
            p->coe=pb->coe;
            p->exp=pb->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pb=pb->next;

        }
    pchead->exp=n;
    return pchead;
}
pele minusp (pele pa,pele pb){                //pa-pb
    int n=0;                                  //nΪ����
    pele pcrear,pchead,p;
    p=(pele)malloc(sizeof(ele));
    pchead=pcrear=p;
    pchead->coe=0;
    pa=pa->next;
    pb=pb->next;
    while(pa!=NULL&&pb!=NULL)
    {
        n++;
        if(pa->exp < pb->exp)
        {
            p=(pele)malloc(sizeof(ele));
            p->coe=pa->coe;
            p->exp=pa->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pa=pa->next;
        }
        else if(pa->exp==pb->exp)
        {
            if(pa->coe!=pb->coe)
            {
            p=(pele)malloc(sizeof(ele));
            p->coe=pa->coe-pb->coe;
            p->exp=pa->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            }
            else
                n--;                         //�������,n--
            pa=pa->next;
            pb=pb->next;
        }
        else
        {
            p=(pele)malloc(sizeof(ele));
            p->coe=-pb->coe;
            p->exp=pb->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pb=pb->next;
        }
    }
    while(pa!=NULL)                     //pa֮���Ԫ�ؽ���pc
        {
            n++;
            p=(pele)malloc(sizeof(ele));
            p->coe=pa->coe;
            p->exp=pa->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pa=pa->next;
        }
    while(pb!=NULL)               //pb*-1����pc
        {
            n++;
            p=(pele)malloc(sizeof(ele));
            p->coe=-pb->coe;
            p->exp=pb->exp;
            pcrear->next=p;
            pcrear=p;
            p->next=NULL;

            printf("%f*x^%d\n",p->coe,p->exp);
            pb=pb->next;
        }
    pchead->exp=n;
    return pchead;

}
double funp(pele p,double x){            //����x����ֵ
    double c=0,y,z;
    while(p->next!=NULL)
    {
        p=p->next;
        y=p->coe;
        printf("%f*%f^",y,x);
        z=(double)p->exp;
        printf("%f   ",z);
        c+=y*pow(x,z);
        printf("%f   \n",c);
    }
    return c;
}
void destroyp(pele &p){              //��ı�ͷ���ָ��
    pele q;
    while(p!=NULL)
    {
        q=p;
        p=p->next;
        free(q);
    }
}
void cleanp(pele p){ //ֻ��ı�ͷ����ֵ����&,�������ʽ����Ϊ��0�������㣬����һ�

    pele q;
    p->exp=0;
    p=p->next;
/*    p->coe=0;
    p->exp=0;
    q=p;
    p=p->next;
    q->next=NULL;*/
    while(p!=NULL)
    {
        q=p;
        p=p->next;
        free(q);
    }
}
void dpol(pele p,int n){                  //��ĳ���ڵ���n�ε�,����ԭλ��
    int i=0;
    while(i<n)
    {
        p->coe=p->coe*p->exp;
        p->exp--;
        i++;
    }
}
void difpol(pele p,int n){               //�Զ���ʽ��n�ε�
    pele q=p,head=p;
    p=p->next;
    while(p!=NULL)
    {
        if(p->exp>=0&&p->exp<n)         //��΢������
        {
            /*if(q->exp!=0)            //��0��������
            {
                p->coe=0;
                p->exp=0;
                q=p;
                p=p->next;
            }
            else                      //����������free
            {*/
                q->next=p->next;     //����Ҫ�������0���ڵ��ʾ
                free(p);
                p=q->next;
                head->exp--;

        }
        else
        {
            q=p;
            dpol(p,n);
            p=p->next;
        }
    }
}
void indefinite_integralp(pele p){            //
    int i=0,e;
    float c;
    pele head=p;
    if(p->exp==0)
        printf("  0\n");
    p=p->next;
    while(i < head->exp)
    {
        i++;
        if(p->exp==-1)
        {
            printf("%f*ln[x]\n",p->coe);
        }
        else
        {
            c=p->coe/(p->exp+1);
            e=(float)p->exp+1;
            printf("%f*x^%d\n",c,e);
        }
        p=p->next;
    }
}
float definite_integralp(pele p,double x,double y){   //
    int i=0,e;
    float c,counti=0;
    double z;
    pele head=p;
    if(p->exp==0)            //��Ϊ0��
        printf("0\n");
    p=p->next;
    while(i < head->exp&&p!=NULL)
    {
        i++;
        if(x<=0&&y>=0&&p->exp <= -1)
        {
            printf("not defined\n");
            break;
        }
        if(p->exp==-1)
        {
            double z=y/x;
            counti+=p->coe*log(z);
            printf("%f*log(y/x)  ",p->coe);
        }
        else
        {
            e=p->exp+1;
            c=p->coe/e;
            counti+=c*(pow(y,(double)e)-pow(x,(double)e));
            printf("%f*(y^%d-x^%d)   ",c,e,e);
        }
        printf("%f\n",counti);
        p=p->next;
    }
    if(x<=0&&y>=0&&p->exp<0) ;
    else
        printf("the integral = %f\n",counti);
    return counti;
}
//continue...
void printlist(){
    printf("What do you want to do?\n");
    printf("1. create and input a polynomial\n");
    printf("2. print a polynomial\n");
    printf("3. add two polynomials\n");
    printf("4. a polynomials minus another polynomial\n");
    printf("5. input x and calculate a polynomial\n");
    printf("6. destroy a polynomial\n");
    printf("7. clean a polynomial\n");
    printf("8. change a polynomial\n");
    printf("9. differentiate a polynomial for n times\n");
    printf("10. indefinite integral a polynomial\n");
    printf("11. definite integral a polynomial from x to y\n");
//    printf("12.\n");
}
int main(){
    pele poly[10],p,q;       //���ֻ������10������ʽ
    int select,i,m,n;
    double x,y;
    for(i=0;i<10;poly[i]=NULL,i++);



    printlist();
    scanf("%d",&select);
    while(select>=1&&select<=11)          //s�ڲ���������
    {
        switch(select)
        {
        case 1:{
                printf("you enter 1. create and input a polynomial\n");
                printf("please input polynomial number and nodes number n as'm,n'\n");
                scanf("%d,%d",&m,&n);
                if(m<10&&poly[m]==NULL)
                {
                    printf("%d nodes\n",n);
                    poly[m]=createp(n);
                }
                else
                    printf("error\n",i);
                break;
                }
        case 2:{
                printf("you enter 2. print a polynomial\n");
                printf("please input which one to print as'm'\n");
                scanf("%d",&m);
                if(poly[m]!=NULL)
                    putp(poly[m]);
                else
                    printf("no such polynomial\n");
                break;
                }
        case 3:{
                printf("you enter 3. add two polynomials\n");
                printf("please input which add which save in which as 'm,n,i'\n");
                scanf("%d,%d,%d",&m,&n,&i);
                if(m<10&&n<10&&i<10&&poly[m]!=NULL&&poly[n]!=NULL&&poly[i]==NULL)
                {
                    printf("%d    %d    %d\n",m,n,i);
                    poly[i]=addp(poly[m], poly[n]);
                    putp(poly[i]);
                }
                else
                    printf("error\n");
                break;
                }
        case 4:{
                printf("you enter 4.a polynomials minus another polynomial\n");
                printf("please input which minus which save in which as 'm,n,i'\n");
                scanf("%d,%d,%d",&m,&n,&i);
                if(m<10&&n<10&&i<10&&poly[m]!=NULL&&poly[n]!=NULL&&poly[i]==NULL)
                {
                    printf("%d    %d    %d\n",m,n,i);
                    poly[i]=minusp(poly[m],poly[n]);
                    putp(poly[i]);
                }
                else
                    printf("error\n");
                break;
                }
        case 5:{
                printf("you enter 5. input x and calculate a polynomial\n");
                printf("please input which polynomial and which number to calculate as'm,x'\n");
                scanf("%d,%lf",&m,&x);
                if(poly[m]!=NULL)
                {
                    if(x==0&&poly[m]->next->exp<0){printf("1/0!\n",i);break;}
                    printf("x=%f\n",x);
                    y=funp(poly[m],x);
                    printf("poly(x)=%f\n",y);
                }
                else
                    printf("error\n");
                break;
                }
        case 6:{
                printf("you enter 6. destroy a polynomial\n");
                printf("please input polynomial number as'm'\n");
                scanf("%d",&m);
                if(poly[m]!=NULL)
                    destroyp(poly[m]);
                else
                    printf("error\n");
                break;
                }
        case 7:{
                printf("you enter 7. clean a polynomial\n");
                printf("please input polynomial number as'm'\n");
                scanf("%d",&m);
                if(poly[m]!=NULL)
                    cleanp(poly[m]);
                else
                    printf("error\n");
                break;
                }
        case 8:{
                printf("you enter 8. change a polynomial\n");
                printf("please input polynomial number and nodecoe and nodeexp as'm,coe,exp'\n");
                scanf("%d,%lf,%lf",&m,&x,&y);
                while(fabs(y-(int)y)>1e-4)
                {
                    printf("error\ninput exp again\n");
                    scanf("%lf",&y);
                }
                n=(int)y;
                if(poly[m]!=NULL)
                    changep(poly[m],x,n);
                else
                    printf("error\n");
                putp(poly[m]);
                break;
                }
        case 9:{
                printf("you enter 9. differentiate a polynomial for n times\n");
                printf("please input polynomial number and d^n/x^n as'm,n'\n");
                scanf("%d,%d",&m,&n);
                if(poly[m]!=NULL)
                {
                    difpol(poly[m],n);
                    putp(poly[m]);
                }
                else
                    printf("error\n");
                break;
                }
        case 10:{
                printf("you enter 10. indefinite integral a polynomial\n");
                printf("please input which to integral as 'm'\n");
                scanf("%d",&m);
                if(poly[m]!=NULL)
                    indefinite_integralp(poly[m]);
                else
                    printf("error\n");
                break;
                }
        case 11:{
                printf("you enter 11. definite integral a polynomial from x to y\n");
                printf("please input which to integral and x,y as 'm,x,y'\n");
                scanf("%d,%lf,%lf",&m,&x,&y);
                if(poly[m]!=NULL){
                    printf("%d,%f,%f\n",m,x,y);
                    definite_integralp(poly[m],x,y);
                }
                else
                    printf("error\n");
                break;
                }
/*        case 12: ;break;
        default: ;      */
        };
        printf("end\n\n");
        printlist();
        scanf("%d",&select);
    }
    printf("\nenjoy yourself\n",i);
}
