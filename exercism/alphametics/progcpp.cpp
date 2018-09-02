#include <stdio>
#include <stdlib> 
using namespace std;
void main()
{
 	int graph[15][15],s[15],pathestimate[15],mark[15];
 	int num_of_vertices,source,i,j,u,predecessor[15];
 int count=0;
 	int minimum(int a[],int m[],int k);
 	void printpath(int,int,int[]);
 	printf("\nenter the no.of vertices\n");
 	scanf("%d",&num_of_vertices);
if(num_of_vertices<=0)
 	  {
  	printf("\nthis is meaningless\n");
exit(1);
  }
printf("\nenter the adjacent matrix\n");
    	for(i=1;i<=num_of_vertices;i++)
    {
  		printf("\nenter the elements of row %d\n",i);
  		for(j=1;j<=num_of_vertices;j++)
  		   {
   			scanf("%d",&graph[i][j]);
 	    }
 	     }
 	printf("\nenter the source vertex\n");
 	scanf("%d",&source);
 	for(j=1;j<=num_of_vertices;j++)
 	    {
  		mark[j]=0;
  		pathestimate[j]=999;
  		predecessor[j]=0;
 	    }
 	pathestimate[source]=0;
 
 	while(count<num_of_vertices)
 	  {
  		u=minimum(pathestimate,mark,num_of_vertices);
  		s[++count]=u;
  		mark[u]=1;
  		


for(i=1;i<=num_of_vertices;i++)
  {
   	if(graph[u][i]>0)
   	  {
    		if(mark[i]!=1)
    		  {
    if(pathestimate[i]>pathestimate[u]+graph[u][i])
     {
pathestimate[i]=pathestimate[u]+graph[u][i];
     			predecessor[i]=u;
    		      }
    		}
   	}
    }
      }

 for(i=1;i<=num_of_vertices;i++)
   {
 	printpath(source,i,predecessor);
 	if(pathestimate[i]!=999)
 	printf("->(%d)\n",pathestimate[i]);
    }
}

int minimum(int a[],int m[],int k)
{
 int mi=999;
 int i,t;
 for(i=1;i<=k;i++)
    {
if(m[i]!=1)
  {
if(mi>=a[i])
  {
mi=a[i];
t=i;
  			   }
 		   }
   }
 	return t;
}






void printpath(int x,int i,int p[])
    {
 	printf("\n");
if(i==x)
 {
printf("%d",x);
 }
else if(p[i]==0)
printf("no path from %d to %d",x,i);
else
 {
printpath(x,p[i],p);
printf("..%d",i);
}
}