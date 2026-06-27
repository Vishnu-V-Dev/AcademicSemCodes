#include <stdio.h>
int a[20],size,front,rear;

void eq(int item) {
	if((rear+1)%size==front)
		printf("Queue is full.");
	else if(rear==-1) {
		front=rear=0; a[rear]=item;
	}
	else {
		rear=(rear+1)%size;
		a[rear]=item;
	}
}
void dq() {
	if(front==-1)
		printf("Queue is empty.");
	else if(front==rear) {
		printf("Deleted item: %d",a[front]);
		front=rear=-1;
	}
	else {
		printf("Deleted item: %d",a[front]);
		front=(front+1)%size;
	}
}
void display() {
	if(front==-1)
		printf("Queue is empty");
	else if(front<=rear) {
		for(int i=front;i<=rear;i++) {
			printf("%d\t",a[i]);
		}
	}
	else {
		for(int i=front;i<=size-1;i++) {
			printf("%d\t",a[i]);
		}
	}
}
int main() {
	int item,opt;
	front=rear=-1;
	printf("Enter the size of the Queue: ");
	scanf("%d",&size);
	
	do {
		printf("Enter the option: \n");
		printf("1.Enqueue\n2.Dequeue\n3.Display\n4.Exit\n");
		scanf("%d",&opt);
		
		switch(opt) {
			case 1: printf("Enter the item to be inserted: ");
			scanf("%d",&item);
			eq(item);
			break;
			
			case 2: dq();
			break;
			
			case 3: display();
			break;
			
			case 4: break;
			
			default: printf("Invalid option");
		}
	}while(opt != 4);
}
