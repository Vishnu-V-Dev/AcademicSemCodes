%{
#include <stdio.h>
int v = 0, c = 0;
%}


%%

[aeiouAEIOU] { v++; }
[a-zA-Z] { c++; }
\n { return 0; }
. ;

%%

int main(void) {
	printf("Enter a string: ");
	yylex();
	printf("No of Vowels: %d\n",v);
	printf("No of constants: %d\n",c);
	return 0;
}

int yywrap(void) {
	return 1;
}
