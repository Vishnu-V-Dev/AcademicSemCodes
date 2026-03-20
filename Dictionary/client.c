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
	
	cS = socket(AF_INET, SOCK_STREAM,0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));
	
	aS = sizeof(sA);
	
	connect(cS,(struct sockaddr *)&sA,aS);
	
	printf("Enter the word to be searched: ");
	scanf("%s",b);
	
	send(cS,b,1024,0);
	
	recv(cS,b,1024,0);
	printf("Meaning = %s\n",b);
	
	recv(cS,b,1024,0);
	printf("Antonym = %s\n",b);
	close(cS);
	
	return 0;
}
