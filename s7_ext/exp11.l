%{
#include <stdio.h>
%}

%s EO OE OO B

%%

<INITIAL>0 { BEGIN OE; }
<INITIAL>1 { BEGIN EO; }
<INITIAL>[^01\n] { BEGIN B; }
<INITIAL>\n { BEGIN INITIAL; printf("Not Accepted\n"); }  /* change to Accepted for even 0s and 1s */

<EO>0 { BEGIN OO; }
<EO>1 { BEGIN INITIAL; }
<EO>[^01\n] { BEGIN B; }
<EO>\n { BEGIN INITIAL; printf("Not Accepted\n"); } /* change to Accepted for even 0s and odd 1s */

<OE>0 { BEGIN INITIAL; }
<OE>1 { BEGIN OO; }
<OE>[^01\n] { BEGIN B; }
<OE>\n { BEGIN INITIAL; printf("Not Accepted\n"); } /* change to Accepted for odd 0s and even 0s */

<OO>0 { BEGIN EO; }
<OO>1 { BEGIN OE; }
<OO>[^01\n] { BEGIN B; }
<OO>\n { BEGIN INITIAL; printf("Accepted\n"); } /* change to Accepted for odd 0s and odd 0s */


<B>0 { BEGIN B; }
<B>1 { BEGIN B; }
<B>[^01\n] { BEGIN B; }
<B>\n { BEGIN INITIAL; printf("Invalid\n"); } /* Dead state */


%%

int main() {
	printf("Enter the binary String: ");
	yylex();
	return 0;

}

int yywrap() {
	return 1;
}
