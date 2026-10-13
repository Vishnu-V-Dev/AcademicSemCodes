%{
#include <stdio.h>
%}

%token LETTER DIGIT

%%

start:
		LETTER rest { printf("Valid identifier\n"); };

rest:
		LETTER rest | DIGIT rest | /* empty */;
		
%%

int main(void) {
	printf("Enter an identifier: ");
	return yyparse();
}

int yyerror(const char *s) {
	printf("Invalid identifier\n");
	return 0;
}


