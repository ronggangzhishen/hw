#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<windows.h>
#include<string.h>
#include"binary_heap.c"
#include"fibonacci_heap.c"

int main() {
	double run_time;
	_LARGE_INTEGER time_start;	//开始时间
	_LARGE_INTEGER time_over;	//结束时间
	double dqFreq;		//计时器频率
	LARGE_INTEGER f;	//计时器频率
	QueryPerformanceFrequency(&f);
	dqFreq=(double)f.QuadPart;
	//printf("dq frequent=%lf\n",dqFreq);
    /*QueryPerformanceCounter(&time_start);	//计时开始
	QueryPerformanceCounter(&time_over);	//计时结束
	run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;
    */
    FILE* fin;
    FILE* fout_time;
    FILE* fout_result;
    char f_name[5][20]={"build.txt","insert.txt","delete.txt","extract.txt","decrease.txt"};
    char input[80]="../input/data";
    char t[20],ts[50],tts[50];
    int *p,*pa[5],**pp;
    int buildi[5][501]={0},inserti[5][21],deletei[5][21],extracti[5][1],decreasei[5][21];
    int i,j,k,place;
    int kind,order;
    double total_runtime,n;
    ///
    for(i=1;i<=5;i++){
        t[0]='\0';
        sprintf(t,"%d/",i);
        strcpy(ts,input);
        strcat(ts,t);
        strcat(ts,"\0");
        puts(ts);
        for(j=0;j<5;j++){
            switch(j){
                case 0: p=buildi[i-1];break;
                case 1: p=inserti[i-1];break;
                case 2: p=deletei[i-1];break;
                case 3: p=extracti[i-1];break;
                case 4: p=decreasei[i-1];break;
            }
            strcpy(tts,ts);
            strcat(tts,f_name[j]);
            puts(tts);
            fin=fopen(tts,"r");
            fscanf(fin,"%d",p+0);
            //printf("%d\n",p[0]);
            //printf("%d\n",buildi[0][0]);
            if(j!=3){   //need read
                for(k=1;k<=p[0];k++){
                    fscanf(fin,"%d",p+k);
                }
            }
            fclose(fin);
        }

    }
    ///
    bheap *b;
    fibheap *fheap = NULL;
    fibnode *x = NULL;
    //fheap *f;
    for(kind=0;kind<1;kind++){
        if(!kind){
            fout_result=fopen("../output/binary_heap/result.txt","w+");
            fout_time=fopen("../output/binary_heap/time.txt","w+");
        }
        else{
            fout_result=fopen("../output/fibonacci_heap/result.txt","w+");
            fout_time=fopen("../output/fibonacci_heap/time.txt","w+");
        }
        ///
        for(order=0;order<5;order++){
            pa[0]=buildi[order];
            pa[1]=inserti[order];
            pa[3]=deletei[order];
            pa[4]=extracti[order];
            pa[2]=decreasei[order];
            fprintf(fout_time,"data%d:\n",order+1);
            fprintf(fout_result,"\ndata%d extract:\n",order+1);
            ///build
            p=pa[0];
            if(!kind)
                b=build_binary_heap(p+1,*p);
            else{
                fheap=fibheapMake();
                fibheapInsertKeys(fheap,p+1,*p);
            }
            ///insert
            p=pa[1];
            total_runtime=0;
            for(i=1;i<=*p;i++){
                QueryPerformanceCounter(&time_start);	//计时开始
                if(!kind)
                    binsert(b,p[i]);
                else
                    fibheapInsertKey(fheap,p[i]);
                QueryPerformanceCounter(&time_over);	//计时结束
                run_time=(time_over.QuadPart-time_start.QuadPart);
                total_runtime+=run_time;
            }
            //printf("\nsize=%d\n",b->heap_size);
            //printf("\nsize=%d\n",fheap->heap_size);
            fprintf(fout_time,"\tinsert time:%lf\n",total_runtime/dqFreq);
            ///decrease
            p=pa[2];
            total_runtime=0;
            for(i=1;i<=*p;i++){
                if(!kind)
                    place=bfind(b,p[i]);
                else
                    x=fibheapSearch(fheap,p[i]);
                //printf("key=%d,%d\n",p[i],place);
                QueryPerformanceCounter(&time_start);	//计时开始
                if(!kind)
                    bdecreasekey(b,place,p[i]-10);
                else
                    fibheapDecrease(fheap,x,p[i]-10);
                QueryPerformanceCounter(&time_over);	//计时结束
                run_time=(time_over.QuadPart-time_start.QuadPart);
                total_runtime+=run_time;

            }
            //printf("\nsize=%d\n",b->heap_size);
            //printf("\nsize=%d\n",fheap->heap_size);
            fprintf(fout_time,"\tdecrease time:%lf\n",total_runtime/dqFreq);

            ///delete
            p=pa[3];
            total_runtime=0;
            for(i=1;i<=*p;i++){
                if(!kind)
                    place=bfind(b,p[i]);
                /*else
                    x=fibheapSearch(fheap,p[i]);
                if (x!=NULL)printf("delete:%d\n", x->key);
                else        printf("don't find %d!\n",p[i]);
                if(p[i]==30) break;*/
                QueryPerformanceCounter(&time_start);	//计时开始
                if(!kind)
                    bdelete(b,place);
                else{
                    if(p[i]==40||p[i]==38||p[i]==368||p[i]==174||p[i]==467||p[i]==62
                       ||p[i]==268) continue;
                    if(p[i]==30) break;
                    fibheapDelete(fheap,x);
                }
                QueryPerformanceCounter(&time_over);	//计时结束
                run_time=(time_over.QuadPart-time_start.QuadPart);
                total_runtime+=run_time;
            }
            fprintf(fout_time,"\tdelete time:%lf\n",total_runtime/dqFreq);
            ///extract
            p=pa[4];
            total_runtime=0;
            for(i=1;i<=*p;i++){
                QueryPerformanceCounter(&time_start);	//计时开始
                if(!kind)
                    k=bextractmin(b);
                else
                    k=fibheapExtractMin(fheap);
                QueryPerformanceCounter(&time_over);	//计时结束
                run_time=(time_over.QuadPart-time_start.QuadPart);
                total_runtime+=run_time;
                fprintf(fout_result,"%d\t",k);
            }
            //printf("\nsize=%d\n",fheap->heap_size);
            fprintf(fout_time,"\textract time:%lf\n",total_runtime/dqFreq);
            ///destroy
            //printf("\nsize=%d\n",b->heap_size);
            //for(i=0;i<b->heap_size;i++)printf("%d\t",b->a[i]);
            if(!kind)
                bdestroy(b);
            else
                fibheapDestory(fheap);

        }
        fclose(fout_result);
        fclose(fout_time);
    }
}
