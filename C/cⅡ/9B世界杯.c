#include<stdio.h>

int main()
{
    int a[7][2],abs[7];
    int score[5]={0},win[5]={0},abswin[5]={0},lose[5]={0};//积分，胜，净胜场，输
    int i,j,premax,prenum,max,num,ord[5]={0};//ord 为当前顺位


	for (i=1;i<=6;i++)
        scanf("%d:%d",&a[i][0],&a[i][1]);

    win[1]=a[1][0]+a[3][0]+a[6][1];//win
    win[2]=a[1][1]+a[4][1]+a[5][0];
    win[3]=a[2][0]+a[3][1]+a[5][1];
    win[4]=a[2][1]+a[4][0]+a[6][0];
    lose[1]=a[1][1]+a[3][1]+a[6][0];//lose
    lose[2]=a[1][0]+a[4][0]+a[5][1];
    lose[3]=a[2][1]+a[3][0]+a[5][0];
    lose[4]=a[2][0]+a[4][1]+a[6][1];
    for(i=1;i<=6;i++) abs[i]=a[i][0]-a[i][1];//abs win
    abswin[1]=abs[1]+abs[3]-abs[6];
    abswin[2]=-abs[1]+abs[5]-abs[4];
    abswin[3]=abs[2]-abs[3]-abs[5];
    abswin[4]=-abs[2]+abs[4]+abs[6];
    for(i=1;i<=6;i++)//score
    {
        switch(i)
        {
        case 1:{
            if(a[i][0]>a[i][1]) score[1]+=3;
            else if(a[i][0]==a[i][1]) {score[1]++; score[2]++;}
            else score[2]+=3;
            break;
        }
        case 2:{
            if(a[i][0]>a[i][1]) score[3]+=3;
            else if(a[i][0]==a[i][1]) {score[3]++; score[4]++;}
            else score[4]+=3;
            break;
        }
        case 3:{
            if(a[i][0]>a[i][1]) score[1]+=3;
            else if(a[i][0]==a[i][1]) {score[1]++; score[3]++;}
            else score[3]+=3;
            break;
        }
        case 4:{
            if(a[i][0]>a[i][1]) score[4]+=3;
            else if(a[i][0]==a[i][1]) {score[4]++; score[2]++;}
            else score[2]+=3;
            break;
        }
        case 5:{
            if(a[i][0]>a[i][1]) score[2]+=3;
            else if(a[i][0]==a[i][1]) {score[2]++; score[3]++;}
            else score[3]+=3;
            break;
        }
        case 6:{
            if(a[i][0]>a[i][1]) score[4]+=3;
            else if(a[i][0]==a[i][1]) {score[4]++; score[1]++;}
            else score[1]+=3;
            break;
        }
        };
    }

    for(i=1;i<=4;i++){//order1
        max=-1;
        for(j=1;j<=4;j++)
        {
            if(score[j]>max&&ord[j]==0)
            {
                num=j;
                max=score[j];
            }
            if(score[j]==max&&ord[j]==0&&j!=num)
            {
                if(abswin[j]>abswin[num]) num=j;
                else if(abswin[j]==abswin[num])
                {
                    if(win[j]>win[num]) num=j;

                }
            }
        }
        ord[num]=i;
        //printf("num=%d\n",num);
    }

/*for(j=1;j<=3;j++)
{//find the j_th
    prenum=0;
    for(i=1;i<=4;i++)
    {
        if(ord[i]==j&&prenum==0) prenum=i;
        else if(ord[i]==j)
        {
            if(abswin[i]>abswin[prenum]) ord[prenum]++;
            else if(abswin[i]==abswin[prenum])
            {
                if(win[i]>win[prenum]) ord[prenum]++;
                else                ord[i]++;
            }
            else ord[i]++;
            if(ord[i]==j) prenum=i;
        }
    }
}*/
    for(i=1;i<=4;i++)//print
    {
        printf("%d %d ",ord[i],score[i]);
        if(abswin[i]>=0) printf("+%d ",abswin[i]);
        else             printf("-%d ",-abswin[i]);
        printf("%d %d ",win[i],lose[i]);
        if(ord[i]<=2) printf("Y\n");
        else          printf("N\n");
    }
}
