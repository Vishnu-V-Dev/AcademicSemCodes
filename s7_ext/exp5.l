%{
#include <stdio.h>
int l = 0;
%}

%%

. { l++; }
\n { printf("Length of the string: %d\n", l); l=0; }

%%

int main() {
	printf("Enter a string: ");
	yylex();
	return 0;
}

int yywrap() {
	return 1;
}
