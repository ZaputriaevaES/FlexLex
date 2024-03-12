%{
    #include "lex.h"
%}
    //yylineno – сохранять номер текущей строки в глобальной переменной yylineno;
%option yylineno 
    //noyywrap – не вызывать по окончании сканирования функцию yywrap();
%option noyywrap

%x in_comment in_string

TAB     [ \t\v]+

DIGIT   [0-9]
DIGIT1  [1-9]

SYMS    [a-z]
SYMB    [A-Z]
SYMBD   [a-zA-Z0-9]

%%

{TAB}           { /* skip blans and tabs */ }
"\n"            { }//lines++; } 

"+"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::ADD); }
"-"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::SUB); }
"*"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::MUL); }
"/"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::DIV); }
"%"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::MOD); } 

"("             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::LRBR); } //Syntactic symbols
")"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::RRBR); } 
"{"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::LFBR); }
"}"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::RFBR); }
";"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::SMCL); } //semicolon


f(?i:alse)      { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::TRUE); }
t(?i:rue)       { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::FALSE); }

(?i:else)       { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::ELSE); }
(?i:if)         { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::IF); }
(?i:loop)       { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::LOOP); }
(?i:then)       { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::THEN); }
(?i:while)      { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::WHILE); }
(?i:not)        { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::NOT); }
(?i:print)      { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::PRINT); }
(?i:println)    { flex_lex::token_opr(flex_lex::token_class::KEYWORD, flex_lex::token_value::PRINTLN); }


{DIGIT1}{DIGIT}*     { flex_lex::token_num(flex_lex::token_class::NUMBER, yytext); } //число
{DIGIT}              { flex_lex::token_num(flex_lex::token_class::NUMBER, yytext); } //цифра

{SYMS}{SYMBD}*              { flex_lex::token_num(flex_lex::token_class::VARIABLE, yytext); } //Идентификатор объектов
{SYMB}{SYMBD}*[_]*{SYMBD}*  { flex_lex::token_num(flex_lex::token_class::TYPE_ID,  yytext); } //Идентификатор типов



"="             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::ASSIGN); }  //Assignment operator

">"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::GTR); }  //Comparison operators
"<"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::LSS); }
"=="            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::EQ); }
"!="            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::NEQ); }
">="            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::GREQ); }
"<="            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::LEQ); }

"|"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::BOR); } //Bitwise operations
"&"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::BAND); }
"^"             { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::BNOR); }
"<<"            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::LSFT); }
">>"            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::RSFT); }

"||"            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::LOR); } //Logic operators
"&&"            { flex_lex::token_opr(flex_lex::token_class::OP, flex_lex::token_value::LAND); }

["](.|\s)*["]               {std::cout << "Token class: STRING,    Token value: "    << yytext << std::endl;} //строка

"/*"                        { BEGIN(in_comment); } //comment start
<in_comment><<EOF>>         { std::cout << "ERROR, comment not closed" << std::endl; yyterminate(); }
<in_comment>[^*/]+ 		    { } //skip // go into comment
<in_comment>"*/"            { BEGIN(INITIAL); } // comment stop

%%