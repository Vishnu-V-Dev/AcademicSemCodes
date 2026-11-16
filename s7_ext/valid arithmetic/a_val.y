%{
#include <stdio.h>
%}

%token NUM ID
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input: | input E '\n' { printf("Valid expression\n"); };

E: E'+'E
  |E'-'E
  |E'*'E
  |E'/'E
  |'('E')'
  |'-'E %prec UMINUS
  |ID
  |NUM
  ;

%%

int main() {
	printf("Enter the expression: ");
	yyparse();
	return 0;
}

int yyerror() {
	printf("Invalid expression\n");
	return 0;
}
