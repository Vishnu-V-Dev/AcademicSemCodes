%{
#include <stdio.h>
%}

%token NUM
%left '+' '-'
%left '*' '/' '%'
%left UMINUS

%%

input: expr '\n' { printf("Result = %d\n", $1); };

expr:	expr '+' expr { $$ = $1 + $3; }
	|	expr '-' expr { $$ = $1 - $3; }
	|	expr '*' expr { $$ = $1 * $3; }
	|	expr '/' expr { if ($3 == 0) { 
							printf("Division by zero\n");
							YYABORT;
						}
						$$ = $1 / $3;
					}
	|	expr '%' expr { if ($3 == 0) {
							printf("Modulo by zero\n");
							YYABORT;
						}
						$$ = $1 % $3;
					}
	|	'-' expr %prec UMINUS { $$ = -$2; }
	|	'(' expr ')' { $$ = $2; }
	|	NUM { $$ = $1; }
	;
%%

int main(void) {
	printf("Enter an arithmetic expression: ");
	return yyparse();
}

int yyerror(const char *s) {
	printf("Invalid expression\n");
	return 0;
}

