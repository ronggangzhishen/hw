#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<windows.h>
#include"matcher.c"

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
    FILE* fin=fopen("../input/input_strings.txt","r");
    FILE* fout;

    int i,j,k,pare;
    int kind,scale,n,m;
    int shift;
    int (*pf[4])(char* T,char* P,int n,int m);  //point to 4 match
    pf[0]=naive_matcher;
    pf[1]=RK_matcher;
    pf[2]=KMP_matcher;
    pf[3]=BMH_matcher;
    char *T[5],*P[5];

    if(fin == NULL)
        return 0;
    for(i=0;i<5;i++){
        n=(int)pow(2,5+3*i);
        m=(int)pow(2,2+i);
        //printf("n=%d m=%d\n",n,m);
        T[i]=(char *)malloc((n+1)*sizeof(char));
        P[i]=(char *)malloc((m+1)*sizeof(char));
        if(T[i] == NULL) printf("no enough space\n");
        for(j=0;j<n;j++) fscanf(fin,"%c",T[i]+j); T[i][j]='T';
        fgetc(fin); //\n
        for(j=0;j<m;j++) fscanf(fin,"%c",P[i]+j);    P[i][j]='P';
        fgetc(fin); //\n
        //puts(T[i]);puts(P[i]);
    }
    fclose(fin);
    pare=i;

    for(kind=0;kind<4;kind++)
    {
        switch(kind){
            case 0:fout=fopen("../output/naive/output.txt","w+"); break;
            case 1:fout=fopen("../output/Rabin-karp/output.txt","w+"); break;
            case 2:fout=fopen("../output/KMP/output.txt","w+"); break;
            case 3:fout=fopen("../output/Boyer-Moore-Horspool/output.txt","w+"); break;
        }
        printf("kind=%d\n",kind);
        for(scale=0;scale<pare;scale++){//scale*3+2,scale+1
            n=(int)pow(2,5+3*scale);
            m=(int)pow(2,2+scale);
            QueryPerformanceCounter(&time_start);	//计时开始
            shift=pf[kind](T[scale],P[scale],n,m);
            QueryPerformanceCounter(&time_over);	//计时结束
            run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;
            fprintf(fout,"n=%d m=%d P occurs with shift %d,cost %lf s\n",n,m,shift,run_time);
            printf("P occurs with shift %d,cost %lf s\n",shift,run_time);
        }
        fclose(fout);
    }
    for(j=0;j<pare;j++){
        free(T[j]);
        free(P[j]);
    }
    return 0;
}
