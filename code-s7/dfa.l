%{
#include <stdio.h>
%}

%s A B

%%

<INITIAL>[1]		;
<INITIAL>[0]		{ BEGIN A; }
<INITIAL>[^01\n]	{ BEGIN  B; }
<INITIAL>\n			{ printf("Accepted\n"); BEGIN INITIAL; }

<A>[1]		;
<A>[0]		{ BEGIN INITIAL; }
<A>[^01\n]	{ BEGIN B; }
<A>\n		{ printf("Not Accepted\n"); BEGIN INITIAL; }

<B>[^\n]	;
<B>\n		{ printf("Invalid input\n"); BEGIN INITIAL; }

%%

int main(void) {
	printf("Enter a binary string: \n");
	BEGIN INITIAL;
	yylex();
	return 0;
}

int yywrap(void) {
	return 1;
}

