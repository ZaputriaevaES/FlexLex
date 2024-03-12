#pragma once

#include <stdlib.h>
#include <iostream>
#include <string>

namespace flex_lex 
{
    enum token_class
    {
        OP,
        KEYWORD,
        NUMBER,
        VARIABLE,
        TYPE_ID,

    };

    enum token_value
    {
        ADD, 
        SUB,
        MUL,
        DIV,
        MOD,
        //
        LRBR,
        RRBR,
        LFBR,
        RFBR,
        SMCL,
        //
        TRUE,
        FALSE,
        //
        ELSE,
        IF,
        LOOP,
        THEN,
        WHILE,
        NOT,
        PRINT,
        PRINTLN,
        //
        ASSIGN,
        //
        GTR,
        LSS,
        EQ,
        NEQ,
        GREQ,
        LEQ,
        //
        BOR,
        BAND,
        BNOR,
        LSFT,
        RSFT,
        //
        LOR,
        LAND,
        //

    };

    void token_opr (token_class t_class, token_value t_value);
    void token_num (token_class t_class, char* yytext);
};