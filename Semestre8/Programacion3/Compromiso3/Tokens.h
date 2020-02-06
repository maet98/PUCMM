#ifndef TOKENS_H_INCLUDED
#define TOKENS_H_INCLUDED

/***
 * Header file that contains all token code constants
 * used by flex output source code
 *
 * @Author : Manuel Peralta.
 *
 * */

#include <stdio.h>

enum TOKENS {
    TELE = 1,
    MATRICULA,
    CORREO,
    ASGPVA,
    URL
};

#endif // TOKENS_H_INCLUDED
