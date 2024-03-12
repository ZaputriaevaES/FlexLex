#include "lex.h"

void flex_lex::token_opr(token_class t_class, token_value t_value) 
{ 
    if (t_class == OP) 
    {
        std::cout << "Token class: OP,        ";
        switch (t_value)
        {
        case ADD:
            std::cout << "Token value: ADD" << std::endl;
            break;
        case SUB:
            std::cout << "Token value: SUB" << std::endl;
            break;
        case MUL:
            std::cout << "Token value: MUL" << std::endl;
            break;
        case DIV:
            std::cout << "Token value: DIV" << std::endl;
            break;
        case MOD:
            std::cout << "Token value: MOD" << std::endl;
            break;
        //
        case LRBR:
            std::cout << "Token value: LRBR" << std::endl;
            break;        
        case RRBR:
            std::cout << "Token value: RRBR" << std::endl;
            break;
        case LFBR:
            std::cout << "Token value: LFBR" << std::endl;
            break;        
        case RFBR:
            std::cout << "Token value: RFBR" << std::endl;
            break;

        //
        
        case ASSIGN:
            std::cout << "Token value: ASSIGN" << std::endl;
            break;


        case GTR:
            std::cout << "Token value: GREATER" << std::endl;
            break;
        case LSS:
            std::cout << "Token value: LESS" << std::endl;
            break;
        case EQ:
            std::cout << "Token value: EQ" << std::endl;
            break;
        case NEQ:
            std::cout << "Token value: NOTEQ" << std::endl;
            break;
        case GREQ:
            std::cout << "Token value: GREQ" << std::endl;
            break;
        case LEQ:
            std::cout << "Token value: LEQ" << std::endl;
            break;
        //
        case BOR:
            std::cout << "Token value: BIT_OR" << std::endl;
            break;
        case BAND:
            std::cout << "Token value: BIT_AND" << std::endl;
            break;
        case BNOR:
            std::cout << "Token value: BIT_NOR" << std::endl;
            break;
        case LSFT:
            std::cout << "Token value: LEFT_SHIFT" << std::endl;
            break;
        case RSFT:
            std::cout << "Token value: RIGHT_SHIFT" << std::endl;
            break;
        //
        case LOR:
            std::cout << "Token value: LOGIC_OR" << std::endl;
            break;
        case LAND:
            std::cout << "Token value: LOGIC_AND" << std::endl;
            break;
        default:
            break;
        }
    } 
    else if (t_class == KEYWORD) 
    {
        std::cout << "Token class: KEYWORD,   ";
        switch (t_value)
        {
        case TRUE:
            std::cout << "Token value: TRUE" << std::endl;
            break;
        case FALSE:
            std::cout << "Token value: FALSE" << std::endl;
            break;
        //
        case ELSE:
            std::cout << "Token value: ELSE" << std::endl;
            break;
        case IF:
            std::cout << "Token value: IF" << std::endl;
            break;
        case LOOP:
            std::cout << "Token value: LOOP" << std::endl;
            break;
        case THEN:
            std::cout << "Token value: THEN" << std::endl;
            break;
        case WHILE:
            std::cout << "Token value: WHILE" << std::endl;
            break;
        case NOT:
            std::cout << "Token value: NOT" << std::endl;
            break;
        case PRINT:
            std::cout << "Token value: PRINT" << std::endl;
            break;
        case PRINTLN:
            std::cout << "Token value: PRINTLN" << std::endl;
            break;
        default:
            break;
        }
    } 
}

void flex_lex::token_num(token_class t_class, char *yytext) {

    int yylval;
    switch (t_class)
    {
    case NUMBER:
        yylval = atoi(yytext); 
        std::cout << "Token class: NUMBER,    Token value: " << yylval << std::endl;
        break;
    case VARIABLE:
        std::cout << "Token class: VARIABLE,  Token value: " << yytext << std::endl; 
        break;
    case TYPE_ID:
        std::cout << "Token class: TYPE_ID,   Token value: " << yytext << std::endl; 
        break;
    default:
        break;
    }
}

