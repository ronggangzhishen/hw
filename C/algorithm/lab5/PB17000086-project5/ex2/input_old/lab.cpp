#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<string.h>
#include<windows.h>
#include"../source/graph.cpp"
extern int V,E;
int main() {
    char sin[20]="input";
    //char sout[20]="result";
    FILE* fin_input;
    //FILE* fout_result;
    //FILE* fout_time=fopen("../output/time.txt","w+");

	int kind,scale;
	char ts[2]={0},tsin[30],tsout[30],ttsin[30],ttsout[30];


    int u,v,w;


    for(kind=1;kind<=4;kind++){
        ///fin,fout
        ts[0]='\0';
        sprintf(ts,"%d",kind);

        strcpy(ttsin,sin);
        strcat(ttsin,ts);
        //strcpy(ttsout,sout);
        //strcat(ttsout,ts);

        for(scale=1;scale<=2;scale++){
            ts[0]='\0';
            sprintf(ts,"%d",scale);
            strcpy(tsin,ttsin);
            //strcpy(tsout,ttsout);
            strcat(tsin,ts);
            strcat(tsin,".txt");
            //strcat(tsout,ts);
            //strcat(tsout,".txt");
            puts(tsin);
            //puts(tsout);
            ///scan and build
            V=(int)(9*pow(3,kind)+0.5);
            if(scale==1)    E=(int)(V*log(V)/log(5)+0.5);
            else            E=(int)(V*log(V)/log(7)+0.5);
            printf("V=%d,E=%d\n",V,E);
            fin_input=fopen(tsin,"r");
            for(int i=1;i<=V;i++)
                edge[V+1].push_back(make_pair(i,0));
            for(int i=1;i<=E;i++)
            {
                fscanf(fin_input,"%d %d %d",&u,&v,&w);
                edge[u].push_back(make_pair(v,w));
            }
            fclose(fin_input);
            ///have - circle???
            if(!adjust())
                printf("%s has minus circle\n",tsin);
            ///destroy graph
            for(int i=1;i<=V+1;i++)
            {
                edge[i].clear();
            }
        }
    }
    return 0;
}
