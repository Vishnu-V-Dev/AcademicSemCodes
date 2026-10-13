%{
#include <stdio.h>
#include <ctype.h>
%}

%%

[a-z] 	{ fprintf(yyout, "%c", toupper(yytext[0])); }
.		{ ECHO; }

%%

int main() {
	yyin = fopen("a1.txt","r");
	yyout = fopen("b.txt", "w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	return 0;
}

