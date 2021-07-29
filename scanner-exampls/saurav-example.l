%{		// This part contains declations for the C code that
                // in the last part
#include <stdio.h>
%}
%option noyywrap
%%
abcdz   { printf ("found token abcdz with lexeme %s\n",yytext); }
bcdy    { printf ("found token bcdy with lexeme %s\n",yytext); }
cdx     { printf ("found token cdx with lexeme %s\n",yytext); }
dw      { printf ("found token dw with lexeme %s\n",yytext); }
%%
#if 0
.      { // This matches any character other than newline.
       }

#endif
