#include<stdio.h>
#include<stdlib.h>

typedef struct FibonacciHeapNode {
    int key;       //结点
    int degree;    //度
    struct FibonacciHeapNode *left;  //左兄弟
    struct FibonacciHeapNode *right; //右兄弟
    struct FibonacciHeapNode *parent; //父结点
    struct FibonacciHeapNode *child;  //第一个孩子结点
    int mark;           //是否被删除第1个孩子
}fibnode;

typedef struct FibonacciHeap {
    int heap_size;   //堆中结点个数
    struct FibonacciHeapNode *min;//最小堆，根结点
    int max_degree;   //最大度
    struct FibonacciHeapNode **Aarray;//指向最大度的内存区域
}fibheap;

void fibnodePrint(fibnode *x) {
    fibnode *p = NULL;
    if (NULL == x) {
        return ;
    }
    p = x;
    do {
        printf(" (");
        printf("%d", p->key);
        if (p->child != NULL) {
            fibnodePrint(p->child);
        }
        printf(") ");
        p = p->right;
    }while (x != p);
}
//输出打印堆
void fibheapPrint(fibheap *heap) {
    printf("The heap_size = %d\n", heap->heap_size);
    fibnodePrint(heap->min);
    puts("\n");
};
void fibnodeRemove(fibnode *x) {
    x->left->right = x->right;
    x->right->left = x->left;
}

inline void fibnodeAdd(fibnode *x, fibnode *y) {
    x->right = y->right;
    y->right->left = x;
    x->left = y;
    y->right = x;
}

//初始化一个空的Fibonacci Heap
fibheap *fibheapMake() {
    fibheap *heap = (fibheap *)malloc(sizeof(fibheap));
    memset(heap, 0, sizeof(fibheap));
    return heap;
}

//初始化结点x
fibnode *fibheapNodeMake() {
    fibnode *x = NULL;
    x = (fibnode *) malloc(sizeof(fibnode));
    memset(x, 0, sizeof(fibnode));
    x->left = x->right = x;
    return x;
}

//堆结点x插入fibonacci heap中
void fibheapInsert(fibheap *heap, fibnode *x) {
    if (0 == heap->heap_size) {
        heap->min = x;
    } else {
        fibnodeAdd(x, heap->min);
        x->parent = NULL;
        if (x->key < heap->min->key) {
            heap->min = x;
        }
    }
    heap->heap_size++;
}

//将值插入Fibonacci Heap
void fibheapInsertKey(fibheap *heap, int key) {
    fibnode *x = NULL;
    x = fibheapNodeMake();
    x->key = key;
    fibheapInsert(heap, x);
}

//将数组内的值插入Fibonacci Heap
void fibheapInsertKeys(fibheap *heap, int keys[], int heap_size) {
    int i;
    for (i = 0; i < heap_size; i++) {
        fibheapInsertKey(heap, keys[i]);
    }
}

//开辟fibheapConsolidate函数哈希所用空间
void fibheapConsMake(fibheap *heap) {
    int old = heap->max_degree;
    heap->max_degree = (int)(log(heap->heap_size *1.0) / log(2.0)) + 1;
    if (old < heap->max_degree) {
        //因为度为heap->max_degree可能被合并,所以要max_degree + 1
        heap->Aarray = (fibnode **) realloc(heap->Aarray,
            sizeof(fibheap *) *(heap->max_degree + 1));
        if (NULL == heap->Aarray) {
            puts("Out of Space!");
            exit(1);
        }
    }
}

//将堆的最小结点移出，并指向其有兄弟
fibnode *fibheapMinRemove(fibheap *heap) {
    fibnode *min = heap->min;
    if (heap->min == min->right) {
        heap->min = NULL;
    } else {
        fibnodeRemove(min);
        heap->min = min->right;
    }
    min->left = min->right = min;
    return min;
}

//将x根结点链接到y根结点
void fibheapLink(fibheap *heap, fibnode *x, fibnode *y) {
    fibnodeRemove(x);
    if (NULL == y->child) {
        y->child = x;
    } else {
        fibnodeAdd(x, y->child);
    }
    x->parent = y;
    y->degree++;
    x->mark = 0;
}

