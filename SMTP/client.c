#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>

int main() {
	int wS;
	char b[1024];
	struct sockaddr_in sA;
	socklen_t aS;
	
	wS = socket(AF_INET,SOCK_STREAM,0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));
	
	aS = sizeof(sA);
	connect(wS,(struct sockaddr *)&sA,aS);
	
	memset(b,0,sizeof(b));
	recv(wS,b,sizeof(b),0);
	printf("Server: %s",b);
	
	send(wS,"HELO localhost\r\n",strlen("HELO localhost\r\n"),0);
	memset(b,0,sizeof(b));
	recv(wS,b,sizeof(b),0);
	printf("%s",b);
	
	send(wS,"MAIL FROM:<a@test.com>\r\n",strlen("MAIL FROM:<a@test.com>\r\n"),0);
	memset(b,0,sizeof(b));
	recv(wS,b,sizeof(b),0);
	printf("%s",b);
	
	send(wS,"RCPT TO:<b@test.com>\r\n",strlen("RCPT TO:<b@test.com>\r\n"),0);
	memset(b,0,sizeof(b));
	recv(wS,b,sizeof(b),0);
	printf("%s",b);
	
	send(wS,"DATA",strlen("DATA"),0);
	memset(b,0,sizeof(b));
	recv(wS,b,sizeof(b),0);
	printf("%s",b);
	
	send(wS,"Hello SMTP\r\n",strlen("Hello SMTP\r\n"),0);;
	
	send(wS,".\r\n",strlen(".\r\n"),0);
	memset(b,0,sizeof(b));
	recv(wS,b,sizeof(b),0);
	printf("%s",b);
	
	send(wS,"QUIT\r\n",strlen("QUIT\r\n"),0);
	memset(b,0,sizeof(b));
	recv(wS,b,sizeof(b),0);
	printf("%s",b);
	
	return 0;
}
