#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main()
{
	int wS,nS;  // sockets
	char b[1024];  // buffer
	struct sockaddr_in sA;  // server address
	struct sockaddr_storage sS;  // client address
	socklen_t aS;  // address size

	// create socket
	wS = socket(AF_INET,SOCK_DGRAM,0);

	// set family
	sA.sin_family = AF_INET;

	// set port
	sA.sin_port = htons(7891);

	// set IP
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");

	// clear padding
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));

	// bind socket
	bind(wS,(struct sockaddr *)&sA,sizeof(sA));

	// check listen (not needed for UDP but kept as-is)
	if(listen(wS,5)<0)
		printf("listning\n");
	else
		printf("Error\n");

	// set size
	aS = sizeof(sS);

	// receive data
	recvfrom(wS,b,1024,0,(struct sockaddr *)&sS,&aS);

	// print received data
	printf("ipaddress of client is %s\n", b);

	return 0;
}
