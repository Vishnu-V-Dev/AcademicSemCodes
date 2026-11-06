#include <stdio.h>
#include <string.h>

char s[20][20], u[20][20], a[20][20], v[20][20];
int visited[20], n, i, t = 0;

int find(char x[]) {
	for(int i=0; i<n; i++) {
		if(strcmp(s[i], x) == 0)
			return i;
		}
	return -1;
}

void closure(int k) {
	visited[k] = 1;
	
	for(int i=0; i<t; i++) {
		if(strcmp(u[i], s[k])==0 && strcmp(a[i], "e")==0) {
			
			int j = find(v[i]);
			
			if(j != -1 && !visited[j]) {
				closure(j);
			}
		}
	}
}


int main() {
	FILE *fp = fopen("input.txt","r");
	int i, j;
	
	printf("Enter the no of states: ");
	scanf("%d",&n);
	
	printf("Enter the states:\n");
	for(i = 0; i<n; i++) {
		scanf("%s", s[i]);
	}
	
	while(fscanf(fp, "%*d %s %s %s", u[t], a[t], v[t]) == 3)
	t++;
	
	for(i = 0; i<n; i++) {
		memset(visited, 0, sizeof(visited));
		closure(i);
		
		printf("Epsilon Closure of %s = { ", s[i]);
		
		for(j = 0; j<n; j++) {
			if(visited[j]) {
				printf("%s", s[j]);
			}
		}
		printf("}\n");
		
	}
	fclose(fp);
	return 0;
}

