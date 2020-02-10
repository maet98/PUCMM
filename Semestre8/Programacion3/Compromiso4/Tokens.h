#ifndef TOKENS_H_INCLUDED
#define TOKENS_H_INCLUDED

/***
 * Header file that contains all token code constants
 * used by flex output source code
 *
 * @Author : Miguel Estevez.
 *
 * */

#include <stdio.h>

enum constantes{
    _ID = 1,
    _ICONST,
    _RCONST,
    _COMMENT,
    _ECONST,
    _LITERAL,
    _LBRACK = 10,
    _RBRACK,
    _LPAREN,
    _RPAREN,
    _SEMI,
    _COLON,
    _COMMA,
    _ASSIGN,
    _PLUS,
    _MINUS,
    _MULT,
    _DIVIDE,
    _EQL = 40,
    _LESS,
    _GTR,
    _LEQ,
    _GEQ,
    _NEQ,
    _HOLA,
    _PROGRAM = 51,
    _ENDVARS,
    _ENDPROCS,
    _VARS,
    _NOVARS,
    _INTEGER,
    _REAL,
    _STRING,
    _PROCS,
    _NOPROCS,
    _PROC,
    _BEGIN,
    _END,
    _FOR,
    _TO,
    _DO,
    _IF,
    _THEN,
    _ELSE,
    _READ,
    _WRITE
};

#endif // TOKENS_H_INCLUDED
