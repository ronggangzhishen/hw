#include <stdio.h>
#include <math.h>
#include <string.h>

//#define QueenNum 4

int anQueen[11]; //��¼��ǰ���ڳ��Եİڷ�
int number=0;
//�ڷŵ�n���Լ��Ժ�Ļʺ�(�кŴ�0��ʼ��)

void Queen( int n,int QueenNum) {

	int i, k;

	if( n == QueenNum ) { //ǰQueenNum�ж��ɹ��ں��ˣ����°ڷ�
		for(k = 0; k < QueenNum; k ++ )
			printf("%d", anQueen[k]);
		printf("\n");
		number++;
		return ;
	}
	for(i = 0;i < QueenNum; i ++ ) { //���Ե�n������λ��
		int j;
		for( j = 0; j < n; j ++ ) {
		//��ÿ��λ�ã��ж��Ƿ���Ѿ��ںõĻʺ��ͻ
			if( i == anQueen[j] ||
			    abs( i - anQueen[j]) == abs(n - j ))
				break;
		}
		if( j == n ) {
		//���û�г�ͻ�����n�аں��ˣ����������ٰڵ�n+1��
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

