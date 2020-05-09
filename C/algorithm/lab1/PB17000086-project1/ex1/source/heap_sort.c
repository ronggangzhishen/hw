#include<stdio.h>
void max_heapify(int *A,int i,int size){
    int l=2*(i+1)-1;
    int r=2*(i+1)+1-1;
    int large,t;
    if(l <= size && A[l] > A[i])
        large=l;
    else
        large=i;
    if(r <= size && A[r] > A[large])
        large=r;
    if(large != i)
    {
        t=A[large];
        A[large]=A[i];
        A[i]=t;
        max_heapify(A,large,size);
    }
}
void build_max_heap(int *A,int size){//其实是 size-1
    int i;
    for(i=(size+1)/2-1;i>=0;i--)
        max_heapify(A,i,size);   //i 为下标
}
void heap_sort(int *A,int p,int r){
    int i,t,size=r;

    build_max_heap(A,size);
    for(i=r;i>0;i--)
    {
        t=A[0];     //最大丢末尾
        A[0]=A[i];
        A[i]=t;
        size--;     //堆--
        max_heapify(A,0,size);
    }
}
/*
int main()
{
    int i,input[10]={10,9,8,7,6,5,4,3,2,1};
    heap_sort(input,0,10-1);
    for(i=0;i<10;i++)
        printf("%d\n",input[i]);
    return 0;
}
*/
