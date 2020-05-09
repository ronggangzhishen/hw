#include<stdio.h>
#include<stdlib.h>

typedef struct binarytree{
    int *a;
    int heap_size;
}bheap;
int bparent(int i){
    return (i+1)/2-1;
}
int bleft(int i){
    return 2*(i+1)-1;
}
int bright(int i){
    return 2*(i+1);
}

void min_heapify(bheap *b,int i){
    int l=bleft(i);
    int r=bright(i);
    int t,minn=i;
    if(l < b->heap_size && b->a[l] < b->a[i])
        minn=l;
    if(r < b->heap_size && b->a[r] < b->a[minn])
        minn=r;
    if(minn != i){
        t=b->a[i];
        b->a[i]=b->a[minn];
        b->a[minn]=t;
        min_heapify(b,minn);    //down
    }
}
void min_heapifyup(bheap *b,int i){
    int t,pi=bparent(i);
    while(pi>=0 && b->a[pi]>b->a[i]){//not fit move up
        t=b->a[pi];
        b->a[pi]=b->a[i];
        b->a[i]=t;
        i=pi;
        pi=bparent(i);
    }
}
bheap* build_binary_heap(int *a,int num){
    bheap *b=(bheap*)malloc(sizeof(bheap));
    b->heap_size = num;
    b->a=(int *)malloc((num+20)*sizeof(int));
    int i;
    for(i=0;i<num;i++)
        b->a[i]=a[i];
    for(i=num/2-1;i>=0;i--)     //from down to top
        min_heapify(b,i);       //adjust
    return b;
}

void binsert(bheap *b,int key){
    b->a[b->heap_size] = key;    //add to tail
    min_heapifyup(b,b->heap_size);//move up
    b->heap_size++;
}

int bfind(bheap *b,int key){
    int i;
    for(i=0;i<b->heap_size;i++)
        if(b->a[i] == key)
            return i;
    return -1;
}

void bdelete(bheap *b,int ord){
    if(ord>=0){
        b->a[ord]=b->a[b->heap_size-1];  //move last here
        b->heap_size--;
        min_heapify(b,ord);           //move down
    }
}

int bextractmin(bheap *b){
    int t=b->a[0];
    b->a[0]=b->a[b->heap_size-1];
    b->heap_size--;
    min_heapify(b,0);
    return t;
}

void bdecreasekey(bheap *b,int ord,int key){
    if(ord >= 0 && key < b->a[ord]){
        b->a[ord] = key;
        min_heapifyup(b,ord);
    }
}

void bdestroy(bheap *b){
    free(b->a);
    free(b);
}

/*int main(){
    int i,o,a[10]={10,9,8,7,6,5,4,3,2,1};
    bheap *b;
    b=build_binary_heap(a,10);
    binsert(b,15);
    o=bfind(b,2);
    bdelete(b,o);
    o=bfind(b,15);
    bdecreasekey(b,o,0);
    printf("%d\n",o);
    for(i=0;i<b->heap_size;i++)printf("%d\t",b->a[i]);

    bdestroy(b);
}*/
