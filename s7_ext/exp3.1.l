%{
#include <stdio.h>
int credit = 0, debit = 0, total = 0;
%}

%%

-[0-9]+  { debit++; total++; }
[0-9]+   { credit++; total++; }
.        ;

%%

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    
    printf("No of Credits = %d\n", credit);
    printf("No of Debits = %d\n", debit);
    printf("Total numbers = %d\n", total);

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
