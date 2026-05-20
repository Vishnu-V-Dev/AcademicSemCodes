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
    a.sin_port = htons(7891);
    a.sin_addr.s_addr = inet_addr("127.0.0.1");

    bind(s, (struct sockaddr *)&a, sizeof(a));

    l = sizeof(c);
    recvfrom(s, b, sizeof(b), 0, (struct sockaddr *)&c, &l);

    printf("Message: %s\n", b);

    return 0;
}
