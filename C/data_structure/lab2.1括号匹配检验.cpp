#include<stdio.h>
#include<stdlib.h>
#define INITSIZE 10000
typedef struct{
    char *base;
    char *top;
    }sqstack;
void initstacks(sqstack &s)
{    s.base=(char *)malloc(INITSIZE*sizeof(char));
    s.top=s.base;
}
int gettops(sqstack s,char &e)
{   if(s.top==s.base)
        return 0;
    e=*(s.top-1);
    return 1;
}
void pushs(sqstack &s,char e)
{    *s.top=e;
    s.top++;
}
void pops(sqstack &s,char &e)
{    s.top--;
    e=*s.top;
}
int emptys(sqstack s)
{    if(s.top==s.base)
        return 1;
    return 0;
}
void clears(sqstack &s)
{    char temp;
    while(!emptys(s))
    {
        pops(s,temp);
    }
}
void destroys(sqstack &s)
{    free(s.base);
    s.top=NULL;
    s.base=NULL;
}
int main()
{
    FILE *pfile,*file2;
    pfile=fopen("in5.txt","r+");
    file2=fopen("out.txt","w");
    sqstack s;
    int i,m=0,n=0,cou[101]={0};
    char c[100000]={'\0'},t;
    initstacks(s);
    fscanf(pfile,"%d",&n);
    //printf("n=%d\n",n);
    for(i=0;i<n;cou[i]=1,i++);              //先认为这几个表达式匹配成功
    for(i=0;i<n;i++)
    {
        m=0;
        //printf("input s\n");
        fscanf(pfile,"%s",c);
        //printf("%s\n",c);
        if(!emptys(s)) printf("error\n");
        while(c[m]!='@')
        {
            if(c[m]=='('||c[m]=='['||c[m]=='{')
               pushs(s,c[m]);
            else if(c[m]==')'||c[m]==']'||c[m]=='}')
            {
                if(gettops(s,t))
                {
                    switch(t)
                    {
                        case '(':if(c[m]==')') pops(s,t); else cou[i]=0;break;
                        case '[':if(c[m]==']') pops(s,t); else cou[i]=0;break;
                        case '{':if(c[m]=='}') pops(s,t); else cou[i]=0;break;
                    }
                }
                else                        //空栈出现右括号，不匹配
                    cou[i]=0;
                if(cou[i] == 0)           //只要有一个括号匹配失败则表达式不匹配，break
                    break;
            }
            m++;
        }
        clears(s);
        m=0;
    }
    destroys(s);
    for(i=0;i<n;i++)
    {
        if(cou[i]==1)
            fprintf(file2,"YES\n");
        else
            fprintf(file2,"NO\n");
    }
}
