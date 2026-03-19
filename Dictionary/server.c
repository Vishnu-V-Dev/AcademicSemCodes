#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main()
{
    int wS, nS, s;
    int i, c = 0;
    char b[1024], w[1024], a[1024];

    char d[7][3][100] = 
    {
        {"bad","bad","good"},
        {"good","good","bad"},
        {"ugly","ugly","not ugly"},
        {"heaven","heaven","hell"},
        {"go","go","come"},
        {"below","below","above"},
        {"above","above","below"}
    };

    struct sockaddr_in sA;
    struct sockaddr_storage sS;
    socklen_t aS;

    wS = socket(PF_INET,SOCK_STREAM,0);
    if(wS>0)
        printf("server socket created\n");

    sA.sin_family = AF_INET;
    sA.sin_port = htons(7891);
    sA.sin_addr.s_addr = inet_addr("127.0.0.1");
    memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));

    s = bind(wS,(struct sockaddr *)&sA,sizeof(sA));
    if(s==0)
        printf("bind successful\n");

    listen(wS,1);
    aS = sizeof(sS);

    printf("server ready\n");

    nS = accept(wS,(struct sockaddr *)&sS,&aS);
    if(nS>0)
        printf("accepted\n");

    recv(nS,b,1024,0);
    printf("word to be searched = %s\n",b);

    for(i=0;i<7;i++)
    {
        if(strcmp(b,d[i][0])==0)
        {
            strcpy(w,d[i][1]);
            send(nS,w,strlen(w),0);

            strcpy(a,d[i][2]);
            send(nS,a,strlen(a),0);
        }
        else
        {
            c++;
        }
    }

    if(c==7)
    {
        strcpy(w,"word not found in dictionary");
        send(nS,w,strlen(w),0);
    }

    close(nS);
    close(wS);

    return 0;
}
