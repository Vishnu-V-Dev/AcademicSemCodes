#include <stdio.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>

int main()
{
    int wS;
    char buf[1024];
    struct sockaddr_in sA;
    struct sockaddr_storage sS;
    socklen_t aS;

    // Create socket
    wS = socket(AF_INET, SOCK_DGRAM, 0);

    // Configure settings
    sA.sin_family = AF_INET;
    sA.sin_port = htons(7891);
    sA.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(sA.sin_zero, '\0', sizeof sA.sin_zero);

    // Bind socket
    bind(wS, (struct sockaddr *)&sA, sizeof(sA));

    printf("UDP Server listening...\n");

    // Receive message
    aS = sizeof sS;
    recvfrom(wS, buf, 1024, 0,
             (struct sockaddr *)&sS, &aS);

    buf[1023] = '\0';

    printf("Message: %s\n", buf);

    // Print client IP
    struct sockaddr_in *cA = (struct sockaddr_in *)&sS;
    printf("Client IP: %s\n", inet_ntoa(cA->sin_addr));

    return 0;
}
