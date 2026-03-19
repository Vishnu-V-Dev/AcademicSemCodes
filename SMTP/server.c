#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<unistd.h>

int main()
{
	int wS,nS;
	char b[1024];
	struct sockaddr_in sA;
	struct sockaddr_storage sS;
	socklen_t aS;

	wS = socket(PF_INET,SOCK_STREAM,0);

	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));

	bind(wS,(struct sockaddr *)&sA,sizeof(sA));

	if(listen(wS,5)==0)
		printf("listning\n");
	else
		printf("Error\n");

	aS = sizeof(sS);

	nS = accept(wS,(struct sockaddr *)&sS,&aS);

	send(nS,"220 server SMTP created\n",23,0);

	while(1)
	{
		memset(b,0,1024);
		recv(nS,b,1024,0);
		printf("client = %s",b);

		if(strncmp(b,"HELO",4)==0)
			send(nS,"250 HELO\r\n",10,0);

		else if(strncmp(b,"MAIL FROM",9)==0)
			send(nS,"250 ok\r\n",8,0);

		else if(strncmp(b,"RCPT TO",7)==0)
			send(nS,"250 ok\r\n",8,0);

		else if(strncmp(b,"DATA",4)==0)
			send(nS,"354 end data with <CR><LF><CR><LF>\r\n",36,0);

		else if(strncmp(b,".",1)==0)
			send(nS,"250 Message Received\r\n",22,0);

		else if(strncmp(b,"QUIT",4)==0)
		{
			send(nS,"221 Bye\r\n",9,0);
			break;
		}
	}

	close(wS);
	close(nS);
	return 0;
}
