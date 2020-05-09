#include<stdio.h>
#include<math.h>
#include<string.h>
#include<stdlib.h>
#include<iostream>
#include<queue>
#include<map>
#include<cstdio>
#include<vector>
#include<utility>

using namespace std;

#define N 5
#define N2 25
#define LIMIT 77

const int dx[4] = {-1,1,0,0};
const int dy[4] = {0,0,-1,1};
const char dir[4] = {'u','d','l','r'};
int MDT[N2][N2];

struct ptstate {
    char f[N2];
    int aof7;
    int space[2];  //维护space[0] < space[1]
    int cost;           //
    int MD;             //到终态的曼哈顿距离
    bool operator < (const ptstate &p)const {
        for(int i = 0;i < N2;i++) {
            if(f[i] == p.f[i]) continue;
            return f[i] < p.f[i];
        }
        return false;
    }
};
struct openListNode {
    ptstate pts;
    //openListNode *next;
    openListNode *pre;    //指向上一次移动
    int estimated;        //estimated=f = g + h=currentcost+MDT
    int num,dir;          //记录如何到这个状态的数字和移动方向
    bool operator < (const openListNode &s) const {
        return estimated > s.estimated;
    }
};
struct cmpNodepointer {
    bool operator() (openListNode* &a, openListNode* &b) const {
        return a-> estimated > b->estimated;
    }
};
int getMd(ptstate pz) {
    int sum = 0;
    for(int i = 0;i < N2;i++) {
        char t=pz.f[i];
        char pret=t;
        if (t == N2)        //space at 23,24
            continue;
        else if(t < 5)      //1~5 to 0~4
            t--;
        else if(t == 'a')   //a to 5
            t = 5;
        else if(t == 'b')   //b to 6
            t = 6;
        else if(t == 6)     //6 to 10
            t = 10;
        else if(t == 'c')   //c to 11
            t = 11;
        else if(t < 11)      //8~10 to 7~9
            t--;
        else                 //11~21 to 12~22
            t++;
        /*if(pret == 'a' || pret == 'b' || pret == 'c')
            sum += 6*MDT[i][t];
        else*/
            sum += MDT[i][t];
    }
    return sum;
}

//传入叶结点, 顺序输出从跟结点开始的路径
void printpath(openListNode* pnode, FILE* fout){
    printpath(pnode->pre, fout);
    if(pnode->pre != NULL)  //不为根
        fprintf(fout,"(%d,%c); ", pnode->num, dir[pnode->dir]);
    return ;
}

