#include<stdio.h>
#include<stdlib.h>
void counting_sort(int *A,int p,int r){
    int *B=(int*)malloc((r+1)*sizeof(int));
    int C[65536]; //用1~65535 C[0]不用
    int i;

    for(i=1;i<65536;i++)
        C[i]=0;

    for(i=0;i<=r;i++)   //C[i]= =i个数
        C[A[i]]++;

    for(i=2;i<65536;i++)//C[i]= <=i个数
        C[i]=C[i]+C[i-1];

    for(i=r;i>=0;i--)   //摆好
    {
        B[C[A[i]]-1]=A[i];//数的位置-1为下标
        C[A[i]]--;      //重复
    }

    for(i=0;i<=r;i++)   //
        A[i]=B[i];

    free(B);
}
/*
int main()
{
    int i,input[10]={10,9,8,7,6,5,4,3,2,1};
    counting_sort(input,0,10-1);
    for(i=0;i<10;i++)
        printf("%d\n",input[i]);
    return 0;
}
*/
