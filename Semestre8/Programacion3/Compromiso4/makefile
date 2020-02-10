all: lexx.yy.c run

run: lex.yy.c 
	gcc test.c lex.yy.c -o run 

lexx.yy.c: Scanner.l Tokens.h
	flex Scanner.l Tokens.h

test: all
	echo "Primer test"
	cat ./TestCases/Caso_De_Prueba_Programa_de_MiniP.txt | ./run
	echo "Caso Comentario Infinito"
	cat ./TestCases/Caso_de_Prueba_Comentario_Ilimitado.txt | ./run
	echo "Caso Cadena Ilimitada"
	cat ./TestCases/Caso_de_Prueba_Constante_De_Cadena_Ilimitada.txt | ./run

clean:
	rm run lex.yy.c
