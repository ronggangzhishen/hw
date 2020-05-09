#include<stdio.h>
#include<math.h>
#include<windows.h>

void lcs_length(char *x,int m,char *y,int n,int c[][61],int b[][61])
{
    int i,j;
    for(i=1;i<=m;i++)
        c[i][0]=0;
    for(j=0;j<=n;j++)
        c[0][j]=0;
    for(i=1;i<=m;i++)
    {
        for(j=1;j<=n;j++)
        {
            if(x[i-1] == y[j-1]){
                c[i][j]=c[i-1][j-1]+1;
                b[i][j]=2;          //↖
            }
            else if(c[i-1][j] >= c[i][j-1]){
                c[i][j]=c[i-1][j];
                b[i][j]=1;          //↑
            }
            else{
                c[i][j]=c[i][j-1];
                b[i][j]=0;          //←
            }
        }
    }
    /*printf(" ");
    for(j=1;j<=n;j++) printf("  %c",y[j-1]);
    printf("\n");
    for(i=1;i<=m;i++){
        printf(" %c",x[i-1]);
        for(j=1;j<=n;j++){
            if(b[i][j] == 2)     printf(" ↖");
            else if(b[i][j] == 1)printf(" ↑");
            else                 printf(" ←");
        }
        printf("\n");
    }*/
}

void print_lcs(FILE* fout,int b[][61],char *x,int i,int j)
{
    if(i == 0 || j == 0) return ;
    if(b[i][j] == 2){               //left-up
        print_lcs(fout,b,x,i-1,j-1);
        fprintf(fout,"%c",x[i-1]);
    }
    else if(b[i][j] == 1)           //up
         print_lcs(fout,b,x,i-1,j);
    else print_lcs(fout,b,x,i,j-1);
}

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
    FILE* fin;
    FILE* fout_time=fopen("../output/time.txt","w+");
    FILE* fout_result=fopen("../output/result.txt","w+");

    int i,j,k;
    int len1,len2;
    char s1[90],s2[90];
    int b[91][61],c[91][61];

    for(int i=0;i<2;i++)
    {
        if(i == 0) {
            fin=fopen("../input/inputA.txt","r");
            len1=16;
            len2=10;
        }
        else{
            fin=fopen("../input/inputB.txt","r");
            len1=15;
            len2=26;
        }
        for(j=0;j<6;j++)
        {
            ///input
            fscanf(fin,"%s",s1);
            fscanf(fin,"%s",s2);/*
            for(k=0;k<90;k++) printf("%c",s1[k]);
            printf("\n");
            for(k=0;k<90;k++) printf("%c",s2[k]);
            printf("\n");*/

            ///
            QueryPerformanceCounter(&time_start);	    //计时开始
            lcs_length(s1,len1,s2,len2,c,b);            //ex
            QueryPerformanceCounter(&time_over);	    //计时结束
            run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;

            ///output
            printf("len1=%d,len2=%d ,run_time：%lf sec\n",len1,len2,run_time);
            fprintf(fout_time,"len1=%d,len2=%d ,run_time：%lf sec\n",len1,len2,run_time);
            fprintf(fout_result,"(%d,%d) lcs %d ",len1,len2,c[len1][len2]);
            print_lcs(fout_result,b,s1,len1,len2);
            fprintf(fout_result,"\n");

            ///for next loop
            if(i == 0) len2+=10;
            else       len1+=15;
        }

        fclose(fin);
    }
    fclose(fout_time);
    fclose(fout_result);
	return 0;
}
