#include <stdio.h>
#include <stdlib.h>
int s,V,E,vs[20],G[20][20],Q[20],front=-1,rear=-1;

void dfs(int i) {
	vs[i]=1;
	printf("%d->",i);
	for(int j=1;j<=V;j++) {
		if(G[i][j]==1 && vs[j]==0)
		dfs(j);
	}
}
void eq(int item) {
	if(front==-1 && rear==-1) {
		front=rear=0;
	}
	else {
		rear++;
	}
	Q[rear]=item;
}
int dq() {
	int item;
	if(front==-1 && rear==-1)
	return -1;
	else {
		item =Q[front];
		if(front==rear) {
			front=rear=-1;
		} else {
			front++;
		}
		return item;
	}
}
void bfs(int s) {
	eq(s);
	vs[s]=1;
	printf("%d->",s);
	
	while(front != -1) {
		s=dq();
		for(int i=1;i<=V;i++) {
			if(G[s][i]==1 && vs[i]==0) {
				printf("%d->",i);
				vs[i]=1;
				eq(i);
			}
		}
	}
}
int main() {
	int i,j,v1,v2;
	printf("Enter the no of vertices of graph: ");
	scanf("%d",&V);
	for(i=1;i<=V;i++)
		for(j=1;j<=V;j++)
			G[i][j]=0;
			
	printf("Enter the no of edges of graph: ");
	scanf("%d",&E);
	for(i=1;i<=E;i++) {
		printf("Enter the edges(format: V1 V2): ");
		scanf("%d%d",&v1,&v2);
		G[v1][v2]=1;
		G[v2][v1]=1;
	}
	printf("\nAdjacent matrix\n");
	for(i=1;i<=V;i++) {
		for(j=1;j<=V;j++) {
			printf("%d\t",G[i][j]);
		}printf("\n");
	}
	for(i=1;i<=V;i++)
		vs[i]=0;
			
	printf("Enter the source: ");
	scanf("%d",&s);
	printf("\nDFS\n");
	dfs(s);
	
	for(i=1;i<=V;i++)
		vs[i]=0;
	
	printf("\nBFS\n");
	bfs(s);
	
	return 0;
}