//合并左右相同度数的二项树
void fibheapConsolidate(fibheap *heap) {
    int D, d;
    fibnode *t,*w = heap->min, *x = NULL, *y = NULL;
    fibheapConsMake(heap);//开辟哈希所用空间
    D = heap->max_degree + 1;
	int i;
    for (i = 0; i < D; i++) {
        *(heap->Aarray + i) = NULL;
    }

    //合并相同度的根节点，使每个度数的二项树唯一

    while (NULL != heap->min) {
        x = fibheapMinRemove(heap);
        d = x->degree;
        while (NULL != *(heap->Aarray + d)) {
            y = *(heap->Aarray + d);
            if (x->key > y->key) {//根结点key最小
                t=x;
				x=y;
				y=t;
            }
            fibheapLink(heap, y, x);
            *(heap->Aarray + d) = NULL;
            d++;
        }
        *(heap->Aarray + d) = x;
    }
    heap->min = NULL;//原有根表清除

    //将heap->Aarray中结点都重新加到根表中，且找出最小根
    for (i = 0; i < D; i++) {
        if (*(heap->Aarray + i) != NULL) {
            if (NULL == heap->min) {
                heap->min = *(heap->Aarray + i);
            } else {
                fibnodeAdd(*(heap->Aarray + i), heap->min);
                if ((*(heap->Aarray + i))->key < heap->min->key) {
                    heap->min = *(heap->Aarray + i);
                }//if(<)
            }//if-else(==)
        }//if(!=)
    }//for(i)
}

//修改度数
void renewDegree(fibnode *parent, int degree) {
    parent->degree -= degree;
    if (parent-> parent != NULL) {
        renewDegree(parent->parent, degree);
    }
}

//抽取最小结点
int fibheapExtractMin(fibheap *heap) {
    fibnode *x = NULL, *z = heap->min;
    if (z != NULL) {

        //删除z的每一个孩子
        while (NULL != z->child) {
            x = z->child;
            fibnodeRemove(x);
            if (x->right == x)
                z->child = NULL;
            else
                z->child = x->right;
            fibnodeAdd(x, z);//add x to the root list heap
            x->parent = NULL;
        }

        fibnodeRemove(z);
        if (z->right == z)
            heap->min = NULL;
        else {
            heap->min = z->right;
            fibheapConsolidate(heap);
        }
        heap->heap_size--;
    }
    return z->key;
}

//切断x与父节点y之间的链接，使x成为一个根
void fibheapCut(fibheap *heap, fibnode *x, fibnode *y) {
    fibnodeRemove(x);
    renewDegree(y, x->degree);
    if (x == x->right) {
        y->child = NULL;
    } else {
        y->child = x->right;
    }
    x->parent = NULL;
    x->left = x->right = x;
    x->mark = 0;
    fibnodeAdd(x, heap->min);
}

//级联剪切
void fibheapCascadingCut(fibheap *heap, fibnode *y) {
    fibnode *z = y->parent;
    if (NULL != z) {
        if (y->mark == 0) {
            y->mark = 1;
        } else {
            fibheapCut(heap, y, z);
            fibheapCascadingCut(heap, z);
        }
    }
}

//减小一个关键字
void fibheapDecrease(fibheap *heap, fibnode *x, int key) {
    fibnode *y = x->parent;
    if (x->key < key) {
        puts("new key is greater than current key!");
        exit(1);
    }
    x->key = key;

    if (NULL != y && x->key < y->key) {
        //破坏了最小堆性质，需要进行级联剪切操作
        fibheapCut(heap, x, y);
        fibheapCascadingCut(heap, y);
    }
    if (x->key < heap->min->key) {
        heap->min = x;
    }
}

//删除结点
void fibheapDelete(fibheap *heap, fibnode *x) {
    fibheapDecrease(heap, x, 0);//0够小了
    //printf("decrease OK,H->min->key=%d\n",heap->min->key);
    fibheapExtractMin(heap);
    //printf("extract OK\n");
}

//被fibheapSearch调用
fibnode *fibnodeSearch(fibnode *x, int key) {

    fibnode *w = x, *y = NULL;
    if (x != NULL) {
        do {
            if (w->key == key) {
                y = w;
                break;
            } else if (NULL != (y = fibnodeSearch(w->child, key))) {
                break;
            }
            w = w->right;
        } while (w != x);
    }
    return y;
}

//堆内搜索关键字
fibnode *fibheapSearch(fibheap *heap, int key) {
    return fibnodeSearch(heap->min, key);
}

//被fibheapDestory调用
void fibnodeDestory(fibnode *x) {
    fibnode *p = x, *q = NULL;
    while (p != NULL) {
        fibnodeDestory(p->child);
        q = p;
        if (p -> left == x) {
            p = NULL;
        } else {
            p = p->left;
        }
        free(q->right);
    }
}

//销毁堆
void fibheapDestory(fibheap *heap) {
    fibnodeDestory(heap->min);
    free(heap);
    heap = NULL;
}



