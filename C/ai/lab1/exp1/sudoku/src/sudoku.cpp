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


int rule[4][9][10];
int sudoku[9][9];
int flag[9][9];
int degree[9][9];   //维护所有空格的度(影响到的空格数(不算自己 ))
FILE *fout;         //为了被print使用设为全局

inline int findBlockIndex(int rowIndex, int colIndex) { //求块索引
    return (3 * (rowIndex / 3) + (colIndex / 3));
}
inline int findDiagonalIndex(int rowIndex, int colIndex) { //求对角线索引
    if(rowIndex == colIndex) return 1;
    if(rowIndex + colIndex == 8) return 2;
    return 0;
}

int findNextValue(int rowIndex, int colIndex, int start) {
    int blockindex = findBlockIndex(rowIndex, colIndex);
    int diagindex = findDiagonalIndex(rowIndex, colIndex);
    for (int i = start; i <= 9; i++) {          //从1~9测试
        if (rule[0][rowIndex][i]) continue;
        if (rule[1][colIndex][i]) continue;
        if (rule[2][blockindex][i]) continue;
        if (diagindex && rule[3][diagindex][i]) continue;
        return i;
    }
    return 0;
}

//某一个位置已填,则修改三类规则
void changeRule(int rowIndex, int colIndex, int kind) {
    int blockindex = findBlockIndex(rowIndex, colIndex);
    int diagindex = findDiagonalIndex(rowIndex, colIndex);
    int value = sudoku[rowIndex][colIndex];
    rule[0][rowIndex][value] = kind;
    rule[1][colIndex][value] = kind;
    rule[2][blockindex][value] = kind;
    if(diagindex) rule[3][diagindex][value] = kind;
}

void printsudoku() {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            fprintf(fout, "%d ", sudoku[i][j]);
        }
        fprintf(fout, "\n");
    }
    fprintf(fout, "\n");
}

bool checksudoku() {
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            if(!sudoku[i][j]) //有空格
                return false;
        }
    }
    return true;
}

//找到最大度数的行列号,并将之行列号置0,并返回度数
int getIndexofDegree(int *rowIndex, int *colIndex) {
    int maxdegree,maxi,maxj;
    maxdegree = 0;
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            if(degree[i][j] > maxdegree) {
                maxdegree = degree[i][j];
                maxi = i;
                maxj = j;
            }
        }
    }
    if(maxdegree == 0) {    //the last
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if(!sudoku[i][j]) {
                    *rowIndex = i;
                    *colIndex = j;
                    return 0;
                }
            }
        }
    }

    degree[maxi][maxj] = 0;
    //将影响到的其它位置的degree-1
    int maxblock = findBlockIndex(maxi, maxj);
    for(int j=0; j < 9; j++){   
        if(degree[maxi][j] > 0) degree[maxi][j]--;
    }
    for(int i=0; i < 9; i++){   
        if(degree[i][maxj] > 0) degree[i][maxj]--;
    }
    for(int i = (3 * maxblock)%9; i < (3 * maxblock)%9 + 3; i++) {
        for(int j = maxblock%3; j < maxblock%3 + 3; j++) {
            if(degree[i][j] > 0) degree[i][j]--;
        }
    }
    *rowIndex = maxi;
    *colIndex = maxj;
    return maxdegree;
}

void solve() {
    //按度最大扩展
    if (checksudoku()) {
        printsudoku();
        return;
    }
    //有限选择degree更大的空格
    int rowIndex, colIndex, nowdegree;
    int tempdegree[9][9];
    memcpy(tempdegree, degree, 9*9*sizeof(char));
    nowdegree = getIndexofDegree(&rowIndex, &colIndex);
    //printf("r = %d, c = %d\n",rowIndex, colIndex);
    
    while (sudoku[rowIndex][colIndex] =                 //按序填空格
           findNextValue(rowIndex, colIndex, sudoku[rowIndex][colIndex] + 1)) {
        changeRule(rowIndex, colIndex, 1);
        //solve(rowIndex, colIndex + 1);
        solve();
        changeRule(rowIndex, colIndex, 0);       //回溯
    }
    //setbackDegree(rowIndex, colIndex, nowdegree);//回溯
    memcpy(degree, tempdegree, 9*9*sizeof(char));
}


int main(int argc, char* argv[]) {
    int rowdegree[9] = {0}, coldegree[9] = {0}, blockdegree[9] = {0};
    FILE* fin;      //=fopen("../input/sudoku01.txt","r");
    //FILE* fout;    //=fopen("../output/sudoku01.txt","w+");
    puts(argv[1]);
    char sfin[50]="../input/";strcat(sfin, argv[1]);
    char sout[50]="../output/";strcat(sout, argv[1]);
    puts(sfin);puts(sout);
    fin = fopen(sfin,"r");fout = fopen(sout,"w+");

    if(!fin){
        printf("wrong file name!\n");
        return 0;
    }
    else {  //load to sudoku
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                fscanf(fin, "%d ", sudoku[i]+j);
                flag[i][j] = sudoku[i][j]==0 ? 1 : 0;
                if (!flag[i][j])        //标志行, 列, 块
                    changeRule(i, j, 1);   
                else {                  //
                    int blockindex = findBlockIndex(i, j);
                    blockdegree[blockindex]++;
                    rowdegree[i]++;
                    coldegree[j]++;
                }
            }
        }
    }
    fclose(fin);
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {printf("%d ",sudoku[i][j]);}
        printf("\n");}
    printf("\n");

    //initdegree
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            int blockindex = findBlockIndex(i, j);
            if(flag[i][j])
                degree[i][j] = rowdegree[i] + coldegree[j] + blockdegree[blockindex] - 3;
            else
                degree[i][j] = 0;
        }
    }
    /*for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {printf("%3d ",degree[i][j]);}
        printf("\n");}
    printf("\n");*/

    solve();

    return 0;
}