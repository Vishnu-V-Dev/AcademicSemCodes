#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#define SIZE 100

char stack[SIZE];
int top = -1;

void push(char item) {
    if (top < SIZE - 1) {
        stack[++top] = item;
    } else {
        printf("Stack Overflow.\n");
    }
}

char pop() {
    if (top < 0) {
        printf("Stack underflow: invalid infix expression\n");
        exit(1);
    }
    return stack[top--];
}

int precedence(char symbol) {
    switch (symbol) {
        case '^': return 3;
        case '*':
        case '/': return 2;
        case '+':
        case '-': return 1;
        default: return 0;
    }
}

void InfixToPostfix(char* infix, char* postfix) {
    int j = 0;
    push('(');
    strcat(infix, ")");

    for (int i = 0; infix[i]; i++) {
        char item = infix[i];
        if (isalnum(item)) {
            postfix[j++] = item;
        } else if (item == '(') {
            push(item);
        } else if (item == ')') {
            while (top >= 0 && stack[top] != '(') {
                postfix[j++] = pop();
            }
            pop(); // Remove '('
        } else if (strchr("+-*/^", item)) {
            while (top >= 0 && precedence(stack[top]) >= precedence(item)) {
                postfix[j++] = pop();
            }
            push(item);
        } else {
            printf("Invalid infix Expression.\n");
            exit(1);
        }
    }
    postfix[j] = '\0';
}

int main() {
    char infix[SIZE], postfix[SIZE];
    printf("Enter Infix expression: ");
    fgets(infix, SIZE, stdin);
    infix[strcspn(infix, "\n")] = 0; // Remove newline character
    InfixToPostfix(infix, postfix);
    printf("Postfix Expression: %s\n", postfix);
    return 0;
}
