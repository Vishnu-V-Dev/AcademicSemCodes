#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>

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

	connect(cS,(struct sockaddr*)&sA,aS);

	while(1)
	{
		printf("enter the message\n");
		fgets(b,100,stdin);

		send(cS,b,sizeof(b),0);

		if(strncmp(b,"EXIT",4)==0)
		{
			break;
		}
	}

	close(cS);
	return 0;
}
