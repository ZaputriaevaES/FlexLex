test: lex.l
	@flex lex.l
	@g++ lex.yy.c -lfl -o a.out 
	
