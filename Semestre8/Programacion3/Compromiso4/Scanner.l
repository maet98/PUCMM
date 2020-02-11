%option noyywrap

D 		[0-9]
A 		[a-zA-Z]
ALFA	({D}|{A}) 
prog (?i:program)
%{
#include "Tokens.h"

int tokenCount;
%}

%%
"{"[^}\n]*																										{printf("Comentario ilimitado.\n"); exit(1);}
"{"[^}]*"}"																										{tokenCount++; return (_COMMENT);}
["][^"]*																											{printf("String ilimitado.\n"); exit(1);}
["][^"]*["]																										{tokenCount++; return (_LITERAL);}
{D}+("."1{D}+)?[eE]"-"?{D}+																						{tokenCount++; return (_ECONST);}
([-+]?[1-9]{D})|"0"																								{tokenCount++; return (_ICONST); }
{D}+"."{D}+																										{tokenCount++; return (_RCONST); }
"["																												{tokenCount++; return (_LBRACK);}
"]"																												{tokenCount++; return (_RBRACK);}
"("																												{tokenCount++; return (_LPAREN);}
")"																												{tokenCount++; return (_RPAREN);}
";"																												{tokenCount++; return (_SEMI);}
":"																												{tokenCount++; return (_COLON);}
","																												{tokenCount++; return (_COMMA);}
":""="																											{tokenCount++; return (_ASSIGN);}
"+"																												{tokenCount++; return (_PLUS);}
"-"																												{tokenCount++; return (_MINUS);}
"*"																												{tokenCount++; return (_MULT);}
"/"																												{tokenCount++; return (_DIVIDE);}
"="																												{tokenCount++; return (_EQL);}
"<"																												{tokenCount++; return (_LESS);}
">"																												{tokenCount++; return (_GTR);}
"<""="																											{tokenCount++; return (_LEQ);}
">""="																											{tokenCount++; return (_GEQ);}
"<"">"																											{tokenCount++; return (_NEQ);}
(?i:program)														 											{tokenCount++; return (_PROGRAM);}
("e"|"E")("n"|"N")("d"|"D")("v"|"V")("a"|"A")("r"|"R")("s"|"S")        											{tokenCount++; return (_ENDVARS); }
("e"|"E")("n"|"N")("d"|"D")("p"|"P")("r"|"R")("o"|"O")("c"|"C")("s"|"S")        								{tokenCount++; return (_ENDPROCS); }
("v"|"V")("a"|"A")("r"|"R")("i"|"I")("a"|"A")("b"|"B")("l"|"L")("e"|"E")("s"|"S")       						{tokenCount++; return (_VARS); }
("n"|"N")("o"|"O")("v"|"V")("a"|"A")("r"|"R")("i"|"I")("a"|"A")("b"|"B")("l"|"L")("e"|"E")("s"|"S")        		{tokenCount++; return (_NOVARS); }
("i"|"I")("n"|"N")("t"|"T")("e"|"E")("g"|"G")("e"|"E")("r"|"R")        											{tokenCount++; return (_INTEGER); }
("r"|"R")("e"|"E")("a"|"A")("l"|"L")        																	{tokenCount++; return (_REAL); }
("s"|"S")("t"|"T")("r"|"R")("i"|"I")("n"|"N")("g"|"G")        													{tokenCount++; return (_STRING); }
("p"|"P")("r"|"R")("o"|"O")("c"|"C")("e"|"E")("d"|"D")("u"|"U")("r"|"R")("e"|"E")("s"|"S")        				{tokenCount++; return (_PROCS); }
("n"|"N")("o"|"O")("p"|"P")("r"|"R")("o"|"O")("c"|"C")("e"|"E")("d"|"D")("u"|"U")("r"|"R")("e"|"E")("s"|"S")	{tokenCount++; return (_NOPROCS); }
("p"|"P")("r"|"R")("o"|"O")("c"|"C")("e"|"E")("d"|"D")("u"|"U")("r"|"R")("e"|"E")        						{tokenCount++; return (_PROC); }
("b"|"B")("e"|"E")("g"|"G")("i"|"I")("n"|"N")        															{tokenCount++; return (_BEGIN); }
("e"|"E")("n"|"N")("d"|"D")         				 															{tokenCount++; return (_END); }
("f"|"F")("o"|"O")("r"|"R")         				 															{tokenCount++; return (_FOR); }
("t"|"T")("o"|"O")        		 					 															{tokenCount++; return (_TO); }
("d"|"D")("o"|"O")        							 															{tokenCount++; return (_DO); }
("i"|"I")("f"|"F")        							 															{tokenCount++; return (_IF); }
("t"|"T")("h"|"H")("e"|"E")("n"|"N")        		 															{tokenCount++; return (_THEN); }
("e"|"E")("l"|"L")("s"|"S")("e"|"E")        		 															{tokenCount++; return (_ELSE); }
("r"|"R")("e"|"E")("a"|"A")("d"|"D")        		 															{tokenCount++; return (_READ); }
("w"|"W")("r"|"R")("i"|"I")("t"|"T")("e"|"E")        															{tokenCount++; return (_WRITE); }
({A}|"_")({ALFA}|"_")*																							{tokenCount++; return (_ID);}
.

%%

void yyerror(int tokenCount)
{
	printf("Hubo un error al analizar el lexema %s en la columna %d", yytext, tokenCount);
	exit(1);
}
