#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<string.h>
#include<windows.h>
#include"graph.cpp"
extern int V,E;     //in graph.cpp
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
    char sin[20]="../input/input";
    char sout[20]="../output/result";
    FILE* fin_input;
    FILE* fout_result;
    FILE* fout_time=fopen("../output/time.txt","w+");

	int i,j,k,kind,scale;
	char ts[2]={0},tsin[30],tsout[30],ttsin[30],ttsout[30];

    int u,v,w;

    for(kind=1;kind<=4;kind++){
        ///fin,fout
        ts[0]='\0';
        sprintf(ts,"%d",kind);

        strcpy(ttsin,sin);
        strcat(ttsin,ts);
        strcpy(ttsout,sout);
        strcat(ttsout,ts);

        for(scale=1;scale<=2;scale++){
            ts[0]='\0';
            sprintf(ts,"%d",scale);
            strcpy(tsin,ttsin);
            strcpy(tsout,ttsout);
            strcat(tsin,ts);
            strcat(tsin,".txt");
            strcat(tsout,ts);
            strcat(tsout,".txt");
            ///scan and build
            V=(int)(9*pow(3,kind)+0.5);
            if(scale==1)    E=(int)(V*log(V)/log(5)+0.5);
            else            E=(int)(V*log(V)/log(7)+0.5);
            printf("V=%d,E=%d\n",V,E);
            fin_input=fopen(tsin,"r");
            for(int i=1;i<=V;i++)
                edge[V+1].push_back(make_pair(i,0));
            for(int i=1;i<=V;i++)
                if(!edge[i].empty())
                    printf("delete fail\n");
            for(int i=1;i<=E;i++)
            {
                fscanf(fin_input,"%d %d %d",&u,&v,&w);
                edge[u].push_back(make_pair(v,w));
            }
            fclose(fin_input);
            //printf("graph ok\n");
            ///file_out
            fout_result=fopen(tsout,"w+");
            ///cal & print components
            QueryPerformanceCounter(&time_start);	//计时开始
            johnson(fout_result);                   ///print within dijkstra
            QueryPerformanceCounter(&time_over);	//计时结束
            run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;
            ///print time
            fprintf(fout_time,"V=%d\tE=%d\tcost %lf s\n",V,E,run_time);

            ///destroy graph
            for(int i=0;i<=V+1;i++)
                edge[i].clear();
            fclose(fout_result);
        }
    }

    fclose(fout_time);
    return 0;
}
