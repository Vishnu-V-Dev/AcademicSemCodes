%{
#include "y.tab.h"
%}

%%
[0-9]+              { yylval.dval = yytext[0]; return NUM; }
[ \t]               ;
\n                  { return '\n'; }
.                   { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}



