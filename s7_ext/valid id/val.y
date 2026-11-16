%{
#include <stdio.h>
%}

%token LETTER DIGIT 

%%

start:  LETTER rest { printf("Vaid Identifier\n"); };

rest: LETTER rest | DIGIT rest | ;

%%


int main() {
	printf("Enter an identifier: ");
	yyparse();

}

int yyerror(const char *s) {
	printf("Invalid Identifier\n");
	return 1;
}
