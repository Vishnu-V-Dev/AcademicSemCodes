#include<stdio.h>
#include<string.h>
#include<arpa/inet.h>
#include<unistd.h>

int main(){
 int wS,nS;
 char b[1024];
 struct sockaddr_in sA;

 wS=socket(AF_INET,SOCK_STREAM,0);

 sA.sin_family=AF_INET;
 sA.sin_port=htons(7891);
 sA.sin_addr.s_addr=inet_addr("127.0.0.1");

 bind(wS,(struct sockaddr*)&sA,sizeof(sA));
 listen(wS,1);

 nS=accept(wS,NULL,NULL);

 send(nS,"220 SMTP\n",9,0);

 while(1){
  memset(b,0,1024);
  recv(nS,b,1024,0);
  printf("C:%s",b);

  if(!strncmp(b,"HELO",4))
   send(nS,"250 OK\n",7,0);

  else if(!strncmp(b,"MAIL",4))
   send(nS,"250 OK\n",7,0);

  else if(!strncmp(b,"RCPT",4))
   send(nS,"250 OK\n",7,0);

  else if(!strncmp(b,"DATA",4))
   send(nS,"354 OK\n",7,0);

  else if(!strncmp(b,".",1))
   send(nS,"250 OK\n",7,0);

  else if(!strncmp(b,"QUIT",4)){
   send(nS,"221 Bye\n",8,0);
   break;
  }
 }

 close(nS);
 close(wS);
}
