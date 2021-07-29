%{
#include <stdio.h>
%}

%option noyywrap
%%
a+b    { printf ("found token a*b with lexeme %s\n",yytext); }
c+     { printf ("found token c+ with lexeme %s\n",yytext); }
%%
