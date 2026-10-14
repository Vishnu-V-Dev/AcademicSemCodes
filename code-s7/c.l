%{
#include <stdio.h>
int lc = 0, wc = 0, cc = 0;
%}

%%

\n { lc++; }
[^\n\t]+ { wc++; cc+=yyleng; }
. { cc++; }

%%

int main() {
	printf("Enter the sting: ");
	yylex();
	printf("No of lines = %d\n", lc);
	printf("No of words = %d\n", wc);
	printf("No of character = %d\n", cc);
	return 0;
}

int yywrap() {
	return 1;
}
