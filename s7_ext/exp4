%{
#include <stdio.h>
%}


%%

[ \t\r\n]+ ;
. { ECHO; }

%%

int main() {
	yyin = fopen("input.txt","r");
	yyout = fopen("output.txt","w");
	yylex();
	
	fclose(yyin);
	fclose(yyout);
	return 0;
}

int yywrap() {
	return 1;
}
