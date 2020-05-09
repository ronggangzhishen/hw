#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
typedef struct Node{
	unsigned char ch;
	struct Node* lchild;
	struct Node* rchild;
}Node, *ptrnode;
typedef struct{
    unsigned int weight;
    unsigned int parent,lchild,rchild;
}htnode,*huffmantree;
typedef char **huffmancode;

int findc(unsigned char s[],unsigned char c,int l){
    int i;
    for(i=1;i<=l;i++)
        if(c==s[i]) return i;//found
    return 0;               //not found
}
void selectnode(huffmantree ht,int l,int &a,int &b){
    int i,m;
    for(i=1;i<=1;i++){
        if(ht[i].parent == 0)
            {
                m=ht[i].weight;
                a=i;
                break;
            }
    }
    for(i=1;i<=l;i++){
        if(ht[i].parent==0 && ht[i].weight<m)
        {
            m=ht[i].weight;
            a=i;
        }
    }
    for(i=1;i<=l;i++){
        if(ht[i].parent == 0 && i!=a)
            {
                m=ht[i].weight;
                b=i;
                break;
            }
    }
    for(i=1;i<=l;i++){
        if(ht[i].parent==0 && ht[i].weight<m && i!=a)
        {
            m=ht[i].weight;
            b=i;
        }
    }
}
void huffmancoding(huffmantree &HT,huffmancode &HC,unsigned char kind[],int w[],int n,FILE* &fout){
    //if(n<=1) return;
    int i,j,s1,s2;
    int m=2*n-1;
    huffmantree p,pt;
    HT=(huffmantree)malloc((m+1)*sizeof(htnode));
    for(p=HT,i=0;i<=n;i++,p++,w++) {
        p->weight=*w;
        p->lchild=0;
        p->parent=0;
        p->rchild=0;
    }
    for( ;i<=m;i++) {
        p->weight=0;
        p->lchild=0;
        p->parent=0;
        p->rchild=0;
    }
    for(i=n+1;i<=m;i++)
    {
        //for(pt=HT+1,j=1;j<i;j++,pt++)
            //printf("%d,%d,%d,%d\n",pt->weight,pt->parent,pt->lchild,pt->rchild);
        selectnode(HT,i-1,s1,s2);
        printf("",s1,s2);
        HT[s1].parent=i; HT[s2].parent=i;
        HT[i].rchild=s1; HT[i].lchild=s2;
        HT[i].weight=HT[s1].weight+HT[s2].weight;
    }
    HC=(huffmancode)malloc((n+1)*sizeof(char*));
    char* cd=(char*)malloc(n*sizeof(char));
    int c,f,start;
    cd[n-1]='\0';
    for(i=1;i<=n;i++){
        start=n-1;
        for(c=i,f=HT[i].parent;f!=0;c=f,f=HT[f].parent)
            if(HT[f].lchild==c) cd[--start]='0';
            else                cd[--start]='1';
        HC[i]=(char*)malloc((n-start)*sizeof(char));
        strcpy(HC[i],&cd[start]);
        puts(HC[i]);
        fputc(kind[i],fout);
        j=n-start;
        fwrite(&j,sizeof(int),1,fout);
        fwrite(HC[i],(n-start)*sizeof(char),1,fout);
    }
}
void coding(huffmancode HC,unsigned char kind[],int n,int length,FILE* &fin,FILE* &fout){
    unsigned char ci=0,co=0;
    int i,j=1,k;
    int bit=0;
    while(j<=length)
    {
        j++;
        ci=fgetc(fin);
        for(i=1;i<=n;i++)
            if(kind[i]==ci) break;
        for(k=0;k<strlen(HC[i]);k++)
        {
            bit++;
            co<<=1;
            if(HC[i][k] == '1'){
                co|=1;
          //      printf(" 1 ");
            }
            //else printf(" 0 ");
            if(bit==8)
            {
                fputc(co,fout);
            //    printf("     YES!!\n");
                bit=0;
                co=0;
            }
        }
    }
    if(bit!=0)
    {
        co<<=(8-bit);
        fputc(co,fout);
        //printf("%x",co);
    }
}
void recreathuffmantree(huffmancode hc,unsigned char kind[],int n,ptrnode &root)
{
    int i,j;
    ptrnode p=root,q;
    for(i=1;i<=n;i++)
    {
         //printf(" %d ",strlen(hc[i]));
         if(hc[i])
            printf(" %s  ",hc[i]);
         else
            printf("err\n");
         //printf("%s  ",hc[i]);
        p=root;
        for(j=0;j<strlen(hc[i]);j++)
        {
            if(hc[i][j] == '0')   //left
            {
                 printf(" 0 ");
                if(p->lchild==NULL)
                {

                    q=(ptrnode)malloc(sizeof(Node));
                    p->lchild=q;
                    p=p->lchild;
                    p->lchild=NULL;
                    p->rchild=NULL;
                }
                else
                    p=p->lchild;
            }
            else if(hc[i][j] == '1')               //right
            {
                 printf(" 1 ");
                if(p->rchild==NULL)
                {
                    q=(ptrnode)malloc(sizeof(Node));
                    p->rchild=q;
                    p=p->rchild;
                    p->lchild=NULL;
                    p->rchild=NULL;
                }
                else
                    p=p->rchild;
            }
        }
        p->ch=kind[i];
        if(!p->lchild&&!p->rchild)
            printf("%x\n",p->ch);
    }
}
void rzip(int length,ptrnode &root,FILE* &fin,FILE* &fout){
    int i,j,cou=length;
    unsigned char ci;
    ptrnode p=root;
        //printf("%d\n",cou);
        while(!feof(fin))
        {

            ci=fgetc(fin);
            printf("in %x ",ci);
            for(j=7;j>=0;j--)       //从高位比起，没找到继续读
            {
                if(ci&(1<<j)){
              //      printf(" 1 ");
                    p=p->rchild;
                    if(p==NULL) printf("rerror?\n");
                    }
                else{
                //    printf(" 0 ");
                    p=p->lchild;
                    if(p==NULL) printf("lerror?\n");
                    }
                if(!p->lchild&&!p->rchild)//走完树
                {

                    fputc(p->ch,fout);
                    printf(" out %x\n",p->ch);
                    p=root;
                    cou--;
                }
                if(cou<=0) break;
            }
            if(cou<=0) break;
        }

}
int main()
{

	char filename[20]="text.txt";
	char zip[6]=".huff";
	char fileout[20]="out";
	char tch;
	unsigned char ch;
	unsigned char kind[257]={0};
	int w[257]={0};
	int i=0,j,k,m,select;
	int n,cut=0,len;
	huffmantree HT;
	huffmancode HC;

  scanf("%d",&select);
switch(select%2)
{
	case 1:{
	FILE* fin = fopen(filename, "rb");
	strcat(filename,zip);
	FILE* fout = fopen(filename, "wb");
	while(!feof(fin))
    {

        fread(&ch, sizeof(char), 1, fin);
        cut++;                          //文件大小
        j=findc(kind,ch,i);
        if(j)
            w[j]++;
        else
        {
            kind[++i]=ch;
            w[i]++;
        }
	}
	w[i]--;
	cut--;
	for(j=1;j<=i;j++)
        printf("%d\n",w[j]);
    printf("%d length\n",cut);
    printf("%d kinds\n",i);
	//find each weight
	n=i;                                //i 个不同字符
	fwrite(&n, sizeof(int), 1, fout);   //头文件写入要读的编码种类数
	fwrite(&cut, sizeof(int), 1, fout); //写入字节数
	rewind(fin);
	huffmancoding(HT,HC,kind,w,n,fout);      //求编码，不等长01码以char[]型分字节存储,并写入压缩文件
    rewind(fin);
    coding(HC,kind,n,cut,fin,fout);           //编码,写入

    fclose(fin);
    fclose(fout);
    break;
	}
    case 0:{
    strcat(fileout,filename);
	strcat(filename,zip);
	FILE* fin = fopen(filename, "rb");
	FILE* fout = fopen(fileout, "wb");
	ptrnode root;
	root=(ptrnode)malloc(sizeof(Node));
	root->lchild=NULL;
    root->rchild=NULL;

	fread(&n,sizeof(int),1,fin);
	printf("n=%d    ",n);
	fread(&len,sizeof(int),1,fin);
	printf("len=%d\n",len);
	HC=(huffmancode)malloc((n+1)*sizeof(char));
	//读入总长，不同字符数
	for(i=1;i<=n;i++)
    {
        kind[i]=fgetc(fin);
        printf("%d %x",i,kind[i]);
        fread(&m,sizeof(int),1,fin);
        printf("  %d  ",m);
        HC[i]=(char*)malloc(m*sizeof(char));
        fread(HC[i],sizeof(char),m,fin);
        printf("%s ",HC[i]); puts(HC[i]);
    }
    for(i=1;i<=n;i++)
        printf("%s\n", HC[i]);
        //puts(HC[i]);
    /*
    ptrnode p=root,q;
    for(i=1;i<=n;i++)
    {
         printf(" %s ",HC[i]);
        p=root;
        for(j=0;j<strlen(HC[i]);j++)
        {
            if(HC[i][j] == '0')   //left
            {
                 printf(" 0 ");
                if(p->lchild==NULL)
                {

                    q=(ptrnode)malloc(sizeof(Node));
                    p->lchild=q;
                    p=p->lchild;
                    p->lchild=NULL;
                    p->rchild=NULL;
                }
                else
                    p=p->lchild;
            }
            else if(HC[i][j] == '1')               //right
            {
                 printf(" 1 ");
                if(p->rchild==NULL)
                {
                    q=(ptrnode)malloc(sizeof(Node));
                    p->rchild=q;
                    p=p->rchild;
                    p->lchild=NULL;
                    p->rchild=NULL;
                }
                else
                    p=p->rchild;
            }
        }
        p->ch=kind[i];
        if(!p->lchild&&!p->rchild)
            printf("%x\n",p->ch);
    }*/


    recreathuffmantree(HC,kind,n,root);
    printf("yes\n");
	rzip(len,root,fin,fout);
	//free(root);
	for(i=1;i<=n;i++)
        free(HC[i]);
	fclose(fin);
    fclose(fout);
    break;
    }
};
printf("\nend\n");
}
