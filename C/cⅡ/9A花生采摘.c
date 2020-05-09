#include<stdio.h>

typedef struct
{
	int sum,x,y;
}jg;
int cmp(jg ab1,jg ab2) {
	return ab1.sum>ab2.sum;
}
int abs(int o)
{
	if (o<0) return -o;
	return o;
}
int main()
{
    jg temp,a[500];
    int n,m,time,k,t,ans=0;
    int i,j;

	scanf("%d %d %d",&m,&n,&time);
	for (i=1;i<=m;i++){
	  for (j=1;j<=n;j++)
	    {
	    	scanf("%d",&k);
	    	a[(i-1)*n+j].sum=k;//记录花生数
	    	a[(i-1)*n+j].x=j;//记录行
	    	a[(i-1)*n+j].y=i;//记录列
	    }
	}
	for(i=1;i<=m*n;i++)//冒泡
    {
        for(j=m*n;j>i;j--)
        {
            if(a[j].sum>a[j-1].sum)
            {
                temp=a[j-1];
                a[j-1]=a[j];
                a[j]=temp;
            }
        }
    }
	t=a[1].y+1;
	if (t+a[1].y<=time) ans+=a[1].sum;//第一项
	for (i=2;i<=n*m;i++)
	  {
        //printf("time=%d\n",t);
	  	t+=abs(a[i].x-a[i-1].x)+abs(a[i].y-a[i-1].y)+1;//距离
	  	if (t+a[i].y<=time) ans+=a[i].sum;//判断回到路边有没有超过时间
	  	else break;
	  }
	printf("%d",ans);
}
