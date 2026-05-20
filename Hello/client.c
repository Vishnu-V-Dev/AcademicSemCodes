#include<stdio.h>
#include<netinet/in.h>
#include<string.h>
#include<arpa/inet.h>

int main()
{
    int wS;
    char b[1024];
    struct sockaddr_in sA;
    socklen_t aS;

    wS = socket(AF_INET, SOCK_DGRAM, 0);

    sA.sin_family = AF_INET;
    sA.sin_port = htons(7891);
    sA.sin_addr.s_addr = inet_addr("127.0.0.1");

    aS = sizeof(sA);

    strcpy(b, "Hello");

    sendto(wS, b, strlen(b), 0, (struct sockaddr *)&sA, aS);

    return 0;
}
