#include "Tokens.h"
#include <stdio.h>

#ifdef EOF
#undef EOF
#endif

#define EOF 0

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
	switch (tokenCode)
	{
		case _ID:
			return "ID";
			break;
		case _ICONST:
			return "ICONST";
			break;
		case _RCONST:
			return "RCONST";
			break;
		case _COMMENT:
			return "COMMENT";
			break;
		case _ECONST:
			return "ECONST";
			break;
		case _LITERAL:
			return "LITERAL";
			break;
		case _LBRACK:
			return "LBRACK";
			break;
		case _RBRACK:
			return "RBRACK";
			break;
		case _LPAREN:
			return "LPAREN";
			break;
		case _RPAREN:
			return "RPAREN";
			break;
		case _SEMI:
			return "SEMI";
			break;
		case _COLON:
			return "COLON";
			break;
		case _COMMA:
			return "COMMA";
			break;
		case _ASSIGN:
			return "ASSIGN";
			break;
		case _PLUS:
			return "PLUS";
			break;
		case _MINUS:
			return "MINUS";
			break;
		case _MULT:
			return "MULT";
			break;
		case _DIVIDE:
			return "DIVIDE";
			break;
		case _EQL:
			return "EQUAL";
			break;
		case _LESS:
			return "LESS";
			break;
		case _GTR:
			return "GREATER";
			break;
		case _LEQ:
			return "LESSEQUAL";
			break;
		case _GEQ:
			return "GREATEQUAL";
			break;
		case _NEQ:
			return "NOEQUAL";
			break;
		case _PROGRAM:
			return "PROGRAM";
			break;
		case _ENDVARS:
			return "ENDVARIABLES";
			break;
		case _ENDPROCS:
			return "ENDPROCEDURES";
			break;
		case _VARS:
			return "VARIABLES";
			break;
		case _NOVARS:
			return "NOVARIABLES";
			break;
		case _INTEGER:
			return "INTEGER";
			break;
		case _REAL:
			return "REAL";
			break;
		case _STRING:
			return "STRING";
			break;
		case _PROCS:
			return "PROCEDURES";
			break;
		case _NOPROCS:
			return "NOPROCEDURES";
			break;
		case _PROC:
			return "PROCEDURE";
			break;
		case _BEGIN:
			return "BEGIN";
			break;
		case _END:
			return "END";
			break;
		case _FOR:
			return "FOR";
			break;
		case _TO:
			return "TO";
			break;
		case _DO:
			return "DO";
			break;
		case _IF:
			return "IF";
			break;
		case _THEN:
			return "THEN";
			break;
		case _ELSE:
			return "ELSE";
			break;
		case _READ:
			return "READ";
			break;
		case _WRITE:
			return "WRITE";
			break;

		default:
			return "UNKNOW";
			break;
	}	
}