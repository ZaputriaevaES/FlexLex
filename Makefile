test: lex.l
	@flex lex.l
	@g++ main.cpp lex.cpp lex.yy.c -lfl -o a.out 
	
