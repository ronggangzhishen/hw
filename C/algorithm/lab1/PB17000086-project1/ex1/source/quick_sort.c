#include<stdio.h>
int partition(int *A,int p,int r){   //取A[r]作为划分
    int t,x=A[r];
    int i=p-1;      //A[i] <= x
    int j=p;        //A[j] >  x
    for( ;j<r;j++)  //j 右移
    {
        if(A[j] <= x)//< i++
        {
            i=i+1;
            t=A[i];
            A[i]=A[j];
            A[j]=t;
        }
    }
    t=A[i+1];
    A[i+1]=x;
    A[r]=t;
    return i+1;
}
void quick_sort(int *A,int p,int r){
    int q;
    if(p < r)
    {
        q = partition(A,p,r);
        quick_sort(A,p,q-1);
        quick_sort(A,q+1,r);
    }
}
/*
int main()
{
    int i,input[10]={10,9,8,7,6,5,4,3,2,1};
    quick_sort(input,0,10-1);
    for(i=0;i<10;i++)
        printf("%d\n",input[i]);
    return 0;
}
*/
