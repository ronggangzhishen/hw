#include<iostream>
#include<queue>
#include<cstdio>
#include<vector>
#include<utility>
using namespace std;
#define MAX_VERTEX_NUM 729

const int inf=0xffffff;
typedef pair<int,int> pii;
vector<pii> edge[MAX_VERTEX_NUM+2];
int dis[MAX_VERTEX_NUM+2][MAX_VERTEX_NUM+2];
int mapping[MAX_VERTEX_NUM+2];
int V,E;

bool adjust()
{

	queue<int> q;
	//bool vis[MAX_VERTEX_NUM+2];
	int maxlength=0;
	for(int i=1;i<=V;++i)
	{
		mapping[i]=inf;
		//vis[i]=false;
	}
	mapping[V+1]=0;
	q.push(V+1);                        //新加的结点编号为V+1，到其他点0weight
	while(!q.empty())
	{
	    if(maxlength >= V)              //最短路径至多经过n个结点
            break;
        else
            maxlength++;
		int u=q.front();
		q.pop();
		for(int i=0;i<edge[u].size();i++)
		{
			int v=edge[u][i].first;     //vex v
			int w=edge[u][i].second;    //weight w
			if(mapping[v]>mapping[u]+w) //can relax
			{
				mapping[v]=mapping[u]+w;///mapping 即为书上 h
				q.push(v);              //所有邻顶进队，即使已被访问
			}
		}
	}
	///至此无负环的图已完成标记
	///下面检测负环
    for(int u=1;u<=V;u++)
    {
        for(int i=0;i<edge[u].size();i++)
        {
            int v=edge[u][i].first;     //vex v
			int w=edge[u][i].second;    //weight w
			if(mapping[v]>mapping[u]+w) ///have one can relax
            {
                printf("!! have - circle\n");
                return false;           ///then have -circle
            }
        }
    return true;
    }
}
void Dijkstra(int st,int *pi)//pi[] record path
{
	priority_queue<pii> q;
	bool vis[MAX_VERTEX_NUM+1];
	for(int i=1;i<=V;++i){
		dis[st][i]=inf;
		vis[i]=false;
	}
	dis[st][st]=0;
	vis[st]=true;               //源点并入S
	q.push(make_pair(0,st));
	while(!q.empty())
	{
		pii u=q.top();
		q.pop();
		if(dis[st][u.second]<u.first) continue;  //经过u一定大于已知最短路径，continue
		for(int i=0;i<edge[u.second].size();i++) //对 u 代表的点邻点
		{
			int v=edge[u.second][i].first;
			int w=edge[u.second][i].second;
			if(!vis[v] && dis[st][v]>dis[st][u.second]+w)   //can relax
			{
			    vis[v]=true;                     //并入S,后续不再考虑它
				dis[st][v]=dis[st][u.second]+w;
				pi[v]=u.second;                  //v 前驱为 u.second
				q.push(make_pair(dis[st][v],v));
			}
		}
	}
}
void johnson(FILE *fout)
{
	adjust();
	for(int i=1;i<=V;i++)
		for(int j=0;j<edge[i].size();j++)
			edge[i][j].second+=mapping[i]-mapping[edge[i][j].first];
    ///record precursor
    int pi[MAX_VERTEX_NUM+2];
    //printf("adjust ok\n");
	for(int i=1;i<=V;i++){
		Dijkstra(i,pi);
		//printf("start from %d\n",i);
		for(int j=1;j<=V;j++){
            if(j != i && dis[i][j] < inf)///have path
            {
                int u=j;
                fprintf(fout,"%d<%d,%d\n",j,i,dis[i][j]+mapping[j]-mapping[i]);
                while(u != i){
                    fprintf(fout,"%d<",u);
                    u=pi[u];
                }
                fprintf(fout,"%d\n",i);
            }
		}
	}
}
/*int main()
{
	int n,m;
    FILE *fin=fopen("input.txt","r");
	fscanf(fin,"%d %d",&n,&m);
	for(int i=1;i<=n;++i)
		edge[n+1].push_back(make_pair(i,0));
	for(int i=1;i<=m;++i)
	{
		int fr,to,w;
		fscanf(fin,"%d %d %d",&fr,&to,&w);
		edge[fr].push_back(make_pair(to,w));
	}
    fclose(fin);

	johnson();

	for(int i=1;i<=n;i++)
	{
		for(int j=1;j<=n;++j)
			if(dis[i][j]!=inf)
				printf("%5d",dis[i][j]+mapping[j]-mapping[i]);
			else
				printf("  INF");
		printf("\n");
	}
	return 0;
}*/
