%{
#include <stdio.h>
%}
%left '+'
%token NUM
%%
E : NUM    
	{ printf("found an expression consisting of a number %d\n", yylval);}
  | E '+' E  
	{ printf("found a plus expression\n");}
