#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>

int main() {
	int wS,nS,s;
	char b[1024];
	struct sockaddr_in sA;
	socklen_t aS;
	
	wS = socket(AF_INET,SOCK_STREAM,0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));
	
	s = (bind(wS,(struct sockaddr *)&sA,sizeof(sA)));
	if(s==0) printf("Bind Successful.\n");
	
	listen(wS,1);
	printf("Listening...\n");
	
	aS = sizeof(sA);
	nS = accept(wS,(struct sockaddr *)&sA,&aS);
	
	send(nS,"220 SMTP Server Ready\r\n",strlen("220 SMTP Server Ready\r\n"),0);
	
	while(1) {
		memset(b,0,sizeof(b));
		
		recv(nS,b,sizeof(b),0);
		printf("Client: %s",b);
		
		if(strncmp(b,"HELO",strlen("HELO")) == 0)
			send(nS,"250 Hello\r\n",strlen("250 Hello\r\n"),0);
			
		else if(strncmp(b,"MAIL FROM",strlen("MAIL FROM")) == 0)
			send(nS,"250 OK\r\n",strlen("250 OK\r\n"),0);
		
		else if(strncmp(b,"RCPT TO",strlen("RCPT TO")) == 0)
			send(nS,"250 OK\r\n",strlen("250 OK\r\n"),0);
			
		else if(strncmp(b,"DATA",strlen("DATA")) == 0)
			send(nS,"354 End data with <CR><LF>.<CR><LF>\r\n",strlen("354 End data with <CR><LF><CR><LF>\r\n"),0);
			
		else if(strncmp(b,".",strlen(".")) == 0)
			send(nS,"250 Message accepted\r\n",strlen("250 Message accepted\r\n"),0);
			
		else if(strncmp(b,"QUIT",strlen("QUIT")) == 0) {
			send(nS,"221 Bye\r\n",strlen("221 Bye\r\n"),0);
			break;
		}
	}
	
	
	return 0;
}
