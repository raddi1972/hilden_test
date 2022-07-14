%{
    extern int yyerror(char* s);
%}

%code requires {
    #include <iostream>
    extern FILE* yyin;
    extern int yylex();
    #include "Number.hh"
}

%union {
    Number *num;
}

%token IDENTIFIER
%token 
    <num> VAL_HINT
    <num> VAL_HFLOAT
    <num> VAL_HCHAR
    <num> VAL_HSTRING

%token
    KEY_HINT "hint"
    KEY_HFLOAT "hfloat"
    KEY_HCHAR "hchar"
    KEY_HSTRING "hstring"
    KEY_HIF "hif"

%token
    OP_SEMI_COL ";"
    OP_EQUALS "="
    OP_PLUS "+"
    OP_MINUS "-"
    OP_MULT "*"
    OP_DIV "/"
    OP_AND "&"
    OP_OR "|"
    OP_LESS_EQUAL "<="
    OP_GREAT_EQUAL ">="
    OP_DOUB_EQUAL "=="
    OP_NOT_EQUAL "!="
    OP_LESS_THAN "<"
    OP_GREATER_THAN ">"
    OP_NOT "!"
    OP_OPEN_PAREN "(" 
    OP_CLOSE_PAREN ")"
    OP_OPEN_CURLY "{"
    OP_CLOSE_CURLY "}"
    OP_COMMA ","

%%

input: 
| stmt ";" input
;

stmt: dec | def | expr;

dec: type ident;

def: dec "=" expr 
| ident "=" expr 
;

expr: expr "&" log
| expr "|" log
| log 
;

log: log "<=" sum
| log ">=" sum
| log "==" sum
| log "!=" sum
| sum
;

sum: sum "+" term
| sum "-" term
| term
;

term: term "*" factor
| term "/" factor
| factor
;

factor: "(" expr ")"
| ident
| fcall
| lit
;

fcall: ident "(" idarg ")";

idarg: expr ',' idarg | expr;

ident: IDENTIFIER{printf("identifier\n");};

lit: VAL_HINT {printf("HINT LITERAL: %d\n", $1->get_int());}
| VAL_HFLOAT {printf("FLOAT LITERAL: %f\n", $1->get_float());}
| VAL_HCHAR { printf("HCHAR LITERAL: %c\n", $1->get_char()); }
| VAL_HSTRING { std::cout << $1->get_string() << std::endl; }
;

type: "hfloat" { printf("hfloat\n"); }
| "hchar" { printf("hchar\n"); }
| "hstring" { printf("hstring\n"); }
| "hint" { printf("hint\n"); }
;

%%

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cout << "Please provide a file" << std::endl;
        return 1;
    }

    FILE* file = fopen(argv[1], "r");

    if(!file) {
        std::cout << "Error" << std::endl;
        return 1;
    }

    yyin = file;

    yyparse();

    return 0;
}


int yyerror(char* s) {
    printf("ERROR: %s\n", s);
    return 0;
}