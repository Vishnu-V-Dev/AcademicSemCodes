#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main()
{
    int s;                      // server socket
    char b[1024];               // buffer to store message
    struct sockaddr_in a;       // server address
    struct sockaddr_storage c;  // client address (generic)
    socklen_t l;                // length of address

    // Create UDP socket
    s = socket(AF_INET, SOCK_DGRAM, 0);

    // Configure server address
    a.sin_family = AF_INET;
    a.sin_port = htons(7891);
    a.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(a.sin_zero, '\0', sizeof(a.sin_zero));

    // Bind socket to IP and port
    bind(s, (struct sockaddr *)&a, sizeof(a));

    printf("Server listening...\n");

    // Set size of client address
    l = sizeof(c);

    // Receive message from client
    recvfrom(s, b, sizeof(b), 0, (struct sockaddr *)&c, &l);

    // Ensure string is null-terminated
    b[1023] = '\0';

    // Print received message
    printf("Message from client: %s\n", b);

    // Get client IP address
    struct sockaddr_in *client = (struct sockaddr_in *)&c;
    printf("Client IP: %s\n", inet_ntoa(client->sin_addr));

    // Close socket
    close(s);

    return 0;
}
