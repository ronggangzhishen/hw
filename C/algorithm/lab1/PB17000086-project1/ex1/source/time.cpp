#include<stdio.h>
#include<math.h>
#include<windows.h>
#include"merge_sort.c"
#include"heap_sort.c"
#include"quick_sort.c"
#include"counting_sort.c"

int main() {

	double run_time;
	_LARGE_INTEGER time_start;	//开始时间
	_LARGE_INTEGER time_over;	//结束时间
	double dqFreq;		//计时器频率
	LARGE_INTEGER f;	//计时器频率
	QueryPerformanceFrequency(&f);
	dqFreq=(double)f.QuadPart;
    /*QueryPerformanceCounter(&time_start);	//计时开始
	QueryPerformanceCounter(&time_over);	//计时结束
	run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;
    */
    FILE* fin=fopen("../input/input_string.txt","r");
    FILE* fout;
    char f_name[7][80];  //output file name
    FILE* foutt;            //for time.txt
    char f_time[80];

    int i,j,k;
    int kind,scale,r;
    char ts[2];
    int input[32768];
    int output[32768];

    void (*pf[4])(int* A,int p,int r);  //point to 4 sort fun
    pf[0]=merge_sort;
    pf[1]=heap_sort;
    pf[2]=quick_sort;
    pf[3]=counting_sort;

    ///input data
    for(i=0;i<32768;i++)
        fscanf(fin,"%d",input+i);
    fclose(fin);

    ///in order of merge,heap,quick,counting
    for(kind=0;kind<4;kind++)
    {
        switch(kind){
            case 0:{ for(i=0;i<7;i++) strcpy(f_name[i],"../output/merge_sort/");
                break;
                }
            case 1:{ for(i=0;i<7;i++) strcpy(f_name[i],"../output/heap_sort/");
                break;
                }
            case 2:{ for(i=0;i<7;i++) strcpy(f_name[i],"../output/quick_sort/");
                break;
                }
            case 3:{ for(i=0;i<7;i++) strcpy(f_name[i],"../output/counting_sort/");
                break;
                }
        }
        strcpy(f_time,f_name[0]);
        strcat(f_time,"time.txt");  //time.txt 路径完成
        //puts(f_time);
        foutt=fopen(f_time,"w+");   //open time.txt
        ///in order of 2^3,5,7,9,11,13,15
        for(scale=3;scale<16;scale+=2){
            ts[0]='\0'; ts[1]='\0';     //temp字符串清空
            sprintf(ts,"%d",scale);
            strcat(f_name[scale/2-1],"result_");
            strcat(f_name[scale/2-1],ts);
            strcat(f_name[scale/2-1],".txt");//result_?.txt路径完成
            puts(f_name[scale/2-1]);

            r=(int)(pow(2,scale)+0.5)-1;
            for(i=0;i<=r;i++) output[i]=input[i];

            QueryPerformanceCounter(&time_start);	    //计时开始
            pf[kind](output,0,r);                          //sort 0,2^scale-1
            QueryPerformanceCounter(&time_over);	    //计时结束
            run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;

            printf("run_time：%lf s\n",run_time);
            fprintf(foutt,"2^%d ,run_time：%lf sec\n",scale,run_time);

            fout = fopen(f_name[scale/2-1],"w+");       //open result_?.txt
            for(i=0;i<=r;i++)
                fprintf(fout,"%d\n",output[i]);
            fclose(fout);
        }
        fclose(foutt);

    }
	return 0;
}
