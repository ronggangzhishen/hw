#include <stdio.h>
#include <math.h>
#include <string.h>

//#define QueenNum 4

int anQueen[11]; //纪录当前正在尝试的摆法
int number=0;
//摆放第n行以及以后的皇后(行号从0开始算)

void Queen( int n,int QueenNum) {

	int i, k;

	if( n == QueenNum ) { //前QueenNum行都成功摆好了，记下摆法
		for(k = 0; k < QueenNum; k ++ )
			printf("%d", anQueen[k]);
		printf("\n");
		number++;
		return ;
	}
	for(i = 0;i < QueenNum; i ++ ) { //尝试第n行所有位置
		int j;
		for( j = 0; j < n; j ++ ) {
		//对每个位置，判断是否和已经摆好的皇后冲突
			if( i == anQueen[j] ||
			    abs( i - anQueen[j]) == abs(n - j ))
				break;
		}
		if( j == n ) {
		//如果没有冲突，则第n行摆好了，记下来，再摆第n+1行
			anQueen[n] = i;
			Queen(n+1,QueenNum);
		}
	}
}

int main()
{
	int i=0,num;
	int xnum[6]={0};
	while(scanf("%d",&num) != EOF)
    {
        number=0;
        Queen(0,num);
        xnum[i++]=number;
    }
    for(i=0;xnum[i]!=0;i++)
        printf("%d\n",xnum[i]);
	return 0;
}

