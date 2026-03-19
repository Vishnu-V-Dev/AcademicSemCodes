#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <unistd.h>

int main()
{
    int s, ns;
    struct sockaddr_in a;
    socklen_t l;
    int n1, n2, sum;

    s = socket(AF_INET, SOCK_STREAM, 0);

    a.sin_family = AF_INET;
    a.sin_port = htons(7891);
    a.sin_addr.s_addr = INADDR_ANY;

    bind(s, (struct sockaddr*)&a, sizeof(a));
    listen(s, 5);

    printf("Server Waiting...\n");

    l = sizeof(a);

    ns = accept(s, (struct sockaddr*)&a, &l);

    recv(ns, &n1, sizeof(n1), 0);
    recv(ns, &n2, sizeof(n2), 0);

    sum = n1 + n2;

    send(ns, &sum, sizeof(sum), 0);

    close(ns);
    close(s);

    return 0;
}
