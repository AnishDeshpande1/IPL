BEGIN {
	printf "void print_lex_trace(unsigned char yyc, char *yybp, char *yycp, int yycs, int yylas);\n\n";
}
{
	if ($1 == "yy_match:")
		keep_counting = 1;
	if (keep_counting)
		count++; 
	if (count == 10)
	{
		keep_counting = 0;
		count = 0;
		printf "\t\tprint_lex_trace(yy_c, yy_bp, yy_last_accepting_cpos, yy_current_state, yy_last_accepting_state);\n";
	}
	if (($0 == "static yyconst YY_CHAR yy_ec[256] =") || ($0 == "static const YY_CHAR yy_ec[256] ="))
		print  "const YY_CHAR yy_ec[256] =";
	else
		print $0;
}
