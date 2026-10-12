%{
#include <stdio.h>
%}

digit [0-9]
id [a-zA-Z][a-zA-Z0-9]*

%%
"if"|"else"|"while"|"int"|"switch"|"for"|"printf"|"scanf" { printf("%s is a keyword\n", yytext); }

"+"|"-"|"*"|"/"|"%" { printf("%s is an operator\n", yytext); }

"=="|"<="|">="|"!="|">"|"<" { printf("%s is a relational operator\n", yytext); }

"=" { printf("%s is an assignment operator\n", yytext); }

","|";"|"("|")"|"{"|"}" { printf("%s is a special character\n", yytext); }

{id} { printf("%s is an identifier\n", yytext); }

{digit}+(\.{digit}+)? { printf("%s is a number\n", yytext); }

%%

int main()
{
    yyin = fopen("input.txt", "r");

    yylex();
    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}

//TO RUN
lex lex_analyzer.l
gcc lex.yy.c -ll
./a.out

input.txt
int main() {
    int a = 10;
    a = a + 20;
}


