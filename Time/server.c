#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<time.h>

int main()
{
	int wS;
	char b[1024];
	time_t t;

	struct sockaddr_in sA;
	struct sockaddr_storage sS;
	socklen_t aS;

	wS = socket(AF_INET,SOCK_DGRAM,0);

	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));

	bind(wS,(struct sockaddr *)&sA,sizeof(sA));

	if(listen(wS,5)<0)
	{
		printf("listning\n");
	}
	else
	{
		printf("Error\n");
	}

	aS = sizeof(sA);

	recvfrom(wS,b,sizeof(b),0,(struct sockaddr *)&sS,&aS);
	printf("message received from client = %s",b);

	t = time(NULL);

	snprintf(b,sizeof(b),"%s",ctime(&t));

	sendto(wS,b,strlen(b),0,(struct sockaddr *)&sS,aS);

	close(wS);
	return 0;
}
