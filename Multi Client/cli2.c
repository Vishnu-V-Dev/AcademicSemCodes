#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>

int main() {
	int wS;
	char b[1024];
	struct sockaddr_in sA;

	wS = socket(AF_INET,SOCK_STREAM,0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));
	
	connect(wS,(struct sockaddr *)&sA,sizeof(sA));
	
	while(1) {
		printf("Msg: ");
		fgets(b,sizeof(b),stdin);
		
		send(wS,b,sizeof(b),0);
		if(!strncmp(b,"EXIT",4))
			break;
	}
	
	return 0;
}
