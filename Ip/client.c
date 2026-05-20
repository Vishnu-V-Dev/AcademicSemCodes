#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main()
{
	int cS;  // client socket
	char b[1024];  // buffer
	struct sockaddr_in sA;  // server address
	socklen_t aS;  // address size

	// create socket
	cS = socket(AF_INET,SOCK_DGRAM,0);

	// set family
	sA.sin_family = AF_INET;

	// set port
	sA.sin_port = htons(7891);

	// set IP
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");

	// clear padding
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));

	// set address size
	aS = sizeof(sA);

	// copy IP into buffer
	strcpy(b,inet_ntoa(sA.sin_addr));

	// send data to server
	sendto(cS,b,sizeof(b),0,(struct sockaddr *)&sA,aS);

	// print message
	printf("ip address of client send to server\n");

	return 0;
}
