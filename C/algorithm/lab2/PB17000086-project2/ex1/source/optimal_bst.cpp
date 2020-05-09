#include<stdio.h>
#include<math.h>
#include<windows.h>

void optimal_bst(float *p,float *q,int n,float e[][25],int root[][25])
{
    float w[25][25];
    int i,j,r,l;
    float t;
    for(i=1;i<=n+1;i++)
    {
        e[i][i-1]=q[i-1];
        w[i][i-1]=q[i-1];
    }
    for(l=1;l<=n;l++)
    {
        for(i=1;i<=n-l+1;i++)
        {
            j=i+l-1;
            e[i][j]=255;       //大
            w[i][j]=w[i][j-1]+p[j]+q[j];
            for(r=i;r<=j;r++)
            {
                t=e[i][r-1]+e[r+1][j]+w[i][j];
                if(t < e[i][j])
                {
                    e[i][j]=t;
                    root[i][j]=r;
                }
            }
        }
    }
    /*for(i=1;i<=n+1;i++)
    {
        for(j=i-1;j<=n;j++)
            printf(" %f ",e[i][j]);
        printf("\n");
    }*/
}
void preorder_traverse(int root[][25],int i,int j,FILE* fout){
    int t;
    if(i == j)
        fprintf(fout," k%d d%d d%d",i,i-1,i);
    else if(i == j+1)
        fprintf(fout," d%d",j);
    else{
        t=root[i][j];
        fprintf(fout," k%d",t);
        preorder_traverse(root,i,t-1,fout);
        preorder_traverse(root,t+1,j,fout);
    }
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
    FILE* fin=fopen("../input/input.txt","r");
    FILE* fout_time=fopen("../output/time.txt","w+");
    FILE* fout_result=fopen("../output/result.txt","w+");

    int i,j;
    int n;
    float p[25],q[25],e[25][25];
    int root[25][25];

    for(int i=0;i<5;i++)
    {
        ///input
        fscanf(fin,"%d",&n);
        for(j=1;j<=n;j++) fscanf(fin,"%f",p+j);             //[1:n]
        for(j=0;j<=n;j++) fscanf(fin,"%f",q+j);             //[0:n]
        //for(j=1;j<=n;j++) printf("%f %f\n",p[j],q[j]);
        ///
        QueryPerformanceCounter(&time_start);	    //计时开始
        optimal_bst(p,q,n,e,root);                  //ex
        QueryPerformanceCounter(&time_over);	    //计时结束
        run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;

        ///output
        printf("n=%d ,run_time：%lf sec\n",n,run_time);
        fprintf(fout_time,"n=%d ,run_time：%lf sec\n",n,run_time);
        //e[1,n]
        fprintf(fout_result,"%f,",e[1][n]);
        //print tree
        preorder_traverse(root,1,n,fout_result);
        fprintf(fout_result,"\n");
    }
    fclose(fin);
    fclose(fout_time);
    fclose(fout_result);
	return 0;
}
