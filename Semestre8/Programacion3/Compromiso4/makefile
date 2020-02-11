all: lexx.yy.c run

run: lex.yy.c 
	gcc test.c lex.yy.c -o run 

lexx.yy.c: Scanner.l Tokens.h
	flex Scanner.l Tokens.h

test: all test1 test2 test3

test1:
	echo "Primer test"
	cat ./TestCases/Caso_De_Prueba_Programa_de_MiniP.txt | ./run > result1.txt

test2:
	echo "Caso Comentario Infinito"
	cat ./TestCases/Caso_de_Prueba_Comentario_Ilimitado.txt | ./run > result2.txt

test3:
	echo "Caso Cadena Ilimitada"
	cat ./TestCases/Caso_de_Prueba_Constante_De_Cadena_Ilimitada.txt | ./run > result3.txt

clean:
	rm run lex.yy.c result*.txt
