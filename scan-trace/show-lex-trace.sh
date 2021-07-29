lex -T $1 2>| $1.dfa
awk -f process-lex-dfa.awk < $1.dfa >| _temp_
cat _temp_ lex-trace-template.txt >| lex-trace.c	
awk -f lex-trace.awk < lex.yy.c >| $1-trace.c
gcc lex-trace.c $1-trace.c -ll
rm -f _temp_  lex.yy.c $1-trace.c lex-trace.c
./a.out
