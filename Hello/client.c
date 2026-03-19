#include<stdio.h>
#include<netinet/in.h>
#include<string.h>
#include<arpa/inet.h>

int main()
{
    int s;
    char b[1024];
    struct sockaddr_in a;
    socklen_t l;

    s = socket(AF_INET, SOCK_DGRAM, 0);

    a.sin_family = AF_INET;
    a.sin_port = htons(7891);
    a.sin_addr.s_addr = inet_addr("127.0.0.1");

    l = sizeof(a);

    strcpy(b, "Hello");

    sendto(s, b, strlen(b), 0, (struct sockaddr *)&a, l);

    return 0;
}
