#include <stdio.h>
#include <math.h>
#include <string.h>

int tag[1000][1000];   //tag
char isle[1000][1000];
int n,num=0;
void traverse(int x,int y,int num)
{
    if(isle[x][y] == '.') return ;//.
    ////*
    if(tag[x][y]==0)
    {
        tag[x][y]=num;
        if(x!=0)  traverse(x-1,y,num);
        if(x!=n-1)traverse(x+1,y,num);
        if(y!=0)  traverse(x,y-1,num);
        if(y!=n-1)traverse(x,y+1,num);
    }
    return ;
}
int main()
{
    int i=0,j=0;
    char tc;

    while(scanf("%c",&tc) != EOF)
    {
        if(tc=='*'||tc=='.')
            isle[i][j++]=tc;
        else
        {
            isle[i][j]='\0';

            if(i==0) n=strlen(isle[i]);
            i++;
            j=0;
        }
    }
    if(n==1)
    {
        if(isle[0][0]=='*') printf("%d",1);
        else printf("%d",0);
        return 0;
    }
    //printf("n=%d\n",n);
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
            tag[i][j]=0;   //
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            if(isle[i][j]=='*'&&tag[i][j]==0)
                num++;
                traverse(i,j,num);
        }
    }

    printf("%d",num);
    return 0;
}
