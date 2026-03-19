#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<unistd.h>

int main()
{
	int cS;
	char b[1024];
	struct sockaddr_in sA;
	socklen_t aS;

	cS = socket(PF_INET,SOCK_STREAM,0);

	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));

	aS = sizeof(sA);

	connect(cS,(struct sockaddr *)&sA,aS);

	recv(cS,b,sizeof(b),0);
	printf("server = %s",b);

	send(cS,"HELO:<localhost>",16,0);
	memset(b,0,1024);
	recv(cS,b,1024,0);
	printf("server = %s",b);

	send(cS,"MAIL FROM:<a@gmail.com>",23,0);
	memset(b,0,1024);
	recv(cS,b,1024,0);
	printf("server = %s",b);

	send(cS,"RCPT TO:<b@gmail.com>",21,0);
	memset(b,0,1024);
	recv(cS,b,1024,0);
	printf("server = %s",b);

	send(cS,"DATA",4,0);
	memset(b,0,1024);
	recv(cS,b,1024,0);
	printf("server = %s",b);

	send(cS," helo SMTP",14,0);

	send(cS,"QUIT",4,0);
	memset(b,0,1024);
	recv(cS,b,1024,0);
	printf("server = %s",b);

	close(cS);
	return 0;
}
