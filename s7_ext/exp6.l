%{
#include <stdio.h>
%}

%%

"int"|"float"|"char"|"for"|"return"|"printf"|"scanf"|"include" { printf("Keyword: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }

[0-9]+(\.[0-9]+)? { printf("Number: %s\n", yytext); }

"=="|"<="|">="|"!="|"&&"|"||"|[+\-*/=<>!] { printf("Operator: %s\n", yytext); }

[(){};,\#] { printf("Seprator: %s\n", yytext); }

[ \t\n]+ { }

%%
int main() {
    yyin = fopen("source.txt", "r");
    yylex();
    
    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
