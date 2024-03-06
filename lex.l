%{
    #include <stdio.h>
    #include <iostream>

    // int chars = 0;
    // int words = 0;
    int lines = 0;
%}
    //yylineno – сохранять номер текущей строки в глобальной переменной yylineno;
%option yylineno 
    //noyywrap – не вызывать по окончании сканирования функцию yywrap();
%option noyywrap

TAB     [ \t\v]+

DIGIT   [0-9]
DIGIT1  [1-9]

SYMS    [a-z]
SYMB    [A-Z]
SYMBD   [a-zA-Z0-9]

%%

{TAB}                /* skip blans and tabs */
"\n"                 {lines++;} 

"+"                  {std::cout << "Token class: OP,        Token value: ADD" << std::endl;}
"-"                  {std::cout << "Token class: OP,        Token value: SUB" << std::endl;}
"*"                  {std::cout << "Token class: OP,        Token value: MUL" << std::endl;}
"/"                  {std::cout << "Token class: OP,        Token value: DIV" << std::endl;}
"%"                  {std::cout << "Token class: OP,        Token value: MOD" << std::endl;}

"("                  {std::cout << "Token class: SYNT_SYM,  Token value: "    << yytext << std::endl;} //Syntactic symbols
")"                  {std::cout << "Token class: SYNT_SYM,  Token value: "    << yytext << std::endl;} 
"{"                  {std::cout << "Token class: SYNT_SYM,  Token value: "    << yytext << std::endl;} 
"}"                  {std::cout << "Token class: SYNT_SYM,  Token value: "    << yytext << std::endl;} 
";"                  {std::cout << "Token class: SYNT_SYM,  Token value: "    << yytext << std::endl;}  


[t][r|R][u|U][e|E]      {std::cout << "Token class: KEYWORD,   Token value: true"  << std::endl;}
[f][a|A][l|L][s|S][e|E] {std::cout << "Token class: KEYWORD,   Token value: false" << std::endl;}

"else"               {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}
"if"                 {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}
"loop"               {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}
"then"               {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}
"while"              {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}
"not"                {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}
"print"              {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}
"println"            {std::cout << "Token class: KEYWORD,   Token value: "    << yytext << std::endl;}

{DIGIT1}{DIGIT}*     {std::cout << "Token class: NUMBER,    Token value: "    << yytext << std::endl;} //число
{DIGIT}              {std::cout << "Token class: NUMBER,    Token value: "    << yytext << std::endl;} //цифра

{SYMS}{SYMBD}*              {std::cout << "Token class: VARIABLE,  Token value: "    << yytext << std::endl;} //Идентификатор объектов
{SYMB}{SYMBD}*[_]*{SYMBD}*  {std::cout << "Token class: TYPE_ID,   Token value: "    << yytext << std::endl;} //Идентификатор типов

["](.|\s)*["]               {std::cout << "Token class: STRING,    Token value: "    << yytext << std::endl;} //строка


\/\*([^*]|(\*+[^*\/]))*\*+\/     {std::cout << "Token class: COMMENT,   Token value: "    << yytext << std::endl;} //многострочный комментарий \/\*(.|\s)*\*\/
\/\/(.|\s)*                      {std::cout << "Token class: COMMENT,   Token value: "    << yytext << std::endl;} //однострочный комментарий

"="                  {std::cout << "Token class: OP,        Token value: ASSIGN" << std::endl;} //Assignment operator


">"                  {std::cout << "Token class: SCOMP_OP,  Token value: "    << yytext << std::endl;} //Comparison operators
"<"                  {std::cout << "Token class: SCOMP_OP,  Token value: "    << yytext << std::endl;}
"=="                 {std::cout << "Token class: SCOMP_OP,  Token value: "    << yytext << std::endl;}
"!="                 {std::cout << "Token class: SCOMP_OP,  Token value: "    << yytext << std::endl;}
">="                 {std::cout << "Token class: SCOMP_OP,  Token value: "    << yytext << std::endl;}
"<="                 {std::cout << "Token class: SCOMP_OP,  Token value: "    << yytext << std::endl;}

"|"                  {std::cout << "Token class: BIT_OP,    Token value: "    << yytext << std::endl;} //Bitwise operations
"&"                  {std::cout << "Token class: BIT_OP,    Token value: "    << yytext << std::endl;}
"^"                  {std::cout << "Token class: BIT_OP,    Token value: "    << yytext << std::endl;}
"<<"                 {std::cout << "Token class: BIT_OP,    Token value: "    << yytext << std::endl;}
">>"                 {std::cout << "Token class: BIT_OP,    Token value: "    << yytext << std::endl;}

"||"                 {std::cout << "Token class: LOGIC_OP,  Token value: "    << yytext << std::endl;} //Logic operators
"&&"                 {std::cout << "Token class: LOGIC_OP,  Token value: "    << yytext << std::endl;}//. - любой символ



%%
int main(int argc, char **argv)
{
    yylex();
    std::cout << "LINES = " << lines << std::endl;
    //std::cout << "LINES = " << lines << "\ntTOKENS = " << words << "\nCHARS = " << chars << std::endl;
    return 0;
}