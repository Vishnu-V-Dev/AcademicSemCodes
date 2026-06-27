#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main()
{
	int cS;
	char b[1024];
	struct sockaddr_in sA;
	socklen_t aS;

	cS = socket(AF_INET,SOCK_DGRAM,0);

	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));

	aS = sizeof(sA);

	strcpy(b,"request time and date");

	sendto(cS,b,strlen(b),0,(struct sockaddr *)&sA,aS);

	recvfrom(cS,b,sizeof(b),0,(struct sockaddr *)&sA,&aS);

	printf("current date and time = %s",b);

	close(cS);
	return 0;
}
