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
    yyout = fopen("output.txt", "w");

    yylex();

    fprintf(yyout, "No of Credits = %d\n", credit);
    fprintf(yyout, "No of Debits = %d\n", debit);
    fprintf(yyout, "Total numbers = %d\n", total);

    fclose(yyin);
    fclose(yyout);

    return 0;
}

int yywrap() {
    return 1;
}
