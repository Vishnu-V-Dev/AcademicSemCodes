#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>

int main() {
	int wS,nS;
	char b[1024];
	struct sockaddr_in sA;
	FILE *fp;
	
	wS = socket(AF_INET, SOCK_STREAM, 0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));
	
	bind(wS,(struct sockaddr *)&sA,sizeof(sA));
	
	listen(wS,1);
	printf("listening...\n");
	
	nS = accept(wS,NULL,NULL);
	
	fp = fopen("receive.txt","wb");
	
	int n;
	while((n = recv(nS,b,sizeof(b),0)) > 0)
		fwrite(b,1,n,fp);
	fclose(fp);
	
	return 0;
}
