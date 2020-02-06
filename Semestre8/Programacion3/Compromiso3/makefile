all: testCase

testCase: TestLexer.c lex.yy.c
	gcc TestLexer.c lex.yy.c -o testCase

lex.yy.c: SimpleScanner.txt Tokens.h
	flex SimpleScanner.txt Tokens.h	

test: testCase
	cat test.txt
	./testCase < test.txt

clean:
	rm lex.yy.c testCase
