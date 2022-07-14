
%{
    #include <iostream>
    #include "parser.h"
    extern int yylex();
%}

%option noyywrap

%%

[ \t\n] ;
"hfloat" return KEY_HFLOAT;
"hchar" return KEY_HCHAR;
"hint" return KEY_HINT;
"hstring" return KEY_HSTRING;
"hif" return KEY_HIF;

"+" return OP_PLUS;//operator
"-" return OP_MINUS;//operator
"*" return OP_MULT;//operator
"/" return OP_DIV;//operator
"=" return OP_EQUALS;//operator
"!" return OP_NOT;//operator
"<" return OP_LESS_THAN;//operator
">" return OP_GREATER_THAN;//operator
"<=" return OP_LESS_EQUAL; // operator
">=" return OP_GREAT_EQUAL; // operator
"==" return OP_DOUB_EQUAL; // operator
"!=" return OP_NOT_EQUAL; // operator
";" return OP_SEMI_COL; // ends
"," return OP_COMMA;
"(" return OP_OPEN_PAREN;
")" return OP_CLOSE_PAREN;
"{" return OP_OPEN_CURLY;
"}" return OP_CLOSE_CURLY;

[0-9]* {
    Number* num = new Number(atoi(yytext));
    yylval.num = num;
    return VAL_HINT;
}

[a-zA-Z_][a-zA-Z0-9_]* return IDENTIFIER;
%%

