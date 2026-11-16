%{
#include <stdio.h>
#include <stdlib.h>
char p = 'A';
%}

%union { char dval; }

%token <dval> NUM
%type <dval> expr
%left '+' '-'
%left '*' '/'

%%
input: expr '\n' { printf("X = %c\n", $1); printf("Valid expression\n"); };

expr: NUM { $$ = $1; }
    | expr '+' expr { printf("%c = %c + %c\n", p, $1, $3); $$ = p++; }
    | expr '-' expr { printf("%c = %c - %c\n", p, $1, $3); $$ = p++; }
    | expr '*' expr { printf("%c = %c * %c\n", p, $1, $3); $$ = p++; }
    | expr '/' expr { printf("%c = %c / %c\n", p, $1, $3); $$ = p++; }
    | '(' expr ')' {  $$ = $2; };

%%

int main(void) {
    printf("Enter the expression: ");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("Invalid expression\n");
    return 0;
}
