#include "Tokens.h"
#include <stdio.h>

#ifdef EOF
#undef EOF
#endif

#define EOF 0

/**
* Prototipos de funcion
**/
extern int yylex (void);
extern char* yytext;
extern int tokenCount;

char* getTokenLabel(int tokenCode);


int main(int argc, char* argv[])
{
	int tokenCode = yylex();
	char* tokenName = getTokenLabel(tokenCode);

	while(tokenCode != EOF)
	{
		printf("El lexema detectado '%s' pertence al token %s\n", yytext, tokenName);
		tokenCode = yylex();
		tokenName = getTokenLabel(tokenCode);
	}

	printf("El analizador ha detectado un total de %d lexemas\n", tokenCount);

	return 0;

}

char* getTokenLabel(int tokenCode)
{
	printf("%d\n",tokenCode);
	switch (tokenCode)
	{
	case _PROGRAM:
		return "Program";
		break;
	
	default:
		return "UNKNOW";
		break;
	}	
}

/*
{PROGRAM}       											{return	(_PROGRAM); }
("e"|"E")("n"|"N")("d"|"D")("v"|"V")("a"|"A")("r"|"R")("s"|"S")        											{return	(_ENDVARS); }
("e"|"E")("n"|"N")("d"|"D")("p"|"P")("r"|"R")("o"|"O")("c"|"C")("s"|"S")        								{return	(_ENDPROCS); }
("v"|"V")("a"|"A")("r"|"R")("i"|"I")("a"|"A")("b"|"B")("l"|"L")("e"|"E")("s"|"S")       						{return	(_VARS); }
("n"|"N")("o"|"O")("v"|"V")("a"|"A")("r"|"R")("i"|"I")("a"|"A")("b"|"B")("l"|"L")("e"|"E")("s"|"S")        		{return	(_NOVARS); }
("i"|"I")("n"|"N")("t"|"T")("e"|"E")("g"|"G")("e"|"E")("r"|"R")        											{return	(_INTEGER); }
("r"|"R")("e"|"E")("a"|"A")("l"|"L")        																	{return	(_REAL); }
("s"|"S")("t"|"T")("r"|"R")("i"|"I")("n"|"N")("g"|"G")        													{return	(_STRING); }
("p"|"P")("r"|"R")("o"|"O")("c"|"C")("e"|"E")("d"|"D")("u"|"U")("r"|"R")("e"|"E")("s"|"S")        				{return	(_PROCS); }
("n"|"N")("o"|"O")("p"|"P")("r"|"R")("o"|"O")("c"|"C")("e"|"E")("d"|"D")("u"|"U")("r"|"R")("e"|"E")("s"|"S")	{return	(_NOPROCS); }
("p"|"P")("r"|"R")("o"|"O")("c"|"C")("e"|"E")("d"|"D")("u"|"U")("r"|"R")("e"|"E")        						{return	(_PROC); }
("b"|"B")("e"|"E")("g"|"G")("i"|"I")("n"|"N")        															{return	(_BEGIN); }
("e"|"E")("n"|"N")("d"|"D")         				 															{return	(_END); }
("f"|"F")("o"|"O")("r"|"R")         				 															{return	(_FOR); }
("t"|"T")("o"|"O")        		 					 															{return	(_TO); }
("d"|"D")("o"|"O")        							 															{return	(_DO); }
("i"|"I")("f"|"F")        							 															{return	(_IF); }
("t"|"T")("h"|"H")("e"|"E")("n"|"N")        		 															{return	(_THEN); }
("e"|"E")("l"|"L")("s"|"S")("e"|"E")        		 															{return	(_ELSE); }
("r"|"R")("e"|"E")("a"|"A")("d"|"D")        		 															{return	(_READ); }
("w"|"W")("r"|"R")("i"|"I")("t"|"T")("e"|"E")        															{return	(_WRITE); }*/