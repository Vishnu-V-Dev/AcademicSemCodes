%{
#include <stdio.h>
int lc = 0, wc = 0, cc = 0;
int v = 0, c = 0, flag = 0;
%}

%%

\n { lc++; flag = 0; }
[aeiouAEIOU] { v++; cc++; if(!flag) { wc++; flag=1; } }
[a-zA-Z] { c++; cc++; if(!flag) { wc++; flag=1; } }
[ \t]+ { cc+=yyleng; flag=0; }
. { cc++; }

%%

int main() {
    printf("Enter the string:");
    yylex();

    printf("No of lines = %d\n", lc);
    printf("No of words = %d\n", wc);
    printf("No of characters = %d\n", cc);
    printf("No of Vowels = %d\n", v);
    printf("No of Consonants = %d\n", c);

    return 0;
}

int yywrap() {
    return 1;
}
