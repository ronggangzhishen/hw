#include<stdio.h>
#include<stdlib.h>
void my_merge(int* A,int p,int q,int r){
    int n1=q-p+1;
    int n2=r-q;
    int *L=(int*)malloc((n1+1)*sizeof(int));
    int *R=(int*)malloc((n2+1)*sizeof(int));
    int i;
    for(i=0;i<n1;i++)
        L[i]=A[p+i];
    L[n1]=65536;         //ÎÞÇî
    for(i=0;i<n2;i++)
        R[i]=A[q+i+1];
    R[n2]=65536;         //ÎÞÇî
    for(i=p;i<=r;i++)
        A[i]=(*L <= *R)?*L++:*R++;
    free(L);
    free(R);
}

void merge_sort(int* A,int p,int r){
    int q;
    if(p < r){
        q = (p+r)/2;
        merge_sort(A,p,q);
        merge_sort(A,q+1,r);
        my_merge(A,p,q,r);
    }
}

/*int main()
{
    int i,input[10]={10,9,8,7,6,5,4,3,2,1};
    merge_sort(input,0,10-1);
    for(i=0;i<10;i++)
        printf("%d\n",input[i]);
    return 0;
}*/
