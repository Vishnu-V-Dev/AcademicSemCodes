#include <stdio.h>
#include <stdlib.h>

int main() {
    int RQ[100],i,j,n,THM=0,u,s,move;
    //THM=TotalHeadMovement, initial=u, size=s

    printf("Enter the no of Requests\n");
    scanf("%d",&n);
    printf("Enter the Requests Sequence\n");
    for(int i=0;i<n;i++) {
        scanf("%d",&RQ[i]);
    }

    printf("Enter the initial head position\n");
    scanf("%d",&u);
    printf("Enter total disk size\n");
    scanf("%d",&s);
    printf("Enter the head movement direction for high 1 and for low 0\n");
    scanf("%d",&move);

    /*logic for sort the request array*/
    for(i=0;i<n;i++) {
        for(j=0;j<n-i-1;j++) {
            if(RQ[j]>RQ[j+1]) {
                int temp;
                temp=RQ[j];
                RQ[j]=RQ[j+1];
                RQ[j+1]=temp;
            }
        }
    }
    int index;
    for(i=0;i<n;i++) {
        if(u<RQ[i]) {
            index=i;
            break;
        }
    }

    //if movement towards high value
    if(move==1) {
        for(i=index;i<n;i++) {
            THM=THM+abs(RQ[i]-u);
            u=RQ[i];
        }

        //last movement for max size
        THM=THM+abs(s-RQ[i-1]-1);

        /*movement max to min disk*/
        THM=THM+abs(s-1-0);
        u=0;
        for(i=0;i<index;i++) {
            THM=THM+abs(RQ[i]-u);
            u=RQ[i];
        }
    }

    //if movement towards low value
    else {
        for(i=index-1;i>=0;i--) {
            THM=THM+abs(RQ[i]-u);
            u=RQ[i];
        }

        //last movement for min size
        THM=THM+abs(RQ[i+1]-0);

        /*movement min to max disk*/
        THM=THM+abs(s-1-0);
        u=s-1;
        for(i=n-1;i>=index;i--) {
            THM=THM+abs(RQ[i]-u);
            u=RQ[i];
        }
    }
    printf("Total head movement is %d",THM);
    return 0;
}
