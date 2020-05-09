#include<stdio.h>
#include<stdlib.h>

typedef struct FibonacciHeapNode {
    int key;       //���
    int degree;    //��
    struct FibonacciHeapNode *left;  //���ֵ�
    struct FibonacciHeapNode *right; //���ֵ�
    struct FibonacciHeapNode *parent; //�����
    struct FibonacciHeapNode *child;  //��һ�����ӽ��
    int mark;           //�Ƿ�ɾ����1������
}fibnode;

typedef struct FibonacciHeap {
    int heap_size;   //���н�����
    struct FibonacciHeapNode *min;//��С�ѣ������
    int max_degree;   //����
    struct FibonacciHeapNode **Aarray;//ָ�����ȵ��ڴ�����
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
//�����ӡ��
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

//��ʼ��һ���յ�Fibonacci Heap
fibheap *fibheapMake() {
    fibheap *heap = (fibheap *)malloc(sizeof(fibheap));
    memset(heap, 0, sizeof(fibheap));
    return heap;
}

//��ʼ�����x
fibnode *fibheapNodeMake() {
    fibnode *x = NULL;
    x = (fibnode *) malloc(sizeof(fibnode));
    memset(x, 0, sizeof(fibnode));
    x->left = x->right = x;
    return x;
}

//�ѽ��x����fibonacci heap��
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

//��ֵ����Fibonacci Heap
void fibheapInsertKey(fibheap *heap, int key) {
    fibnode *x = NULL;
    x = fibheapNodeMake();
    x->key = key;
    fibheapInsert(heap, x);
}

//�������ڵ�ֵ����Fibonacci Heap
void fibheapInsertKeys(fibheap *heap, int keys[], int heap_size) {
    int i;
    for (i = 0; i < heap_size; i++) {
        fibheapInsertKey(heap, keys[i]);
    }
}

//����fibheapConsolidate������ϣ���ÿռ�
void fibheapConsMake(fibheap *heap) {
    int old = heap->max_degree;
    heap->max_degree = (int)(log(heap->heap_size *1.0) / log(2.0)) + 1;
    if (old < heap->max_degree) {
        //��Ϊ��Ϊheap->max_degree���ܱ��ϲ�,����Ҫmax_degree + 1
        heap->Aarray = (fibnode **) realloc(heap->Aarray,
            sizeof(fibheap *) *(heap->max_degree + 1));
        if (NULL == heap->Aarray) {
            puts("Out of Space!");
            exit(1);
        }
    }
}

//���ѵ���С����Ƴ�����ָ�������ֵ�
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

//��x��������ӵ�y�����
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

//�ϲ�������ͬ�����Ķ�����
void fibheapConsolidate(fibheap *heap) {
    int D, d;
    fibnode *t,*w = heap->min, *x = NULL, *y = NULL;
    fibheapConsMake(heap);//���ٹ�ϣ���ÿռ�
    D = heap->max_degree + 1;
	int i;
    for (i = 0; i < D; i++) {
        *(heap->Aarray + i) = NULL;
    }

    //�ϲ���ͬ�ȵĸ��ڵ㣬ʹÿ�������Ķ�����Ψһ

    while (NULL != heap->min) {
        x = fibheapMinRemove(heap);
        d = x->degree;
        while (NULL != *(heap->Aarray + d)) {
            y = *(heap->Aarray + d);
            if (x->key > y->key) {//�����key��С
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
    heap->min = NULL;//ԭ�и������

    //��heap->Aarray�н�㶼���¼ӵ������У����ҳ���С��
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

//�޸Ķ���
void renewDegree(fibnode *parent, int degree) {
    parent->degree -= degree;
    if (parent-> parent != NULL) {
        renewDegree(parent->parent, degree);
    }
}

//��ȡ��С���
int fibheapExtractMin(fibheap *heap) {
    fibnode *x = NULL, *z = heap->min;
    if (z != NULL) {

        //ɾ��z��ÿһ������
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

//�ж�x�븸�ڵ�y֮������ӣ�ʹx��Ϊһ����
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

//��������
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

//��Сһ���ؼ���
void fibheapDecrease(fibheap *heap, fibnode *x, int key) {
    fibnode *y = x->parent;
    if (x->key < key) {
        puts("new key is greater than current key!");
        exit(1);
    }
    x->key = key;

    if (NULL != y && x->key < y->key) {
        //�ƻ�����С�����ʣ���Ҫ���м������в���
        fibheapCut(heap, x, y);
        fibheapCascadingCut(heap, y);
    }
    if (x->key < heap->min->key) {
        heap->min = x;
    }
}

//ɾ�����
void fibheapDelete(fibheap *heap, fibnode *x) {
    fibheapDecrease(heap, x, 0);//0��С��
    //printf("decrease OK,H->min->key=%d\n",heap->min->key);
    fibheapExtractMin(heap);
    //printf("extract OK\n");
}

//��fibheapSearch����
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

//���������ؼ���
fibnode *fibheapSearch(fibheap *heap, int key) {
    return fibnodeSearch(heap->min, key);
}

//��fibheapDestory����
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

//���ٶ�
void fibheapDestory(fibheap *heap) {
    fibnodeDestory(heap->min);
    free(heap);
    heap = NULL;
}



