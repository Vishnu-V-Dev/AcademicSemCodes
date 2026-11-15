%{
#include <stdio.h>
%}

%token NUM;
%left '+''-'
%left '*''/''%'
%left UMINUS

%%
input: | input E '\n' { printf("Result = %d\n", $2); };

E: E'+'E { $$ = $1 + $3; } 
  |E'-'E { $$ = $1 - $3; } 
  |E'*'E { $$ = $1 * $3; }
  |E'/'E { if ($3 == 0) {
  printf("Division by Zero\n");
  YYABORT;
  }
  $$ = $1 / $3; }
  
  |E'%'E { if ($3 == 0) {
  printf("Modulo by Zero\n");
  YYABORT;
  }
  $$ = $1 % $3; }
  |'-'E %prec UMINUS { $$ = -$2; }
  |'('E')' { $$ = $2; }
  |NUM { $$ = $1; }
  ;
  
%%

int main(void) {
	printf("Enter an arithmetic expression: ");
	return yyparse();
}

int yyerror(const char *s) {
	printf("Invalid expression.\n");
	return 0;
}
