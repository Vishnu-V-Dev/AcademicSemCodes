#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#define s 100

char stack[s];
int top=-1;

void push(char item) {
	if(top>=s-1) {
		printf("\nStack Overflow.");
	}
	else {
		top=top+1;
		stack[top]=item;
	}
}

char pop() {
	char item;
	if(top<0) {
		printf("Stack Underflow:Invalid infix expression");
		getchar();
		exit(1) ;
	}
	else {
		item=stack[top];
		top=top-1;
		return(item);
	}
}
int io(char sy) { //is operator
	if(sy=='^'||sy=='*'||sy=='/'||sy=='+'||sy=='-') {
		return 1;
	}
	else {
		return 0;
	}
}

int p(char sy) { //precedence
	if(sy=='^') {
		return(3);
	}
	else if(sy=='*'||sy=='/') {
		return(2);
	}
	else if(sy=='+'||sy=='-') {
		return(1);
	}
	else {
		return(0);
	}
}

void pf(char ie[], char pe[]) { //InfixToPostfix
	int i,j;
	char item;
	char x;
	
	push('(');
	strcat(ie,")");
	
	i=0;
	j=0;
	item=ie[i];
	
	while(item != '\0') {
		if(item=='(') {
			push(item);
		}
		else if(isdigit(item)||isalpha(item)) {
			pe[j]=item;
			j++;
		}
		else if(io(item)==1) {
			x=pop();
			while(io(x)==1 && p(item)) {
				pe[j]=x;
				j++;
				x=pop();
			}
			push(x);
			push(item);
		}
		else if(item==')') {
			x=pop();
			while(x != '(') {
				pe[j]=x;
				j++;
				x=pop();
			}
		}
		else {
			printf("\nInvalid infix Expression.\n");
			getchar();
			exit(1);
		}
		i++;
		item=ie[i];
	}
	if(top>0) {
		printf("\nInvalid infix Expression.\n");
		getchar();
		exit(1);
	}
	pe[j]='\0';
}
int main() {
	char infix[s],postfix[s];
	printf("\nEnter Infix expression: ");
	gets(infix);
	pf(infix,postfix);
	printf("Postfix Expression: ");
	puts(postfix);
	return 0;
}
