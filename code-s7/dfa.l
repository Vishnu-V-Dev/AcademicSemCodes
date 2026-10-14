%{
#include <stdio.h>
%}

%s A B

%%
<INITIAL>1 { BEGIN INITIAL; }
<INITIAL>0 { BEGIN A; }
<INITIAL>[^01\n] { BEGIN B; }
<INITIAL>\n { BEGIN INITIAL; printf("Accepted\n"); }

<A>1 { BEGIN  A;}
<A>0 { BEGIN INITIAL; }
<A>[^01\n] { BEGIN B; }
<A>\n { BEGIN INITIAL; printf("Not Accepted\n"); }

<B>0 { BEGIN B; }
<B>1 { BEGIN B; }
<B>[^01\n] { BEGIN B; }
<B>\n { BEGIN INITIAL; printf("Invalid\n"); }

%%

int main() {
	printf("Enter a binary string: ");
	yylex();
	return 0;
}

int yywrap() {
	return 1;
}
