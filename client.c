#include <stdio.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>

int main()
{
    int cS;
    char buf[1024];
    struct sockaddr_in sA;
    socklen_t aS;

    // Create socket
    cS = socket(AF_INET, SOCK_DGRAM, 0);

    // Configure server address
    sA.sin_family = AF_INET;
    sA.sin_port = htons(7891);
    sA.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(sA.sin_zero, '\0', sizeof sA.sin_zero);

    aS = sizeof(sA);

    // Message to send
    strcpy(buf, "Hello from client");

    // Send message
    sendto(cS, buf, strlen(buf) + 1, 0,
           (struct sockaddr *)&sA, aS);

    printf("Message sent to server\n");

    return 0;
}
