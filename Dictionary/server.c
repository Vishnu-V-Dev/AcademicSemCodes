#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>

int main() {
	int wS,nS,s,i,c=0;
	char b[1024], w[1024], a[1024];
	struct sockaddr_in sA;
	struct sockaddr_storage sS;
	socklen_t aS;
	
	char dict[7][3][1000] = {
		{"bad","bad","good"},
        {"good","good","bad"},
        {"ugly","ugly","not ugly"},
        {"heaven","heaven","hell"},
        {"go","go","come"},
        {"below","below","above"},
        {"above","above","below"}
	};
	
	wS = socket(AF_INET,SOCK_STREAM,0);
	
	sA.sin_family = AF_INET;
	sA.sin_port = htons(7891);
	sA.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	memset(sA.sin_zero,'\0',sizeof(sA.sin_zero));
	
	s = bind(wS,(struct sockaddr *)&sA,sizeof(sA));
	if(s==0) printf("bind successfull\n");
	
	listen(wS,1);
	printf("listening...\n");
	
	aS=sizeof(sS);
	nS = accept(wS,(struct sockaddr *)&sS,&aS);
	
	recv(nS,b,1024,0);
	printf("word to be searched: %s\n",b);
	
	for(i=0;i<7;i++) {
		if(strcmp(b,dict[i][0]) == 0 ) {
			
			strcpy(w,dict[i][1]);
			send(nS,w,sizeof(w),0);
			
			strcpy(a,dict[i][2]);
			send(nS,a,sizeof(a),0);
		}
		else {
			c++;
		}
	}
	if (c == 7) {
		strcpy(w, "word not found.");
		send(nS,w,sizeof(w),0);
	}
	close(wS);
    close(nS);
	return 0;
}
