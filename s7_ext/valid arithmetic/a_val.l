%{
#include <stdio.h>
#include "y.tab.h"
%}

%%

[0-9]+ { return NUM; }
[a-z_][a-zA-Z0-9_]* { return ID; }
[ \t] ;
\n { return '\n'; }
. { return yytext[0]; }

%%

int yywrap() {
	return 1;
}
