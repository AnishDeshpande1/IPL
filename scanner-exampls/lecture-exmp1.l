%{		// This part contains declations for the C code that
                // in the last part
#include <bits/stdc++.h>
#include <stdio.h>
using namespace std;
%}
%option noyywrap
%%
a*b    { cout<<"found token a*b with lexeme "<<yytext<<endl ; }
c+     { cout<<"found token c+ with lexeme "<<yytext<<endl; }
%%

// An interesting question is what happens when we add a rule 
// with pattern `.' as the last rule to consume any character
// (other than `\n'). Create the NFA and the DFA
int main()
{
	yylex();
	return 0;
}