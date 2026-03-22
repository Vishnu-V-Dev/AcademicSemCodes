#include<stdio.h>
#include<string.h>
#include<arpa/inet.h>
#include<unistd.h>

int main() {
	int wS;
	char b[1024];
	struct sockaddr_in sA;
	
	wS = socket(AF_INET,SOCK_STREAM,0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	connect(wS,(struct sockaddr *)&sA,sizeof(sA));
	int n;
	n = (recv(wS,b,1024,0));
	b[n] = '\0';
	printf("S: %s",b);
	
	send(wS,"HELO a\n",7,0);
	recv(wS,b,1024,0);
	printf("S: %s",b);
	
	send(wS,"MAIL a\n",7,0);
	recv(wS,b,1024,0);
	printf("S: %s",b);
	
	send(wS,"RCPT b\n",7,0);
	recv(wS,b,1024,0);
	printf("S: %s",b);
	
	send(wS,"DATA\n",5,0);
	recv(wS,b,1024,0);
	printf("S: %s",b);
	
	send(wS,"Hello\n.\n",9,0);
	
	send(wS,"QUIT\n",5,0);
	recv(wS,b,1024,0);
	printf("S: %s",b);
	
	close(wS);
	
}
