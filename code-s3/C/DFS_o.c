#include <stdio.h>
int s,V,E,vs[20],G[20][20];

void dfs(int node) {
	vs[node]=1;
	printf("%d->",node);
	for(int i=0;i<=V;i++) {
		if(G[node][i]==1 && !vs[i]) {
			dfs(i);
		}
	}
}
int main() {
	int v1,v2;
	printf("Enter Vertices: ");
	scanf("%d",&V);
	for(int i=0;i<V;i++) {
		vs[i]=0;
		for(int j=0;j<V;j++) {
			G[i][j]=0;
		}
	}
	
	printf("Enter Edges: ");
	scanf("%d",&E);
	for(int i=0;i<E;i++) {
		printf("Enter edges(v1 v2): ");
		scanf("%d%d",&v1,&v2);
		G[v1][v2]=G[v2][v1]=1;
	}
	printf("Enter starting node: ");
	scanf("%d",&s);
	for(int i=0;i<V;i++) {
		vs[i]=0;
	}
	printf("\nDFS\n");
	dfs(s);
	return 0;
}
