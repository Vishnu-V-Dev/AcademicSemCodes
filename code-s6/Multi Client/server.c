#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>

int main() {
	int wS,nS,s;
	char b[1024];
	struct sockaddr_in sA;

	wS = socket(AF_INET,SOCK_STREAM,0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));
	
	s= (bind(wS,(struct sockaddr *)&sA,sizeof(sA)));
	if(s==0)printf("binded...\n");
	
	listen(wS,1);
	printf("listening...\n");
	
	while((nS = accept(wS, NULL, NULL))) {
		if (!fork()) {
			while(recv(nS,b,sizeof(b),0) > 0) {
				printf("Client: %s",b);
				memset(b,0,sizeof(b));
			}
		}
	}
	return 0;
}
