all: lexx.yy.c test

test: lex.yy.c 
	gcc test.c lex.yy.c -o test 

lexx.yy.c: SimpleScanner.txt Tokens.h
	flex SimpleScanner.txt Tokens.h