#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/in.h>

int main() {
	int wS;
	struct sockaddr_in a;
	int n1,n2,sum;
	
	wS = socket(AF_INET,SOCK_STREAM,0);
	
	a.sin_family = AF_INET;
	a.sin_port = htons(7891);
	a.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	connect(wS,(struct sockaddr *)&a,sizeof(a));
	
	printf("Enter first number: ");
    scanf("%d", &n1);

    printf("Enter second number: ");
    scanf("%d", &n2);
    
	
	send(wS, &n1, sizeof(n1),0);
	send(wS, &n2, sizeof(n2),0);
	
	
	recv(wS,&sum,sizeof(sum),0);
	
	printf("Sum: %d",sum);

	
	return 0;
}
