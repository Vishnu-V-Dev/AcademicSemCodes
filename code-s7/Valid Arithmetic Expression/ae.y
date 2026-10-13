%{
#include <stdio.h>
%}

%token NUMBER ID

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
		| input expr '\n' { printf("Valid expression\n"); };

expr:
		expr '+' expr | expr '-' expr | expr '*' expr | expr '/' expr
		| '(' expr ')' | '-' expr %prec UMINUS
		| NUMBER
		| ID
		;
%%

int main(void) {
	printf("Enter the expression: ");
	return yyparse();
}

int yyerror(const char *s) {
	printf("Invalid expression\n");
	return 0;
}
