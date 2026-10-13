%{
#include "y.tab.h"
%}

%%
[0-9]+					{ return NUMBER; }
[_a-zA-z][_a-zA-Z0-9]* 	{ return ID; }
[ \t]					;
\n						{ return '\n'; }
.						{ return yytext[0]; }

%%

int yywrap(void) {
	return 1;
}