int astar(ptstate s, FILE* fout) {
    map<ptstate,bool> V;
    ptstate u,v;
    int sx[2],sy[2];

    priority_queue<openListNode*, vector<openListNode*>, cmpNodepointer> PPQ;
    //priority_queue<openListNode> PQ;
    s.MD = getMd(s);
    s.cost = 0;
    openListNode *init = new openListNode;
    init->pts = s;
    init->pre = NULL;
    init->estimated = s.MD;
    PPQ.push(init);
    while(!PPQ.empty()) {
        openListNode *pnode = PPQ.top();            //取最小结点
        PPQ.pop();
        u = pnode->pts;
        //debug
        //printf("f = %d, g = %d, h = %d\n",node.estimated,u.cost,u.MD);

        if(u.MD == 0) {
            //print path
            //if(fout) printpath(pnode, fout);
            while(pnode->pre){
                fprintf(fout,"(%d,%c) <- ", pnode->num, dir[pnode->dir]);
                pnode = pnode->pre;
            }
            fprintf(fout,"root\n");

            return u.cost;    //已匹配
        }

        V[u] = true;                    //已访问过

        sx[0] = u.space[0] / N;sy[0] = u.space[0] % N;
        sx[1] = u.space[1] / N;sy[1] = u.space[1] % N;
        int ax = u.aof7 / N;      int ay = u.aof7 % N;

        /**********move 77777777777*******/
        //1 up, 2 down, 3 left, 4 right
        int ifmove7 = (u.space[0] == u.aof7-N && u.space[1] == u.aof7-N+1) ? 1:
        ((u.space[0] == u.aof7+N && u.space[1] == u.aof7+2*N+1) ? 2 :
        ((u.space[0] == u.aof7-1 && u.space[1] == u.aof7+N) ? 3 :
        ((u.space[0] == u.aof7+2 && u.space[1] == u.aof7+N+2) ? 4 : 0)));
        if(ifmove7){
            v=u;
            //move space
            switch (ifmove7) {
            case 1: v.space[0] = v.aof7; v.space[1] = v.aof7+N+1; break;
            case 2: v.space[0] = v.aof7; v.space[1] = v.aof7+1; break;
            case 3: v.space[0] = v.aof7+1; v.space[1] = v.aof7+N+1; break;
            case 4: v.space[0] = v.aof7; v.space[1] = v.aof7+N+1; break;
            default: break;
            }
            v.f[v.space[0]] = N2;
            v.f[v.space[1]] = N2;
            //move 7
            ax += dx[ifmove7-1];
            ay += dy[ifmove7-1];
            v.aof7 = ax*N + ay;
            v.f[v.aof7] = 'a';
            v.f[v.aof7+1] = 'b';
            v.f[v.aof7+N+1] = 'c';
            v.MD = getMd(v);
            if(!V[v]) {
                v.cost++;
                //openListNode now;
                openListNode *now = new openListNode;
                now->pts = v;
                now->estimated = v.cost + v.MD;
                now->pre = pnode;        //指向生成它的结点
                now->num = 7; now->dir = ifmove7-1;
                PPQ.push(now);
            }
        }
        /*******move normal*****/
        //two space and 4 direction, 8 kinds with one block
        for(int s = 0;s < 2;s++){           //2 space
            for(int r = 0;r < 4;r++) {      //4 direction
                int tx = sx[s] + dx[r];
                int ty = sy[s] + dy[r];

                //不越界,不为a,b,c
                if(tx < 0 || ty < 0 || tx >= N || ty >= N ||
                    (tx == ax && ty == ay || tx == ax && ty == ay+1 || tx == ax+1 && ty == ay+1))
                    continue;
                v = u;
                int num = v.f[tx * N + ty];
                swap(v.f[sx[s] * N + sy[s]], v.f[tx * N + ty]);  //移动该空格
                v.space[s] = tx * N + ty;
                if (v.space[0] > v.space[1]) swap(v.space[0],v.space[1]);   //维护空格顺序
                v.MD = getMd(v);

                if(!V[v]) {
                    v.cost++;
                    //openListNode now;
                    openListNode *now = new openListNode;
                    now->pts = v;
                    now->estimated = v.cost + v.MD;
                    now->pre = pnode;        //指向生成它的结点
                    now->num = num;
                    //r 为空格移动方向,数字需反向
                    now->dir = r==0 ? 1 : r==1 ? 0: r==2? 3 : r==3? 2:5;
                    PPQ.push(now);
                }
            }
        }
    }
    return -1;
}

ptstate pt;
int limit;
int direction[LIMIT];   //record path
int number[LIMIT];

