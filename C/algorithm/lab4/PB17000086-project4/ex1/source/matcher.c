#include<stdio.h>
#include<math.h>
#include<stdlib.h>

int naive_matcher(char* T,char* P,int n,int m){
    int s;
    char *tt,*tp;
    for(s=0;s<=n-m;s++){
        tt=T+s;
        tp=P;
        while(*tt++ == *tp++) ;
        if(tp-P == m+1)
            return s;
    }
    return -1;
}

int RK_matcher(char* T,char* P,int n,int m){
    int s;
    char *tt,*tp;
    int q,h=1,p,t;
    int d=75;
    switch(m){                  //q取值为第n个素数
        case 4: q=131; break;
        case 8: q=1619;  break;
        case 16: q=17863; break;
        case 32: q=180503; break;
        case 64: q=1742537; break;
        default: q=2;
    }
    //h=((int)pow(d,m-1))%q;    //pow计算h会越界，迭代
    for(s=0;s<m-1;s++)
        h=(h*d)%q;
    p=0;
    t=0;
    for(s=0;s<m;s++){
        p=(d*p+P[s]-'0')%q;
        t=(d*t+T[s]-'0')%q;
    }
    //printf("p=%d\n",p);
    for(s=0;s<=n-m;s++){
        //printf("t=%d\n",t);
        if(t == p){        //compare
            tt=T+s;
            tp=P;
            while(*tt++ == *tp++) ;
            if(tp-P == m+1)
            return s;
        }
        t=(d*(t-(T[s]-'0')*h) + (T[m+s]-'0'))%q;    //next t
        if(t<0) t+=q;
    }
    return -1;
}

void compute_prefix_fun(char *P,int m,char *pi){
    pi[0]=0;
    int q,k=0;
    for(q=1;q<m;q++){   //0
        while(k>0 && P[k]!=P[q])
            k=pi[k-1];
        if(P[k] == P[q])
            k++;
        pi[q]=k;
        //printf("pi[%d]=%d\n",q,pi[q]);
    }

}

int KMP_matcher(char* T,char* P,int n,int m){
    int i,q=0;
    char *pi=(char *)malloc(m*sizeof(char));
    compute_prefix_fun(P,m,pi);
    //for(i=0;i<m;i++)printf("pi[%d]=%d\n",i,pi[i]);
    for(i=0;i<n;i++){           //q为最长匹配长度
        while(q>0 && T[i]!=P[q])
            q=pi[q-1];
        if(T[i] == P[q])
            q++;
        //printf("i=%d q=%d\n",i,q);
        if(q == m)
            return i-m+1;
            //q=pi[q];
    }

    free(pi);
    return -1;
}

void Pre_Bc(char *P,int m,char *Bc){//compute bad char
    int i;
    for(i=0;i<75;i++)
        Bc[i]=m;
    for(i=0;i<m-1;i++)  //最后一个字符若更新便为0 不动
        Bc[P[i]-'0']=m-1-i;//第一个移m-1,倒数第二个移1
}

int BMH_matcher(char* T,char* P,int n,int m){
    int s=0;
    char c,*tt,*tp;
    char *Bc=(char *)malloc(75*sizeof(char));
    Pre_Bc(P,m,Bc);
    while(s <= n-m){
        c=T[s+m-1];     //当前窗口最后一个char
        if(P[m-1] == c){
            tt=T+s;
            tp=P;
            while(*tt++ == *tp++) ;
            if(tp-P == m+1)
                return s;
        }
        s+=Bc[c-'0'];
    }
    free(Bc);
    return -1;
}
/*
int main(){
    char *t1="accabbaabbaaabc1";
    char *p1="aabcaabc";
    puts(t1);
    puts(p1);
    //printf("s=%d\n",naive_matcher(t1,p1,15,4));
    //printf("s=%d\n",RK_matcher(t1,p1,15,4));
    //printf("s=%d\n",BMH_matcher(t1,p1,15,4));
    //printf("s=%d\n",KMP_matcher(t1,p1,15,4));
    return 0;
}*/
