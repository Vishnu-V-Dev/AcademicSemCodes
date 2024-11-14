#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct tree {
	int data;
	struct tree *lc,*rc;
};
void bt(struct tree *ptr) {
	struct tree *lcptr,*rcptr;
	int c;
	if(ptr != NULL) {
		printf("\nEnter the data: ");
		scanf("%d",&ptr->data);
		ptr->lc=NULL;
		ptr->rc=NULL;
		printf("\nDo you want to create a left child for %d(1/0): ",ptr->data);
		scanf("%d",&c);
		if(c==1) {
			lcptr=(struct tree*)malloc(sizeof(struct tree));
			ptr->lc=lcptr;
			bt(lcptr);
		}
		printf("\nDo you want to create a right child for %d(1/0): ",ptr->data);
		scanf("%d",&c);
		if(c==1) {
			rcptr=(struct tree*)malloc(sizeof(struct tree));
			ptr->rc=rcptr;
			bt(rcptr);
		}
	}
}
void inorder(struct tree *ptr) {
	if(ptr != NULL) {
		inorder(ptr->lc);
		printf("%d\t",ptr->data);
		inorder(ptr->rc);
	}
}
void preorder(struct tree *ptr) {
	if(ptr != NULL) {
		printf("%d\t",ptr->data);
		preorder(ptr->lc);
		preorder(ptr->rc);
	}
}
void postorder(struct tree *ptr) {
	if(ptr != NULL) {
		postorder(ptr->lc);
		postorder(ptr->rc);
		printf("%d\t",ptr->data);
	}
}
int main() {
	struct tree *r;
	r=(struct tree*)malloc(sizeof(struct tree));
	bt(r);
	printf("\nInorder traversal\n");
	inorder(r);
	printf("\nPreorder traversal\n");
	preorder(r);
	printf("\nPostorder traversal\n");
	postorder(r);
}
