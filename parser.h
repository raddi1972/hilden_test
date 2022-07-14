/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 5 "parser.y"

    #include <iostream>
    extern FILE* yyin;
    extern int yylex();
    struct Number {
    private:
        int int_val;
    
    public:
        Number(int int_val)
        : int_val(int_val) {}

        int get_int_val() {
            return this->int_val;
        }
    };

#line 66 "parser.h"

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IDENTIFIER = 258,
    VAL_HINT = 259,
    KEY_HINT = 260,
    KEY_HFLOAT = 261,
    KEY_HCHAR = 262,
    KEY_HSTRING = 263,
    KEY_HIF = 264,
    OP_SEMI_COL = 265,
    OP_EQUALS = 266,
    OP_PLUS = 267,
    OP_MINUS = 268,
    OP_MULT = 269,
    OP_DIV = 270,
    OP_AND = 271,
    OP_OR = 272,
    OP_LESS_EQUAL = 273,
    OP_GREAT_EQUAL = 274,
    OP_DOUB_EQUAL = 275,
    OP_NOT_EQUAL = 276,
    OP_LESS_THAN = 277,
    OP_GREATER_THAN = 278,
    OP_NOT = 279,
    OP_OPEN_PAREN = 280,
    OP_CLOSE_PAREN = 281,
    OP_OPEN_CURLY = 282,
    OP_CLOSE_CURLY = 283,
    OP_COMMA = 284
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 23 "parser.y"

    Number *num;

#line 111 "parser.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_H_INCLUDED  */
