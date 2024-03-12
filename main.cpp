#include "lex.h"

extern int yylineno;
void yylex();


int main(int argc, char **argv)
{
    
    // int chars = 0;
    // int words = 0;
    //int lines = 0;
    yylineno = 1;
    yylex();
    std::cout << "LINES = " << yylineno << std::endl;
    //std::cout << "LINES = " << lines << "\ntTOKENS = " << words << "\nCHARS = " << chars << std::endl;
    return 0;
}