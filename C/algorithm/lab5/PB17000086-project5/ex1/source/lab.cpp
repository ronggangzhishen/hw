#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<string.h>
#include<windows.h>
#include"graph.c"

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

	int i,j,k,kind;
	char ts[2]={0},tsin[20],tsout[20];

    int V,E;
    int u,v,*pt1;
    graph *g;
    int *g_fin;
    graph *gt;
    arcnode *p;

	for(kind=1;kind<=5;kind++){
		///fin
		strcpy(tsin,sin);
		ts[0]='\0';
		sprintf(ts,"%d",kind);
		strcat(tsin,ts);
		strcat(tsin,".txt");
		puts(tsin);
		fin_input=fopen(tsin,"r");
		///scan and build
		g=(graph *)malloc(sizeof(graph));
        V=(int)(3*pow(3,kind)+0.5);
        E=(int)(V*log(V)/log(3)+0.5);
        printf("V=%d,E=%d\n",V,E);
        g->vexnum=V;
        g->arcmun=E;
        for(i=1;i<=V;i++) g->vertices[i].firstarc=NULL;
        for(i=0;i<E;i++){
            fscanf(fin_input,"%d %d",&u,&v);
            insertarc(g,u,v);
        }
		fclose(fin_input);
		//printgraph(g);
		///file_out
		strcpy(tsout,sout);
		strcat(tsout,ts);
		strcat(tsout,".txt");
		puts(tsout);
		fout_result=fopen(tsout,"w+");
		///cal & print components
		QueryPerformanceCounter(&time_start);	//计时开始

		//visit g
		dfs(g);
		//fin ok,record
		g_fin=(int *)malloc(V*sizeof(int));
		memcpy(g_fin,fin,V*sizeof(int));
		//printf("fin= ");for(i=0;i<V;i++)printf("%d %d,",fin[i],g_fin[i]); printf("\n");
		//compute g't
		gt=(graph *)malloc(sizeof(graph));
		for(i=1;i<=V;i++) gt->vertices[i].firstarc=NULL;
		gt->arcmun=E;
		gt->vexnum=V;
        for(u=1;u<=g->vexnum;u++)
        {
            for(p=g->vertices[u].firstarc;p;p=p->nextarc){
                v=p->adjvex;
                insertarc(gt,v,u);
            }
        }
        //printgraph(gt);
		//visit g't
        for(i=1;i<=gt->vexnum;i++){
            color[i]=0;
        }
        time=0;
        pfin=fin;
		//visit by g_fin order
        for(i=0;i<gt->vexnum;i++){
            pt1=pfin;
            if(!color[g_fin[i]])
                dfs_visit(gt,g_fin[i]);
            //if fin change
            if(pt1!=pfin){
                fprintf(fout_result,"(");
                for( ;*pt1!=*pfin;pt1++){
                    fprintf(fout_result,"%d,",*pt1);
                }
                fprintf(fout_result,")\n");
            }
        }
        QueryPerformanceCounter(&time_over);	//计时结束
        run_time=(time_over.QuadPart-time_start.QuadPart)/dqFreq;
		///print time
        fprintf(fout_time,"V=%d\tcost %lf s\n",V,run_time);
		free(g_fin);
        destroygraph(g);
        destroygraph(gt);
		fclose(fout_result);
	}
    fclose(fout_time);
    return 0;
}
