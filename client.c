#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main()
{
    int s;                    // client socket
    char b[1024];             // buffer to send
    struct sockaddr_in a;     // server address
    socklen_t l;              // address length

    // Create UDP socket
    s = socket(AF_INET, SOCK_DGRAM, 0);

    // Configure server details
    a.sin_family = AF_INET;
    a.sin_port = htons(7891);
    a.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(a.sin_zero, '\0', sizeof(a.sin_zero));

    // Set address size
    l = sizeof(a);

    // Message to send
    strcpy(b, "Hello from client");

    // Send message to server
    sendto(s, b, strlen(b) + 1, 0, (struct sockaddr *)&a, l);

    printf("Message sent to server\n");

    // Close socket
    close(s);

    return 0;
}