bool dfs(int depth, int prer) {
    if (pt.MD == 0) return true;
    if (depth + pt.MD > limit) return false;
    ptstate tmp;                //记录未更改的pt

    int sx[2],sy[2];

        sx[0] = pt.space[0] / N;sy[0] = pt.space[0] % N;
        sx[1] = pt.space[1] / N;sy[1] = pt.space[1] % N;
        int ax = pt.aof7 / N;      int ay = pt.aof7 % N;

        /**********move 77777777777*******/
        //1 up, 2 down, 3 left, 4 right
        int ifmove7 = (pt.space[0] == pt.aof7-N && pt.space[1] == pt.aof7-N+1) ? 1:
        ((pt.space[0] == pt.aof7+N && pt.space[1] == pt.aof7+2*N+1) ? 2 :
        ((pt.space[0] == pt.aof7-1 && pt.space[1] == pt.aof7+N) ? 3 :
        ((pt.space[0] == pt.aof7+2 && pt.space[1] == pt.aof7+N+2) ? 4 : 0)));
        if(ifmove7){
            tmp=pt;
            //move space
            switch (ifmove7) {
            case 1: pt.space[0] = pt.aof7; pt.space[1] = pt.aof7+N+1; break;
            case 2: pt.space[0] = pt.aof7; pt.space[1] = pt.aof7+1; break;
            case 3: pt.space[0] = pt.aof7+1; pt.space[1] = pt.aof7+N+1; break;
            case 4: pt.space[0] = pt.aof7; pt.space[1] = pt.aof7+N+1; break;
            default: break;
            }
            pt.f[pt.space[0]] = N2;
            pt.f[pt.space[1]] = N2;
            //move 7
            ax += dx[ifmove7-1];
            ay += dy[ifmove7-1];
            pt.aof7 = ax*N + ay;
            pt.f[pt.aof7] = 'a';
            pt.f[pt.aof7+1] = 'b';
            pt.f[pt.aof7+N+1] = 'c';
            pt.MD = getMd(pt);

            if(dfs(depth + 1, ifmove7 - 1)) {
                direction[depth] = ifmove7 - 1;
                number[depth] = 7;
                return true;
            }
            pt = tmp;        //回溯复原
        }
        /*******move normal*****/
        //two space and 4 direction, 8 kinds with one block
        for(int s = 0;s < 2;s++){           //2 space
            for(int r = 0;r < 4;r++) {      //4 direction
                int tx = sx[s] + dx[r];
                int ty = sy[s] + dy[r];

                //不越界,不为a,b,c
                if(tx < 0 || ty < 0 || tx >= N || ty >= N ||
                    (tx == ax && ty == ay || tx == ax && ty == ay+1 || tx == ax+1 && ty == ay+1))
                    continue;
                //两个空格懒得判断迂回了
                tmp = pt;
                int num = pt.f[tx * N + ty];
                swap(pt.f[sx[s] * N + sy[s]], pt.f[tx * N + ty]);  //移动该空格
                pt.space[s] = tx * N + ty;
                if (pt.space[0] > pt.space[1]) swap(pt.space[0],pt.space[1]);   //维护空格顺序
                pt.MD = getMd(pt);

                if(dfs(depth + 1, r)) {
                    //r 为空格移动方向,数字需反向
                    direction[depth] = r==0 ? 1 : r==1 ? 0: r==2? 3 : r==3? 2:0;
                    number[depth] = num;
                    return true;
                }
                pt = tmp;       //复原
            }
        }

    return false;
}

int IDastar(ptstate in, FILE* fout) {
    in.MD = getMd(in);

    for(limit = in.MD; limit <= LIMIT; limit++) {
        pt = in;
        if (dfs(0, -1)) {   //从 depth=0 开始,初态无移动
            for(int i=0; i < limit; i++)    //0开始记录第一次移动
                fprintf(fout,"(%d, %c); ", number[i], dir[direction[i]]);
            return limit;
        }
    }
    return -1;
}

int main(int argc, char* argv[]) {
    FILE* fin;      //=fopen("../input/input1.txt","r");
    FILE* fout1;    //=fopen("../output/input1.txt","w+");
    FILE* fout2;
    puts(argv[1]);
    char sfin[50]="../input/";strcat(sfin, argv[1]);
    char sout1[50]="../output/Astar";strcat(sout1, argv[1]);
    char sout2[50]="../output/IDAstar";strcat(sout2, argv[1]);
    puts(sfin);puts(sout1);puts(sout2);
    fin = fopen(sfin,"r");fout1 = fopen(sout1,"w+");fout2 = fopen(sout2,"w+");
    ptstate in;
    if(!fin){
        printf("wrong file name!\n");
        return 0;
    }
    else {
        bool hasonespace = false;
        char t = 'a';
        for(int i = 0;i < N2;i++) {
            fscanf(fin, "%d,", in.f+i);
            if(in.f[i] == 0) {
                in.f[i] = N2;
                if(!hasonespace){
                    in.space[0] = i;
                    hasonespace = true;
                } else
                    in.space[1] = i;
            }
            else if(in.f[i] == 7){
                in.f[i] = t;
                if(t == 'a') in.aof7 = i;
                t++;
            }
        }
    }
    fclose(fin);
    for(int i = 0;i < N2;i++){printf("%d ",in.f[i]);if((i+1)%5 == 0) printf("\n");}
    //MD
    for(int i = 0;i < N2;i++) {
        for(int j = 0;j < N2;j++) {
            MDT[i][j] = abs(i/N - j/N) + abs(i%N - j%N);
        }
    }

    printf("A*: cost=%d\n",astar(in,fout1));
    printf("IDA*: cost=%d\n",IDastar(in,fout2));

    fclose(fout1);
    fclose(fout2);
    return 0;
}
