#include <stdio.h>
int stack[100],choice,n,top,x,i;
void push() {
	if(top>=n-1) {
		printf("\n\tStack OVERFLOW");
	}
	else {
		printf("Enter the Value to be pushed: ");
		scanf("%d",&x);
		top++;
		stack[top]=x;
	}
}
void pop() {
	if(top<=-1) {
		printf("\n\tStack UNDERFLOW");
	}
	else {
		printf("\n\tThe popped element is %d",stack[top]);
		top--;
	}
}
void display() {
	if(top>=0) {
		printf("\n The element in Stack\n");
		for(i=top;i>=0;i--)
		printf("\n%d",stack[i]);
		printf("\nPress Next Choice");
	}
	else {
		printf("Stack is empty");
	}
}
int main() {
	top=-1;
	printf("Enter the size of the stack[MAX=100]: ");
	scanf("%d",&n);
	printf("\n\tStack Operations using Array");
	printf("\n\t----------------------------");
	printf("\n1.Push\n2.Pop\n3.Display\n4.Exit");
	
	do {
		printf("\nEnter the choice: ");
		scanf("%d",&choice);
		switch(choice) {
			case 1: push();
			break;
			
			case 2: pop();
			break;
			
			case 3: display();
			break;
			
			case 4: printf("\n\tEXIT POINT");
			break;
			
			default: printf("Invalid Option.");
		}
	}while(choice != 4);
	return 0;
}
		
	
