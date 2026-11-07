%{
#include <stdio.h>
int c = 0;
%}

%%

[a-zA-Z0-9]+ { c += yyleng; }
\n { return 0; }

%%

int main() {
	printf("Enter the String: ");
	yylex();
	printf("Length of the string: %d\n", c);
	return 0;
}

int yywrap() {
	return 1;
}

