#include<stdio.h>
#include<math.h>
double fun(double b,double c,double d,double x)
{
    return pow(x,3)+b*pow(x,2)+c*x+d;
}
int main()
{
    int i,j=0;
    double a,b,c,d;
    double t1,t2,t3,f1,f2,f3;
    double x[3]={0};
    scanf("%lf %lf %lf %lf",&a,&b,&c,&d);
    if(a<0) a/=-1;
    b/=a;
    c/=a;
    d/=a;
    a=1;
    //printf("%lf %lf %lf %lf\n",a,b,c,d);
    for(i=-100;i<=99;i++)
    {
        //printf("[%d,%d]\n",i,i+1);
        t1=i;
        t2=i+1;
        f1=fun(b,c,d,t1);
        f2=fun(b,c,d,t2);
        if(fabs(f1) < 1e-2) {if(j==0||x[j-1]!=t1) x[j++]=t1; continue;}
        else if(fabs(f2) < 1e-2) {x[j++]=t2; continue;}
        else if(f1<0 && f2<0) continue;
        else if(f1>0 && f2>0) continue;
        else
        {
            if(f1<0)//up
            {
                while(fabs(f1) > 1e-2)
                {
                    t3=(t1+t2)/2;
                    f3=fun(b,c,d,t3);
                    if(fabs(f3) < 1e-2) {x[j++]=t3; break;} //==0
                    else if(f3<0) t1=t3;                    //>
                    else     t2=t3;                         //<
                    f1=fun(b,c,d,t1);
                    f2=fun(b,c,d,t2);
                }
            }
            else//down
            {
                while(fabs(f1) > 1e-2)
                {
                    t3=(t1+t2)/2;
                    f3=fun(b,c,d,t3);
                    if(fabs(f3) < 1e-2) {x[j++]=t3; break;} //==0
                    else if(f3>0) t1=t3;                    //>
                    else     t2=t3;                         //<
                    f1=fun(b,c,d,t1);
                    f2=fun(b,c,d,t2);
                }
            }
        }
        if(j==3) break;
    }
    printf("%.2f %.2f %.2f",x[0],x[1],x[2]);
}
