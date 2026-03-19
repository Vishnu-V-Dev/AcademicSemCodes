#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>

int main()
{
	int wS,nS;
	char b[1024];
	int pid;

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

	while((nS = accept(wS,(struct sockaddr *)&sS,&aS)))
	{
		if((pid = fork())==0)
		{
			while((recv(nS,b,1024,0))>0)
			{
				printf("message received = %s\n",b);
				memset(b,0,1024);
			}
			close(nS);
			exit(0);
		}
		else
		{
			close(nS);
		}
	}

	close(wS);
	return 0;
}
