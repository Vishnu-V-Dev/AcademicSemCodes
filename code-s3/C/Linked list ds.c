#include <stdio.h>
#include <stdlib.h>

struct node {
	int data;
	struct node *link;
};
struct node *head;
void display() {
	struct node *ptr;
	if(head==NULL) {
		printf("\nLinked list empty");
	}
	else {
		ptr=head;
		printf("\nLinked list elements\n");
		while(ptr != NULL) {
			printf("%d-->",ptr->data);
			ptr=ptr->link;
			if(ptr==NULL) {
				printf("NULL");
			}
		}
	}
}
void insert_end(int x) {
	struct node *new,*ptr;
	new=(struct node*)malloc(sizeof(struct node));
	new->data=x;
	new->link=NULL;
	if(head==NULL) {
		head=new;
	}
	else {
		ptr=head;
		while(ptr->link != NULL) {
			ptr=ptr->link;
		}
		ptr->link=new;
	}
	display();
}
void delete_front() {
	struct node *temp;
	if(head==NULL) {
		printf("\nList is empty");
	}
	else {
		temp=head;
		head=head->link;
		free(temp);
	}
	display();
}
int main() {
	int opt,x;
	printf("\nLinked List operations\n1.Insert at end\n2.Delete from front\n3.Display\n4.Exit");
	do {
		printf("\nEnter the option: ");
		scanf("%d",&opt);
		
		switch(opt) {
			case 1: printf("Enter the data: ");
			scanf("%d",&x);
			insert_end(x);
			break;
			
			case 2: delete_front();
			break;
			
			case 3: display();
			break;
			
			case 4: printf("EXIT POINT");
			break;
			
			default: printf("Invalid option");
		}
	}while(opt != 4);
	return 0;
}
