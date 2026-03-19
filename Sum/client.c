#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

int main()
{
    int s;
    struct sockaddr_in a;
    int n1, n2, sum;

    s = socket(AF_INET, SOCK_STREAM, 0);

    a.sin_family = AF_INET;
    a.sin_port = htons(7891);
    a.sin_addr.s_addr = inet_addr("127.0.0.1");

    connect(s, (struct sockaddr*)&a, sizeof(a));

    printf("Enter first number: ");
    scanf("%d", &n1);

    printf("Enter second number: ");
    scanf("%d", &n2);

    send(s, &n1, sizeof(n1), 0);
    send(s, &n2, sizeof(n2), 0);

    recv(s, &sum, sizeof(sum), 0);

    printf("Sum received from server: %d\n", sum);

    close(s);

    return 0;
}
