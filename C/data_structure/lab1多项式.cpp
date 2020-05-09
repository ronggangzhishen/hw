#include<stdio.h>
#include<stdlib.h>
#include<math.h>
typedef struct ele{
    float coe;       //系数
    int exp;         //指数
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
                    //输出系数为0即代表表头，指数为项数
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
    //输入头指针，系数，指数，系数为零则删，不为零指数无则建，有则改
    pele q,head;
    head=p;
    q=p;
    p=p->next;
    while(p->exp<tb&&p->next!=NULL)            //找是否存在
    {
        q=p;
        p=p->next;
    }
    if(ta==0)
    {
        if(p->exp==tb)                              //删
        {
            head->exp--;                            //项数减一
            q->next=p->next;
            free(p);
        }
    }
    else
    {
        if(p->exp == tb)                           // 改
            p->coe=ta;
        else if(p->exp > tb)                       //增,可在表头增
        {
            p=(pele)malloc(sizeof(ele));
            p->coe=ta;
            p->exp=tb;
            p->next=q->next;
            q->next=p;
            head->exp++;
        }
        else                         //增，在表尾增   //增，只有一项时！！！
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
pele createp(int n){                       //项数为n,表头以系数为0来存储项数
    float ta,t;
    int i=0,tb;
    pele head,rear,p;
    p=(pele)malloc(sizeof(ele));
    head=rear=p;
    head->coe=0;
    head->exp=1;                          //表头以系数为0来存储项数
    head->next=NULL;
    while(i < n)                                    //
    {
        i++;
        if(i==1)
        {
        p=(pele)malloc(sizeof(ele));
        scanf("%f",&ta);       //由于某些原因，coe，exp分两次输入中间以\n隔开
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
        scanf("%f",&ta);                     //由于某些原因，coe，exp分两次输入中间以\n隔开
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
pele addp(pele pa,pele pb){                   //pa,pa为加式,返回值为希望存储加式

    int n=0;                                       //n为项数
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
    int n=0;                                  //n为项数
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
                n--;                         //此项不存在,n--
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
    while(pa!=NULL)                     //pa之后的元素接上pc
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
    while(pb!=NULL)               //pb*-1接上pc
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
double funp(pele p,double x){            //输入x，求值
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
void destroyp(pele &p){              //需改变头结点指针
    pele q;
    while(p!=NULL)
    {
        q=p;
        p=p->next;
        free(q);
    }
}
void cleanp(pele p){ //只需改变头结点的值，无&,清零多项式可作为‘0’来运算，仍有一项，

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
void dpol(pele p,int n){                  //对某个节点求n次倒,存在原位置
    int i=0;
    while(i<n)
    {
        p->coe=p->coe*p->exp;
        p->exp--;
        i++;
    }
}
void difpol(pele p,int n){               //对多项式求n次导
    pele q=p,head=p;
    p=p->next;
    while(p!=NULL)
    {
        if(p->exp>=0&&p->exp<n)         //若微分至零
        {
            /*if(q->exp!=0)            //无0项则清零
            {
                p->coe=0;
                p->exp=0;
                q=p;
                p=p->next;
            }
            else                      //已有零项则free
            {*/
                q->next=p->next;     //不需要有零项，以0个节点表示
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
    if(p->exp==0)            //若为0项
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
    pele poly[10],p,q;       //最多只给存贮10个多项式
    int select,i,m,n;
    double x,y;
    for(i=0;i<10;poly[i]=NULL,i++);



    printlist();
    scanf("%d",&select);
    while(select>=1&&select<=11)          //s在操作数以内
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
