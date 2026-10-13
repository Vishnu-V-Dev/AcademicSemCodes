%{
#include <stdio.h>
%}

%%
[ \t]+ ;
\n { putchar('\n'); }
. { ECHO; }
%%

int main(void) {
	printf("Enter text (Ctrl + D to finish): \n");
	yylex();
	return 0;
}

int yywrap(void) {
	return 1;
}
