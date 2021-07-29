
digit [0-9]                     
letter [a-zA-Z_]
%%
{letter}({letter}|{digit})*    	{ printf ("Found  ID with lexeme %s\n", yytext); }
int     			{ printf ("Found  INT with lexeme %s\n", yytext); }
float     			{ printf ("Found  FLOAT with lexeme %s\n", yytext); }

