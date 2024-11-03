#include <stdio.h>
int a[20],size,front,rear;
void EQ(int item) {
	if(rear==size-1)
	printf("Queue is full. Insertion not possible");
	
	else if(rear==-1) {
		front=0;rear=0;
		a[rear]=item;
	}
	else {
		rear++;
		a[rear]=item;
	}
}
void DQ() {
	if(front==-1)
	printf("Queue is empty");
	
	else if(front==rear) {
		printf("Deleted item is %d",a[front]);
		front=-1; rear=-1;
	}
	else {
		printf("Deleted item is %d",a[front]);
		front ++;
	}
}
void display() {
	if(front==-1) {
	printf("Queue is empty");
}
	else {
		for(int i=front;i<=rear;i++)
		printf("%d\t",a[i]);
	}
}
int main() {
	int item,opt;
	front=-1;
	rear=-1;
	printf("Enter the size of the queue: ");
	scanf("%d",&size);
	do {
		printf("\nEnter the option:\n");
		printf("1.Enqueue\n2.Dequeue\n3.Display\n4.Exit\n");
		scanf("%d",&opt);
		switch(opt) {
			case 1: printf("Enter the item to be inserted: ");
			scanf("%d",&item);
			EQ(item);
			break;
			
			case 2: DQ();
			break;
			
			case 3: display();
			break;
			
			case 4: printf("Exiting...\n");
			break;
			
			default:printf("Invalid option.");
		}
	}while (opt != 4);
}
